import 'package:api_service_app/models/service.dart';
import 'package:api_service_app/utilities/layout.dart';
import 'package:flutter/material.dart';

class ServicePage extends StatefulWidget {
  final Service service;
  const ServicePage({Key? key, required this.service}) : super(key: key);

  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    return Layout.render(
      context,
      child: const Center(
        child: Text('ServicePage'),
      ),
    );
  }
}
