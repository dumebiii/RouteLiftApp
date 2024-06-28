import 'package:get_it/get_it.dart';
import 'package:routelift/services/api_service.dart';
import 'package:routelift/viewmodel/descriptionviewmodel.dart';
import 'package:routelift/viewmodel/homeviewmodel.dart';
import 'package:routelift/viewmodel/hostelviewmodel.dart';
import 'package:routelift/viewmodel/mapviewmodel.dart';

GetIt locator = GetIt.instance;

Future<void> setUpserviceLocator() async {
  locator.registerSingleton<Apiservice>(Apiservice());

  locator.registerFactory<DescriptionViewModel>(() => DescriptionViewModel());
  locator.registerFactory<HomeViewModel>(() => HomeViewModel());
  locator.registerFactory<MapViewModel>(() => MapViewModel());
  locator.registerFactory<HostelViewModel>(() => HostelViewModel());
}
