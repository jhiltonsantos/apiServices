import 'package:api_service_app/controllers/services_controller.dart';
import 'package:api_service_app/core/layout_app.dart';
import 'package:api_service_app/models/service_model.dart';
import 'package:api_service_app/pages/edit_service_page.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class DetailPage extends StatefulWidget {
  final Service service;
  final String id;
  const DetailPage({Key? key, required this.service, required this.id})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final ApiController api = ApiController();
  @override
  Widget build(BuildContext context) {
    Layout layout = Layout(title: widget.service.title);
    return layout.render(context,
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
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditServicePage(services: service),
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
