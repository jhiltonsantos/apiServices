import 'package:api_service_app/controllers/services_controller.dart';
import 'package:api_service_app/core/layout_app.dart';
import 'package:api_service_app/models/service_model.dart';
import 'package:api_service_app/widgets/button_save_widget.dart';
import 'package:api_service_app/widgets/text_add_field_widget.dart';
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
            TextAddField(
              titleController: _titleController,
              title: 'Título',
            ),
            TextAddField(
              titleController: _descriptionController,
              title: 'Descrição',
            ),
            TextAddField(
              titleController: _valueController,
              title: 'Valor',
            ),
            TextAddField(
              titleController: _dateController,
              title: 'Data',
            ),
            TextAddField(
              titleController: _deadlineController,
              title: 'Prazo',
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Column(
                children: <Widget>[
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Status',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
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
            TextAddField(
              titleController: _commentController,
              title: 'Comentário',
            ),
            const SizedBox(height: 20.0),
            ButtonSave(
              title: 'Salvar',
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
            ),
          ],
        ),
      ),
    );
  }
}
