import 'package:flutter/material.dart';

class GlobalPadding extends StatelessWidget {
  final Widget child;
  const GlobalPadding({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: child,
    );
  }
}