import 'package:api_service_app/core/colors.dart';
import 'package:flutter/material.dart';

class TextEditField extends StatelessWidget {
  const TextEditField({
    Key? key,
    required TextEditingController titleController,
    required this.title,
  })  : _titleController = titleController,
        super(key: key);

  final TextEditingController _titleController;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        controller: _titleController,
        autofocus: true,
        keyboardType: title == 'Valor'
            ? TextInputType.number
            : (title == 'Data' || title == 'Prazo'
                ? TextInputType.datetime
                : TextInputType.text),
        cursorColor: secondaryText,
        decoration: InputDecoration(
          labelText: title,
          floatingLabelStyle:
              const TextStyle(color: appBarTextColor, fontSize: 18.0),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: appBarTextColor),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              style: BorderStyle.solid,
              color: appBarTextColor,
            ),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Por favor, insira um $title';
          }
          return null;
        },
      ),
    );
  }
}
