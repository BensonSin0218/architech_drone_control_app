import 'package:flutter/material.dart';

class AppProgressIndicator extends StatelessWidget {
  const AppProgressIndicator({
    required this.value,
    this.displayText,
    this.progressIndicatorWidth = 200.0,
    this.progressIndicatorMinHeight = 8.0,
    super.key,
  });

  final double value;
  final String? displayText;
  final double progressIndicatorWidth;
  final double progressIndicatorMinHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (displayText != null && displayText!.isNotEmpty) ...[
          Text(displayText!),
          const SizedBox(height: 4.0),
        ],
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: progressIndicatorWidth,
          ),
          child: LinearProgressIndicator(
            value: value,
            minHeight: progressIndicatorMinHeight,
            borderRadius: BorderRadius.all(
                Radius.circular(progressIndicatorMinHeight / 2.0)),
          ),
        ),
      ],
    );
  }
}
