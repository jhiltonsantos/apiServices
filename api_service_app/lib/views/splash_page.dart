import 'package:api_service_app/controllers/service_controller.dart';
import 'package:api_service_app/utilities/layout.dart';
import 'package:flutter/material.dart';
import 'package:api_service_app/views/home_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:getwidget/colors/gf_color.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static String tag = 'splash-page';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var services = ServiceController();
  @override
  void initState() {
    super.initState();
    getAllData();
  }

  void getAllData() async {
    var servicesData = await services.getServices();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Layout.render(
      context,
      child: const Center(
        child: SpinKitThreeBounce(
          size: 50.0,
          color: GFColors.FOCUS,
        ),
      ),
    );
  }
}
