import 'package:flutter/material.dart';

class SafeScaffold extends StatelessWidget {
  // Variables

  final Widget body;
  final PreferredSizeWidget? appBar;
  final bool extendBodyBehindAppBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Color? backgroundColor;

  // Constructor

  const SafeScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.extendBodyBehindAppBar = false,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.backgroundColor,
  });

  // Build

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      body: SafeArea(child: body),
    );
  }
}
