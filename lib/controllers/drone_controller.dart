import 'dart:developer';

import 'package:architech_drone_control_app/models/socket/socket_event.dart';
import 'package:architech_drone_control_app/models/socket/socket_interface.dart';
import 'package:architech_drone_control_app/models/socket/socket_state.dart';
import 'package:architech_drone_control_app/models/socket_messages/geometry_messages/twist.dart';
import 'package:architech_drone_control_app/models/steaming_interface.dart';
import 'package:architech_drone_control_app/utils/helpers/ui_helper.dart';
import 'package:get/get.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:socket_io_client/socket_io_client.dart' as SocketIO;

class DroneController extends GetxController {
  final Rx<String> ipAddress = ''.obs;

  late SocketIO.Socket controlSocket;

  late Player streamingPlayer;
  late VideoController streamingController;
  final Rx<StreamingInterface> streamingInterface =
      StreamingInterface.color.obs;

  /// State
  final Rx<SocketState> socketState = SocketState.disconnected.obs;
  final Rx<bool> isOperator = false.obs;
  final Rx<double> socketTimeDifference = 0.0.obs;

  /// Messages
  final Rx<Twist> twist = Twist().obs;

  @override
  void dispose() {
    controlSocket.close();
    controlSocket.dispose();

    streamingPlayer.dispose();

    super.dispose();
  }

  Future<void> connectDrone(String droneIpAddress) async {
    ipAddress.value = droneIpAddress;

    _connectDroneControlSocket();
    _connectDroneStreaming();
  }

  void _connectDroneControlSocket() {
    controlSocket = SocketIO.io(
        SocketInterface.control.getUrl(ipAddress.value),
        SocketIO.OptionBuilder()
            .setTransports(['websocket'])
            .enableForceNewConnection()
            .build());

    socketState.value = SocketState.connecting;

    controlSocket.onConnect((_) {
      socketState.value = SocketState.connected;
      UiHelper.showToast(UiType.success, message: 'Connected to drone');

      // TODO: Subscribe to required topics
      controlSocket.emit(
          SocketEvent.subscribe.event, {'topic': 'talker'}); //! Testing only
      controlSocket.on('talker', (data) {
        log('Talker: $data');
      });
    });

    controlSocket.on(SocketEvent.connectionInfo.event, (data) {
      try {
        isOperator.value = data['operator_sid'] == controlSocket.id;
        socketTimeDifference.value = data['timestamp'] -
            (DateTime.now().millisecondsSinceEpoch / 1000.0);

        log('isOperator: ${isOperator.value} | connectionsCount: ${data['connections_count']} | socketTime: ${socketTimeDifference.value}');
      } catch (e) {
        isOperator.value = false;

        log('Error: $e');
      }
    });

    controlSocket.onDisconnect((_) {
      socketState.value = SocketState.disconnected;
      UiHelper.showSnackbar(UiType.error, message: 'Disconnected from drone');
    });

    controlSocket.connect();
  }

  void _connectDroneStreaming() {
    streamingPlayer = Player();
    streamingPlayer
        .open(Media(streamingInterface.value.getUrl(ipAddress.value)));

    streamingController = VideoController(
      streamingPlayer,
      configuration: const VideoControllerConfiguration(
        enableHardwareAcceleration: true,
      ),
    );
  }

  void changeStreamingInterface(StreamingInterface interface) {
    if (interface == streamingInterface.value) {
      return;
    }

    streamingPlayer.open(Media(interface.getUrl(ipAddress.value)));

    streamingInterface.value = interface;
  }

  void disconnectDrone() {
    controlSocket.disconnect();
  }

  void movement({
    double? linearX,
    double? linearY,
    double? linearZ,
    double? angularX,
    double? angularY,
    double? angularZ,
  }) {
    twist.value = twist.value.copyWith(
      linear: twist.value.linear.copyWith(
        x: linearX,
        y: linearY,
        z: linearZ,
      ),
      angular: twist.value.angular.copyWith(
        x: angularX,
        y: angularY,
        z: angularZ,
      ),
    );

    controlSocket.emit(SocketEvent.publish.event, {
      'timestamp': (DateTime.now().millisecondsSinceEpoch / 1000.0) +
          socketTimeDifference.value,
      'topic': 'movement',
      'message': twist.value.toJson(),
    });
  }
}
