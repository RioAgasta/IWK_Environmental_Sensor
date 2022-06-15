import 'package:flutter/material.dart';
import 'package:iwksensor/constants/const.dart';
import 'package:iwksensor/constants/route_name.dart';
import 'package:iwksensor/locator.dart';
import 'package:iwksensor/models/value_model.dart';
import 'package:iwksensor/services/alert_service.dart';
import 'package:iwksensor/services/navigation_service.dart';
import 'package:iwksensor/services/rmq_service.dart';
import 'package:iwksensor/services/storage_service.dart';
import 'package:iwksensor/viewmodels/base_model.dart';
import 'package:intl/intl.dart';

class HomeViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AlertService _alertService = locator<AlertService>();
  final RmqService _rmqService = locator<RmqService>();
  final StorageService _storageService = locator<StorageService>();

  TextEditingController guidController = TextEditingController();
  TextEditingController valueController = TextEditingController();
  ScrollController scrollController = ScrollController();

  String datetime = '';
  String time = '';

  List<ValueModel> device = [];



  void initState() async {
    setBusy(true);
    subscribeDataSuhu();
    setBusy(false);
  }

  void checkDataQr() async {
    _navigationService.navigateTo(qrViewRoute);
  }

  void subscribeDataSuhu() async {
    final host = await _storageService.getString(localDataHost);
    final user = await _storageService.getString(localDataUser);
    final pass = await _storageService.getString(localDataPass);
    final vHost = await _storageService.getString(localDataVHost);
    _rmqService.subscribe(
      sensorSuhu,
      host!.toString(),
      user!.toString(),
      pass!.toString(),
      vHost!.toString(),
    );
  }

  void sensorSuhu() async {
    final queues = await _storageService.getString(localDataQSensor);
    _rmqService.dataDevice(
        queues.toString(),
        setValueSensor
    );
    print('[Queue Suhu] $queues');
  }

  void setValueSensor(String message) async {
    date();
    times();
    scroll();
    List<String> list = message.split('#');
    setBusy(true);
    var guidd = list[0];
    var value = list[1];

    int c = int.parse(value.toString());
    double k = c+273.15;
    double f = c*1.8+32;
    double r = c*0.8;
    String kelvin = k.toString();
    String fahrenheit = f.toString();
    String reamur = r.toString();

    device.add(ValueModel(guidd, value, datetime, time, kelvin, fahrenheit, reamur));
    setBusy(false);
  }

  void movePage(String routeName) {
    _navigationService.navigateTo(routeName);
  }

  void resetData() async {
    _alertService.alertDialog("Warning", "Delete Data ?", () {_navigationService.pop();}, () async { await _storageService.clearStorage();
    _navigationService.navigateTo(loginViewRoute);
    print('[Delete Device] Success');});
    print('[Alert Delete]');
  }

  void scroll(){
    if (scrollController.hasClients) {
      final position = scrollController.position.maxScrollExtent;
      scrollController.animateTo(
        position,
        duration: Duration(seconds: 1),
        curve: Curves.easeOut,
      );
    }
  }

  void date(){
    var now = new DateTime.now();
    var formatter = new DateFormat('dd MMMM yyyy');
    String formattedDate = formatter.format(now);
    datetime = formattedDate;
    print(DateFormat().format(now));
    print("fomart data"+formattedDate);
    print("date "+ now.day.toString());
  }

  void times(){
    final String formattedDateTime =
    DateFormat('kk:mm:ss').format(DateTime.now()).toString();
    setBusy(true);
    time = formattedDateTime;
    setBusy(false);
  }


}