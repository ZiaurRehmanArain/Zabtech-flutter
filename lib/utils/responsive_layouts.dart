import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileView;
  final Widget desktopView;
  ResponsiveLayout(
      {super.key, required this.mobileView, required this.desktopView});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth >= 500) {
          return desktopView;
        }else{
        return mobileView;
        }
      },
    );
  }
}
