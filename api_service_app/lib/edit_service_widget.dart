import 'package:api_service_app/controllers/api_controller.dart';
import 'package:api_service_app/models/service.dart';
import 'package:api_service_app/utilities/layout.dart';
import 'package:flutter/material.dart';

class EditServiceWidget extends StatefulWidget {
  final Service services;
  const EditServiceWidget({Key? key, required this.services}) : super(key: key);

  @override
  _EditServiceWidgetState createState() => _EditServiceWidgetState();
}

class _EditServiceWidgetState extends State<EditServiceWidget> {
  _EditServiceWidgetState();

  final ApiController api = ApiController();
  final _updateFormKey = GlobalKey<FormState>();
  String id = '';
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _valueController = TextEditingController();
  final _dateRegisterController = TextEditingController();
  final _deadlineController = TextEditingController();
  final _statusController = TextEditingController();
  final _commentController = TextEditingController();

  @override
  void initState() {
    id = widget.services.id;
    _titleController.text = widget.services.title;
    _descriptionController.text = widget.services.description;
    _valueController.text = widget.services.value;
    _dateRegisterController.text = widget.services.dateRegister;
    _deadlineController.text = widget.services.deadline;
    _statusController.text = widget.services.status;
    _commentController.text = widget.services.comment;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout.render(
      context,
      child: Form(
        key: _updateFormKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Card(
                child: Container(
              padding: const EdgeInsets.all(10.0),
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  const Text('Titulo'),
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Titulo',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, insira um titulo';
                      }
                      return null;
                    },
                  ),
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
                            controller: _dateRegisterController,
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
                            if (_updateFormKey.currentState!.validate()) {
                              _updateFormKey.currentState!.save();
                              api.createService(Service(
                                id: '',
                                title: _titleController.text,
                                description: _descriptionController.text,
                                value: _valueController.text,
                                dateRegister: _dateRegisterController.text,
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
            )),
          ),
        ),
      ),
    );
  }
}
