import 'package:api_service_app/models/service.dart';
import 'package:api_service_app/utilities/constants.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiController {
  final String apiURL = apiServicesURL;
  final Uri apiUri = Uri.parse(apiServicesURL);

  // Pegar todos os serviços
  Future<List<Service>> getAllServices() async {
    http.Response res = await http.get(apiUri);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Service> services =
          body.map((dynamic item) => Service.fromJson(item)).toList();
      return services;
    } else {
      throw "Não foi possível carregar os serviços.";
    }
  }

  // Pegar serviço por ID
  Future<Service> getServiceById(String id) async {
    final res = await http.get(Uri.parse('$apiURL/$id'));

    if (res.statusCode == 200) {
      return Service.fromJson(jsonDecode(res.body));
    } else {
      throw "Não foi possível carregar o serviço.";
    }
  }

  // Adicionar serviço
  Future<Service> createService(Service service) async {
    Map data = {
      'title': service.title,
      'description': service.description,
      'value': service.value,
      'date_register': service.dateRegister,
      'deadline': service.deadline,
      'status': service.status,
      'comment': service.comment
    };

    final http.Response res = await http.post(
      apiUri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (res.statusCode == 200) {
      return Service.fromJson(jsonDecode(res.body));
    } else {
      throw "Não foi possível adicionar o serviço.";
    }
  }

  // Atualizar serviço
  Future<Service> updateService(String id, Service service) async {
    Map data = {
      'title': service.title,
      'description': service.description,
      'value': service.value,
      'date_register': service.dateRegister,
      'deadline': service.deadline,
      'status': service.status,
      'comment': service.comment
    };

    final urlById = Uri.parse('$apiURL/$id');
    final res = await http.put(
      urlById,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (res.statusCode == 200) {
      return Service.fromJson(jsonDecode(res.body));
    } else {
      throw "Não foi possível atualizar o serviço.";
    }
  }

  // Deletar serviço
  Future<void> deleteService(String id) async {
    http.Response res = await http.delete(Uri.parse('$apiURL/$id'));

    if (res.statusCode == 200) {
      return;
    } else {
      throw "Não foi possível deletar o serviço.";
    }
  }

  getServices() {}
}
