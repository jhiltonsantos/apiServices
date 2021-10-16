import 'package:api_service_app/core/colors.dart';
import 'package:api_service_app/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/getwidget.dart';

import '../../models/service_model.dart';

class ServicesList extends StatelessWidget {
  final List<Service> services;
  const ServicesList({Key? key, required this.services}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: services.isEmpty ? 0 : services.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailPage(
                service: services[index],
                id: services[index].id,
              );
            }));
          },
          child: GFListTile(
            icon: services[index].status == 'Aberto'
                ? const Icon(Icons.schedule_outlined,
                    color: primaryText, size: 30)
                : (services[index].status == 'Fechado'
                    ? const Icon(Icons.task_alt_outlined,
                        color: primaryText, size: 30)
                    : const Icon(Icons.warning_amber_outlined,
                        color: primaryText, size: 30)),
            color: primaryPurple,
            margin: EdgeInsets.fromLTRB(20, (index == 0) ? 20 : 5, 20, 10),
            titleText: services[index].title,
            subTitleText: services[index].description,
          ),
        );
      },
    );
  }
}
