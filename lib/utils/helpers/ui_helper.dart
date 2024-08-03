import 'package:architech_drone_control_app/models/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

part 'package:architech_drone_control_app/models/ui_helper/ui_type.dart';

class UiHelper {
  static Future<dynamic> showDialog({
    required Widget child,
    bool barrierDismissible = true,
    double widthScale = 0.75,
    double heightScale = 0.9,
    double padding = 16.0,
  }) async {
    Size size = MediaQuery.of(Get.context!).size;

    return Get.dialog(
      Dialog(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: size.width * widthScale,
              maxHeight: size.height * heightScale,
            ),
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    child,
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(Get.context!).padding.bottom),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  static void showSnackbar(UiType type, {String? title, String? message}) =>
      Get.snackbar(
        title ?? type.title,
        message ?? '',
        margin: EdgeInsets.zero,
        borderRadius: 0,
        icon: type.icon,
        backgroundColor: Colors.white,
        colorText: type.color,
        shouldIconPulse: false,
      );

  static void showToast(
    UiType type, {
    String? message,
    bool? discardPrevious,
  }) {
    if (discardPrevious ?? false) Fluttertoast.cancel();

    Fluttertoast.showToast(
      msg: message ?? type.title,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: type.color,
    );
  }
}
