import 'dart:async';

import 'package:iwksensor/constants/const.dart';
import 'package:iwksensor/constants/route_name.dart';
import 'package:iwksensor/locator.dart';
import 'package:iwksensor/services/navigation_service.dart';
import 'package:iwksensor/services/storage_service.dart';
import 'package:iwksensor/viewmodels/base_model.dart';

class StartUpViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final StorageService _storageService = locator<StorageService>();

  startTimer() async {
    var _duration = Duration(seconds: 5);
    return Timer(_duration, handleStartUpLogic);
  }

  Future handleStartUpLogic() async {
    //_navigationService.replaceTo(dashboardViewRoute);
    final user = await _storageService.getString(localDataUser);
    print(user);
    if (user==null) {
      _navigationService.replaceTo(loginViewRoute);
    } else {
      _navigationService.replaceTo(homeViewRoute);
    }
  }
}