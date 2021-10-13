import 'package:api_service_app/utilities/colors.dart';
import 'package:api_service_app/utilities/layout.dart';
import 'package:api_service_app/views/home_page.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatelessWidget {
  static String tag = 'create-page';

  const CreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var content = Column(
      children: <Widget>[
        Container(
          height: 100,
          color: primaryPurple,
          child: const Center(
            child: Text(
              'Criar novo serviço',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );

    return Layout.render(
      context,
      child: content,
    );
  }
}
