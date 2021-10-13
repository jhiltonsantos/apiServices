import 'dart:convert';

import 'package:http/http.dart' as http;

class Network {
  Future getData(Uri url) async {
    http.Response getDataApi = await http.get(url);
    if (getDataApi.statusCode == 200) {
      return jsonDecode(getDataApi.body);
    } else {
      throw Exception(getDataApi.statusCode);
    }
  }
}