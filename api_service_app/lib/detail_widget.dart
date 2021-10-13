import 'package:api_service_app/controllers/api_controller.dart';
import 'package:api_service_app/edit_service_widget.dart';
import 'package:api_service_app/models/service.dart';
import 'package:api_service_app/utilities/layout.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class DetailWidget extends StatefulWidget {
  final Service service;
  final String id;
  const DetailWidget({Key? key, required this.service, required this.id})
      : super(key: key);

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  final ApiController api = ApiController();
  @override
  Widget build(BuildContext context) {
    return Layout.render(context,
        child: Column(
          children: <Widget>[
            Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  children: [
                    const Text(
                      'Titulo:',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      widget.service.title,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                )),
            Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  children: [
                    const Text(
                      'Descricao:',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      widget.service.description,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                )),
            Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  children: [
                    const Text(
                      'Valor:',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      widget.service.value.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                )),
            Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  children: [
                    const Text(
                      'Data:',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      widget.service.dateRegister,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                )),
            Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  children: [
                    const Text(
                      'Data final:',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      widget.service.deadline,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                )),
            Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  children: [
                    const Text(
                      'Status:',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      widget.service.status,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                )),
            Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  children: [
                    const Text(
                      'Comment:',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      widget.service.comment,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                )),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _navigateToEditPage(context, widget.service);
                    },
                    child: const Text('Editar'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _alertBoxDelete(context);
                    },
                    child: const Text('Deletar'),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  _navigateToEditPage(BuildContext context, Service service) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditServiceWidget(services: service),
      ),
    );
  }

  Future<dynamic> _alertBoxDelete(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Deletar serviço'),
          content:
              const Text('Você tem certeza que deseja deletar este serviço?'),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Cancelar',
                style: TextStyle(color: GFColors.ALT),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Deletar',
                style: TextStyle(color: GFColors.DANGER),
              ),
              onPressed: () {
                api.deleteService(widget.id);
                Navigator.popUntil(
                  context,
                  ModalRoute.withName(Navigator.defaultRouteName),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
