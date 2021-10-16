import 'package:api_service_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';
import 'package:getwidget/getwidget.dart';

class Layout {
  Layout({required this.title});
  late String title;

  Widget render(BuildContext context,
      {required Widget child,
      Widget? floatingActionButton,
      GFIconButton? iconButton}) {
    return Scaffold(
      appBar: GFAppBar(
        backgroundColor: primaryColor,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        leading: iconButton,
      ),
      backgroundColor: primaryBrown,
      body: Center(
        child: child,
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
