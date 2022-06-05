import 'package:flutter/material.dart';

class HighlightContainer extends StatelessWidget {
  const HighlightContainer({
    required this.child,
    required this.isHighlighted,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isHighlighted ? Colors.grey.shade800 : null,
      child: child,
    );
  }
}
