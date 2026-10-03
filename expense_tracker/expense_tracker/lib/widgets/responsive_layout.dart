import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.landscape,
  });
  final Widget mobile;
  final Widget tablet;
  final Widget landscape;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.landscape) {
      return landscape;
    } else if (width >= 600) {
      return tablet;
    } else {
      return mobile;
    }
  }
}