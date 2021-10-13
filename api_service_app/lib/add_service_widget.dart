import 'package:api_service_app/controllers/api_controller.dart';
import 'package:api_service_app/models/service.dart';
import 'package:api_service_app/utilities/layout.dart';
import 'package:flutter/material.dart';

enum Status { aberto, fechado, cancelado }

class AddServiceWidget extends StatefulWidget {
  const AddServiceWidget({Key? key}) : super(key: key);

  @override
  _AddServiceWidgetState createState() => _AddServiceWidgetState();
}

class _AddServiceWidgetState extends State<AddServiceWidget> {
  _AddServiceWidgetState();

  final ApiController api = ApiController();
  final _addFormKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _valueController = TextEditingController();
  final _dateController = TextEditingController();
  final _deadlineController = TextEditingController();
  final _statusController = TextEditingController();
  final _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Layout.render(context,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          width: double.infinity,
          child: Column(
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
                    TextFormField(
                      controller: _statusController,
                      decoration: const InputDecoration(
                        hintText: 'Status',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, digite um status';
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
                        if (_addFormKey.currentState!.validate()) {
                          _addFormKey.currentState!.save();
                          api.createService(Service(
                            id: '',
                            title: _titleController.text,
                            description: _descriptionController.text,
                            value: _valueController.text,
                            dateRegister: _dateController.text,
                            deadline: _deadlineController.text,
                            status: _statusController.text,
                            comment: _commentController.text,
                          ));
                          Navigator.pop(context);
                        }
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
        ));
  }
}
