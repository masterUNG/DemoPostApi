import 'package:demopostapi/models/authen_model.dart';
import 'package:demopostapi/models/data_model.dart';
import 'package:demopostapi/utility/app_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppService {
  AppController appController = Get.put(AppController());

  Future<void> processAuthen({required String usercode}) async {
    String urlApi = 'https://ds-event.pkru.ac.th/api/checkuserreq';

    Map<String, dynamic> map = {};
    map['usercode'] = usercode;
    print('map ---> $map');

    Dio dio = Dio();

    // dio.options.headers['Content-Type'] = 'application/json';

    try {
      var result = await dio.post(urlApi, data: map);

      print('result ----> $result');
      AuthenModel authenModel = AuthenModel.fromMap(result.data);

      String urlData = 'https://ds-event.pkru.ac.th/api/studenevent';

      Map<String, dynamic> mapData = {};
      mapData['studentcode'] = usercode;
      mapData['token'] = authenModel.token;
      print('mapData ---> $mapData');

      await dio.post(urlData, data: mapData).then((value) {
        print('value data ----> $value');

        for (var element in value.data) {
          DataModel dataModel = DataModel.fromMap(element);
          appController.dataModels.add(dataModel);
        }
      });
    } on Exception catch (e) {
      Get.snackbar('User Code False or Token Expile', 'Please Try Again',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}
