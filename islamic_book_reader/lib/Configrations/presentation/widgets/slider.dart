import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {

  final double value;
  final ValueChanged<double> onChanged;
  final double min;
  final double max;
  final String label;

  CustomSlider({
    required this.value,
    required this.onChanged,
    required this.min,
    required this.max,
    required this.label,
    
  });
  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {

  @override
  Widget build(BuildContext context) {
  // int _currentSliderValue = widget.value.toInt();

    return Column(
      children: <Widget>[
        Text(
          '${widget.label}: ${widget.value.toStringAsFixed(1)} ',
          style: TextStyle(fontSize: 20),
        ),
        Text("مثالی متن",style: TextStyle(fontSize: widget.value, fontFamily: 'AlviNastaleeq')),
        Slider(
          value: widget.value,
          onChanged: widget.onChanged,
          min: widget.min,
          max: widget.max,
          divisions: 12,
        ),
      ],
    );
  }
}