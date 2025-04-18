// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class CustomSliderProgress extends StatefulWidget {
  const CustomSliderProgress({
    super.key,
    this.width,
    this.height,
    required this.minValue,
    required this.maxValue,
    required this.currentValue,
    required this.valueChanged,
    required this.sliderColor,
    required this.progressColor,
    required this.thumbColor,
    required this.trackHeight,
    required this.thumbRadius,
  });

  final double? width;
  final double? height;
  final int minValue;
  final int maxValue;
  final int currentValue;
  final Future Function(int onChanged) valueChanged;
  final Color sliderColor;
  final Color progressColor;
  final Color thumbColor;
  final double trackHeight;
  final double thumbRadius;

  @override
  State<CustomSliderProgress> createState() => _CustomSliderProgressState();
}

class _CustomSliderProgressState extends State<CustomSliderProgress> {
  late int _currentValue;
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.currentValue;
  }

  @override
  void didUpdateWidget(covariant CustomSliderProgress oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_isDragging && oldWidget.currentValue != widget.currentValue) {
      _currentValue = widget.currentValue;
    }
  }

  Future<void> _handleValueChanged(double newValue) async {
    final int roundedValue =
        newValue.round().clamp(widget.minValue, widget.maxValue);
    if (roundedValue != _currentValue) {
      setState(() {
        _currentValue = roundedValue;
      });
      await widget.valueChanged(_currentValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    final effectiveWidth = widget.width ?? MediaQuery.of(context).size.width;
    final effectiveHeight = widget.height ?? widget.thumbRadius * 2;

    return SizedBox(
      width: effectiveWidth,
      height: effectiveHeight,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          // Barra de fondo
          Container(
            height: widget.trackHeight,
            width: effectiveWidth,
            decoration: BoxDecoration(
              color: widget.sliderColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(widget.trackHeight / 2),
            ),
          ),

          // Barra de progreso
          AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            height: widget.trackHeight,
            width: (_currentValue - widget.minValue) /
                (widget.maxValue - widget.minValue) *
                effectiveWidth,
            decoration: BoxDecoration(
              color: widget.progressColor,
              borderRadius: BorderRadius.circular(widget.trackHeight / 2),
            ),
          ),

          // Control deslizable
          Positioned(
            left: ((_currentValue - widget.minValue) /
                    (widget.maxValue - widget.minValue) *
                    effectiveWidth) -
                widget.thumbRadius,
            child: GestureDetector(
              onHorizontalDragStart: (_) {
                setState(() {
                  _isDragging = true;
                });
              },
              onHorizontalDragUpdate: (details) {
                final box = context.findRenderObject() as RenderBox;
                final localPosition = box.globalToLocal(details.globalPosition);
                double newValue = (localPosition.dx / box.size.width) *
                        (widget.maxValue - widget.minValue) +
                    widget.minValue;
                _handleValueChanged(newValue);
              },
              onHorizontalDragEnd: (_) {
                setState(() {
                  _isDragging = false;
                });
              },
              child: Container(
                width: widget.thumbRadius * 2,
                height: widget.thumbRadius * 2,
                decoration: BoxDecoration(
                  color: widget.thumbColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
