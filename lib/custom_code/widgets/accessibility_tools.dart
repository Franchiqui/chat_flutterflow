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

import 'package:accessibility_tools/accessibility_tools.dart';

import 'package:flutter/scheduler.dart';

class AccessibilityTools extends StatefulWidget {
  const AccessibilityTools({
    super.key,
    this.width,
    this.height,
    required this.enableButtonsDrag,
    required this.checkFontOverflows,
    required this.checkImageLabels,
    required this.buttonsAlignment,
    this.checkTextContrast = true,
    this.checkTapTargets = true,
    this.contrastRatioThreshold = 4.5,
    required this.child,
  });

  final double? width;
  final double? height;
  final bool enableButtonsDrag;
  final bool checkFontOverflows;
  final bool checkImageLabels;
  final Future Function(bool bottomRight) buttonsAlignment;
  final bool checkTextContrast;
  final bool checkTapTargets;
  final double contrastRatioThreshold;
  final Widget child;

  @override
  State<AccessibilityTools> createState() => _AccessibilityToolsState();
}

enum ButtonsAlignment {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
}

class _AccessibilityToolsState extends State<AccessibilityTools> {
  bool _showTools = false;
  late ThemeData _currentTheme;
  bool _isDarkMode = false;

  get kDebugMode => null;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _currentTheme = Theme.of(context);
    _isDarkMode = _currentTheme.brightness == Brightness.dark;
  }

  // Función para verificar contraste de colores
  double _calculateContrast(Color color1, Color color2) {
    final luminance1 = color1.computeLuminance();
    final luminance2 = color2.computeLuminance();
    return (max(luminance1, luminance2) + 0.05) /
        (min(luminance1, luminance2) + 0.05);
  }

  // Widget para mostrar el panel de herramientas
  Widget _buildToolsPanel() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _currentTheme.cardColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Accessibility Tools',
              style: _currentTheme.textTheme.titleMedium),
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text('Enable Drag'),
            value: widget.enableButtonsDrag,
            onChanged: null, // Solo visualización
          ),
          SwitchListTile(
            title: const Text('Check Font Overflows'),
            value: widget.checkFontOverflows,
            onChanged: null,
          ),
          SwitchListTile(
            title: const Text('Check Image Labels'),
            value: widget.checkImageLabels,
            onChanged: null,
          ),
          SwitchListTile(
            title: const Text('Check Text Contrast'),
            value: widget.checkTextContrast,
            onChanged: null,
          ),
          Text('Current Theme: ${_isDarkMode ? 'Dark' : 'Light'}'),
          Text(
              'Contrast Threshold: ${widget.contrastRatioThreshold.toStringAsFixed(1)}:1'),
        ],
      ),
    );
  }

  // Widget para el botón flotante
  Widget _buildFloatingButton() {
    return FloatingActionButton(
      mini: true,
      backgroundColor: _currentTheme.colorScheme.primary,
      onPressed: () => setState(() => _showTools = !_showTools),
      child: Icon(
        _showTools ? Icons.close : Icons.accessibility,
        color: _currentTheme.colorScheme.onPrimary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,

        // Solo mostrar en modo debug
        if (kDebugMode) ...[
          Positioned(
            top: widget.buttonsAlignment == ButtonsAlignment.topLeft ||
                    widget.buttonsAlignment == ButtonsAlignment.topRight
                ? 16
                : null,
            bottom: widget.buttonsAlignment == ButtonsAlignment.bottomLeft ||
                    widget.buttonsAlignment == ButtonsAlignment.bottomRight
                ? 16
                : null,
            left: widget.buttonsAlignment == ButtonsAlignment.topLeft ||
                    widget.buttonsAlignment == ButtonsAlignment.bottomLeft
                ? 16
                : null,
            right: widget.buttonsAlignment == ButtonsAlignment.topRight ||
                    widget.buttonsAlignment == ButtonsAlignment.bottomRight
                ? 16
                : null,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (_showTools) _buildToolsPanel(),
                const SizedBox(height: 8),
                _buildFloatingButton(),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

// Implementación de los temas
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
