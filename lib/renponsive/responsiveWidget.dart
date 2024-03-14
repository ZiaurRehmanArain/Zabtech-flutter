import 'package:flutter/material.dart';
import 'package:listviewapp/renponsive/desktopView.dart';
import 'package:listviewapp/renponsive/mobileView.dart';
import 'package:listviewapp/utils/responsive_layouts.dart';

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileView: MobileView(), desktopView: DesktopView());
  }
}