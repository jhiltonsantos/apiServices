import 'package:api_service_app/controllers/services_controller.dart';
import 'package:api_service_app/core/layout_app.dart';
import 'package:api_service_app/models/service_model.dart';
import 'package:flutter/material.dart';

enum Status { aberto, fechado, cancelado }

class AddServicePage extends StatefulWidget {
  const AddServicePage({Key? key}) : super(key: key);

  @override
  _AddServicePageState createState() => _AddServicePageState();
}

class _AddServicePageState extends State<AddServicePage> {
  _AddServicePageState();

  final ApiController api = ApiController();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _valueController = TextEditingController();
  final _dateController = TextEditingController();
  final _deadlineController = TextEditingController();
  String statusController = 'Aberto';
  Status _status = Status.aberto;
  final _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Layout layout = Layout(title: 'Adicionar Serviço');
    return layout.render(
      context,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        width: double.infinity,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: <Widget>[
            Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(children: <Widget>[
                  const Text('Titulo'),
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      hintText: 'Titulo',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, digite um titulo';
                      }
                      return null;
                    },
                  ),
                ])),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Column(children: <Widget>[
                const Text('Descrição'),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    hintText: 'Descrição',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, digite uma descrição';
                    }
                    return null;
                  },
                ),
              ]),
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  children: [
                    const Text('Valor'),
                    TextFormField(
                      controller: _valueController,
                      decoration: const InputDecoration(
                        hintText: 'Valor',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, digite um valor';
                        }
                        return null;
                      },
                    ),
                  ],
                )),
            Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  children: [
                    const Text('Data'),
                    TextFormField(
                      controller: _dateController,
                      decoration: const InputDecoration(
                        hintText: 'Data',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, digite uma data';
                        }
                        return null;
                      },
                    ),
                  ],
                )),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Column(
                children: [
                  const Text('Prazo'),
                  TextFormField(
                    controller: _deadlineController,
                    decoration: const InputDecoration(
                      hintText: 'Prazo',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, digite um prazo';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Column(
                children: <Widget>[
                  const Text('Status'),
                  ListTile(
                    title: const Text('Aberto'),
                    leading: Radio(
                      value: Status.aberto,
                      groupValue: _status,
                      onChanged: (statusValue) {
                        setState(() {
                          _status = Status.aberto;
                          statusController = 'Aberto';
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Fechado'),
                    leading: Radio(
                      value: Status.fechado,
                      groupValue: _status,
                      onChanged: (statusValue) {
                        setState(() {
                          _status = Status.fechado;
                          statusController = 'Fechado';
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Cancelado'),
                    leading: Radio(
                      value: Status.cancelado,
                      groupValue: _status,
                      onChanged: (statusValue) {
                        setState(() {
                          _status = Status.cancelado;
                          statusController = 'Cancelado';
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Column(
                children: <Widget>[
                  const Text('Comentário'),
                  TextFormField(
                    controller: _commentController,
                    decoration: const InputDecoration(
                      hintText: 'Comentário',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, digite um comentário';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      api.createService(Service(
                        id: '',
                        title: _titleController.text,
                        description: _descriptionController.text,
                        value: _valueController.text,
                        dateRegister: _dateController.text,
                        deadline: _deadlineController.text,
                        status: statusController,
                        comment: _commentController.text,
                      ));
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Salvar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
