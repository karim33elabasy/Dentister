import 'package:dentister/core/utils/db_services.dart';
import 'package:dentister/features/patient_section/data/repos/patient_repo_implem.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

GetIt getIt = GetIt.instance;

setup()async{
  print("1"*100);
  getIt.registerSingleton<Database>(await DbServices.creatingDatabase());
  print("2"*100);
  getIt.registerSingleton<DbServices>(DbServices(getIt.get<Database>()));
  getIt.registerSingleton<PatientRepoImplem>(PatientRepoImplem(getIt.get<DbServices>()));
}