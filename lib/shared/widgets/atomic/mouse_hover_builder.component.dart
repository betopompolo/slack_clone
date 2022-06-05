import 'package:flutter/material.dart';

class MouseHoverBuilder extends StatefulWidget {
  const MouseHoverBuilder({
    required this.builder,
    Key? key,
  }) : super(key: key);

  final Widget Function(BuildContext context, bool isMouseOver) builder;

  @override
  State<MouseHoverBuilder> createState() => _MouseHoverBuilderState();
}

class _MouseHoverBuilderState extends State<MouseHoverBuilder> {
  bool _isMouseOver = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() {
        _isMouseOver = true;
      }),
      onExit: (event) => setState(() {
        _isMouseOver = false;
      }),
      child: widget.builder(context, _isMouseOver),
    );
  }
}
