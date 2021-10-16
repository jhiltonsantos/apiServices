import 'package:api_service_app/controllers/services_controller.dart';
import 'package:api_service_app/core/layout_app.dart';
import 'package:api_service_app/models/service_model.dart';
import 'package:api_service_app/widgets/text_edit_field_widget.dart';
import 'package:flutter/material.dart';

class EditServicePage extends StatefulWidget {
  final Service services;
  const EditServicePage({Key? key, required this.services}) : super(key: key);

  @override
  _EditServicePageState createState() => _EditServicePageState();
}

enum Status { aberto, fechado, cancelado }

class _EditServicePageState extends State<EditServicePage> {
  _EditServicePageState();

  final ApiController api = ApiController();
  final _updateFormKey = GlobalKey<FormState>();
  String id = '';
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _valueController = TextEditingController();
  final _dateRegisterController = TextEditingController();
  final _deadlineController = TextEditingController();
  String statusController = 'Aberto';
  Status _status = Status.aberto;
  final _commentController = TextEditingController();

  @override
  void initState() {
    id = widget.services.id;
    _titleController.text = widget.services.title;
    _descriptionController.text = widget.services.description;
    _valueController.text = widget.services.value;
    _dateRegisterController.text = widget.services.dateRegister;
    _deadlineController.text = widget.services.deadline;
    if (widget.services.status == 'Aberto') {
      _status = Status.aberto;
      statusController = 'Aberto';
    } else if (widget.services.status == 'Fechado') {
      _status = Status.fechado;
      statusController = 'Fechado';
    } else {
      _status = Status.cancelado;
      statusController = 'Cancelado';
    }
    _commentController.text = widget.services.comment;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Layout layout = Layout(title: 'Editar Serviço');
    return layout.render(
      context,
      child: Form(
        key: _updateFormKey,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          width: double.infinity,
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10.0),
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    TextEditField(
                      titleController: _titleController,
                      title: 'Titulo',
                    ),
                    TextEditField(
                      titleController: _descriptionController,
                      title: 'Descrição',
                    ),
                    TextEditField(
                      titleController: _valueController,
                      title: 'Valor',
                    ),
                    TextEditField(
                      titleController: _dateRegisterController,
                      title: 'Data',
                    ),
                    TextEditField(
                      titleController: _deadlineController,
                      title: 'Prazo',
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
                    TextEditField(
                        titleController: _commentController,
                        title: 'Comentário'),
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
                                  status: statusController,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
