import 'package:api_service_app/core/colors.dart';
import 'package:flutter/material.dart';

class ButtonSave extends StatelessWidget {
  const ButtonSave({
    Key? key,
    this.onPressed,
    required this.title,
  }) : super(key: key);

  final onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        child: Text(
          title,
          style: const TextStyle(color: primaryBrown, fontSize: 16.0),
        ),
        style: ElevatedButton.styleFrom(
          onPrimary: primaryBrown,
          primary: appBarTextColor,
          onSurface: Colors.grey,
          side: const BorderSide(color: primaryPurple, width: 1),
          elevation: 5.0,
          minimumSize: const Size(120, 50),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
