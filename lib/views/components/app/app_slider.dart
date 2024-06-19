import 'package:flutter/material.dart';

class AppSlider extends StatelessWidget {
  const AppSlider({
    required this.value,
    required this.min,
    required this.max,
    this.divisions,
    required this.onChanged,
    this.displayValue,
    super.key,
  });

  final double value;
  final double min;
  final double max;
  final int? divisions;
  final Function(double) onChanged;
  final String? displayValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Slider(
            value: value,
            min: min,
            max: max,
            divisions: divisions,
            onChanged: (value) => onChanged(value),
          ),
        ),
        if (displayValue != null && displayValue!.isNotEmpty) ...[
          SizedBox(
            width: 48.0,
            child: Text(
              displayValue!,
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ]
      ],
    );
  }
}
