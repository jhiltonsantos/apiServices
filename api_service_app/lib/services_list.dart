import 'package:api_service_app/utilities/colors.dart';
import 'package:api_service_app/detail_widget.dart';
import 'package:api_service_app/views/service_page.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/getwidget.dart';

import 'models/service.dart';

class ServicesList extends StatelessWidget {
  final List<Service> services;
  const ServicesList({Key? key, required this.services}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: services.isEmpty ? 0 : services.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailWidget(
                  service: services[index],
                  id: services[index].id,
                );
              }));
            },
            child: GFListTile(
              color: primaryPurple,
              margin: EdgeInsets.fromLTRB(10, (index == 0) ? 10 : 0, 10, 10),
              titleText: services[index].title,
              subTitleText: services[index].description,
            ),
          ),
        );
      },
    );
  }
}
