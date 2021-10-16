import 'package:api_service_app/controllers/services_controller.dart';
import 'package:api_service_app/core/layout_app.dart';
import 'package:api_service_app/models/service_model.dart';
import 'package:api_service_app/core/colors.dart';
import 'package:api_service_app/pages/add_service_page.dart';
import 'package:api_service_app/widgets/services_list_widget.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiController api = ApiController();
  List<Service> servicesList = [];

  @override
  Widget build(BuildContext context) {
    if (servicesList.isEmpty) {
      servicesList = <Service>[];
    }

    Layout layout = Layout(title: 'Serviços');
    return layout.render(context,
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
          backgroundColor: primaryColor,
          onPressed: () {
            _navigateToCreatePage(context);
          },
          child: const Icon(
            Icons.add,
            color: primaryBrown,
          ),
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
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AddServicePage()));
  }
}
