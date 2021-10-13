import 'package:api_service_app/utilities/constants.dart';
import 'network.dart';

class ServiceController {
  Future<dynamic> getServices() async {
    var urlServices = Uri.parse(apiServicesURL);
    Network network = Network();
    return await network.getData(urlServices);
  }
}
