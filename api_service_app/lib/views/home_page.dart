import 'package:api_service_app/add_service_widget.dart';
import 'package:api_service_app/controllers/api_controller.dart';
import 'package:api_service_app/models/service.dart';
import 'package:api_service_app/services_list.dart';
import 'package:api_service_app/views/create_page.dart';
import 'package:api_service_app/utilities/layout.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiController api = ApiController();
  late List<Service> servicesList;

  @override
  Widget build(BuildContext context) {
    if (servicesList.isEmpty) {
      List<Service> servicesList = <Service>[];
    }

    return Layout.render(context,
        child: Center(
          child: FutureBuilder(
            future: loadList(),
            builder: (context, snapshot) {
              return servicesList.isNotEmpty
                  ? ServicesList(services: servicesList)
                  : const Center(
                      child: Text('Sem dados'),
                    );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _navigateToCreatePage(context);
          },
          child: const Icon(Icons.add),
          tooltip: 'Adicionar Serviço',
        ));
  }

  Future loadList() {
    Future<List<Service>> futureServices = api.getAllServices();
    futureServices.then((servicesList) {
      setState(() {
        this.servicesList = servicesList;
      });
    });
    return futureServices;
  }

  _navigateToCreatePage(BuildContext context) async {
    final result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AddServiceWidget()));
  }
}
