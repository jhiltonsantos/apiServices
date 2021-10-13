import 'package:api_service_app/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';
import 'package:getwidget/getwidget.dart';

class Layout {
  static Widget render(BuildContext context,
      {required Widget child,
      Widget? floatingActionButton,
      GFIconButton? iconButton}) {
    return Scaffold(
      appBar: GFAppBar(
        backgroundColor: primaryColor,
        title: const Text(
          'Serviços',
          style: TextStyle(color: Colors.white),
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
