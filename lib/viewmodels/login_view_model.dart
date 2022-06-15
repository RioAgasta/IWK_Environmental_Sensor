import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:iwksensor/constants/const.dart';
import 'package:iwksensor/constants/route_name.dart';
import 'package:iwksensor/locator.dart';
import 'package:iwksensor/services/alert_service.dart';
import 'package:iwksensor/services/navigation_service.dart';
import 'package:iwksensor/services/rmq_service.dart';
import 'package:iwksensor/services/storage_service.dart';
import 'package:iwksensor/viewmodels/base_model.dart';
import 'dart:convert' as convert;

class LoginViewModel extends BaseModel {
  TextEditingController userController = TextEditingController();
  TextEditingController hostController = TextEditingController();
  TextEditingController vhostController = TextEditingController();
  TextEditingController queuesSensorController = TextEditingController();
  TextEditingController queuesActuatorController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController guidController = TextEditingController();

  final RmqService _rmqService = locator<RmqService>();
  final StorageService _storageService = locator<StorageService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final AlertService _alertService = locator<AlertService>();


  void getTask() async {
    showData();
  }

  void showData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? data = sharedPreferences.getString('datadevice');

    var result = convert.jsonDecode(data!);

    var guid = result['guid'];
    guidController.text = guid;
    await _storageService.setString(localDataGuid, guid);
    print('[Login Guid] $guid');
  }

  void loginAccount(BuildContext context) async {
    try{
      String user = userController.text;
      String host = hostController.text;
      String vHost = vhostController.text;
      String pass = passController.text;
      String queuesSensor = queuesSensorController.text;
      String guid = guidController.text;

      if(userController.text.isNotEmpty &&
          hostController.text.isNotEmpty &&
          vhostController.text.isNotEmpty &&
          passController.text.isNotEmpty &&
          queuesSensorController.text.isNotEmpty &&
          guidController.text.isNotEmpty
      ) {
        await _storageService.setString(localDataUser, user);
        await _storageService.setString(localDataHost, host);
        await _storageService.setString(localDataVHost, vHost);
        await _storageService.setString(localDataPass, pass);
        await _storageService.setString(localDataQSensor, queuesSensor);
        await _storageService.setString(localDataGuid, guid);
        print('[Login user] $user');
        print('[Login host} $host');
        print('[Login vHost] $vHost');
        print('[Login pass] $pass');
        print('[Login Sensor] $queuesSensor');
        print('[Login Guid] $guid');
        _alertService.showSuccess(context, "Success", "Credential Data Saved",
                () {
              _navigationService.replaceTo(homeViewRoute);
            });

      } else {
        _alertService.showWarning("Warning", "Please fill all field",_navigationService.pop);
        print('kosong');
      }
    } catch (e) {
      print('error');

    }
  }

  void checkDataQr() async {
    _navigationService.navigateTo(qrViewRoute);
  }


}