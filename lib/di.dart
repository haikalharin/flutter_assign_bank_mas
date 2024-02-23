
import 'package:dio/dio.dart';
import 'package:fultter_assigment_bank_mas/core/network/network_info.dart';
import 'package:fultter_assigment_bank_mas/data/remote_data_source/landing_page_api.dart';
import 'package:fultter_assigment_bank_mas/data/repository/landing_page_repository.dart';
import 'package:fultter_assigment_bank_mas/screens/landing_page/bloc/landing_page_bloc.dart';
import 'package:get_it/get_it.dart';

import 'core/network/dio_client.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //Dio
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<DioClient>(() => DioClient(getIt<Dio>()));
  //NetworkInfo api
  getIt.registerLazySingleton<NetworkInfoImpl>(() => NetworkInfoImpl());

  //Landing api
  getIt.registerLazySingleton<LandingPageApi>(() => LandingPageApi(dioClient: getIt<DioClient>()));


  // Landing repository
  getIt.registerLazySingleton<LandingPageRepository>(
    () => LandingPageRepository(agentDataApi:  getIt<LandingPageApi>(), networkInfo:  getIt<NetworkInfoImpl>()),
  );


  //Landing Bloc
  getIt.registerLazySingleton(() => LandingPageBloc(landingPageRepository: getIt<LandingPageRepository>()));



}
