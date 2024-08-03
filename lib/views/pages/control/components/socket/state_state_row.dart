import 'package:architech_drone_control_app/models/socket/socket_state.dart';
import 'package:flutter/material.dart';

class SocketStateRow extends StatelessWidget {
  const SocketStateRow({
    super.key,
    required this.state,
    this.showText = false,
  });

  final SocketState state;
  final bool showText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('State:'),
        const SizedBox(width: 4.0),
        Container(
          width: 12.0,
          height: 12.0,
          decoration: BoxDecoration(
            color: state.color,
            shape: BoxShape.circle,
          ),
        ),
        if (showText) ...[
          const SizedBox(width: 4.0),
          Text(
            state.name,
            style: TextStyle(
              color: state.color,
            ),
          ),
        ]
      ],
    );
  }
}
