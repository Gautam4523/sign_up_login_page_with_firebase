import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget desktopBody;
  final bool isResponsiveRequired;

  const ResponsiveLayout(
      {Key? key,
      required this.mobileBody,
      required this.desktopBody,
      this.isResponsiveRequired = true})
      : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        if (isResponsiveRequired) {
          if (constrains.maxWidth < 600) {
            return mobileBody;
          } else {
            return desktopBody;
          }
        } else {
          return desktopBody;
        }
      },
    );
  }
}
