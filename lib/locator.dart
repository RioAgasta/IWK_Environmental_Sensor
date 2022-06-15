import 'package:get_it/get_it.dart';
import 'package:iwksensor/services/alert_service.dart';
import 'package:iwksensor/services/navigation_service.dart';
import 'package:iwksensor/services/rmq_service.dart';
import 'package:iwksensor/services/storage_service.dart';

GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => AlertService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => RmqService());
  locator.registerLazySingleton(() => StorageService());
}