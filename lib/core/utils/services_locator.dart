import 'package:dentister/core/main_data/repo/main_repo_implem.dart';
import 'package:dentister/core/utils/db_services.dart';
import 'package:dentister/features/calendar/data/repo/visit_repo_implem.dart';
import 'package:dentister/features/home/data/repos/calendar_repo_implem.dart';
import 'package:dentister/features/patient_section/data/repos/patient_repo_implem.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

GetIt getIt = GetIt.instance;

setup()async{
  getIt.registerSingleton<Database>(await DbServices.creatingDatabase());
  getIt.registerSingleton<DbServices>(DbServices(getIt.get<Database>()));
  getIt.registerSingleton<MainRepoImplem>(MainRepoImplem(getIt.get<DbServices>()));
  getIt.registerSingleton<PatientRepoImplem>(PatientRepoImplem(getIt.get<DbServices>()));
  getIt.registerSingleton<VisitRepoImplem>(VisitRepoImplem(getIt.get<DbServices>()));
  getIt.registerSingleton<CalendarRepoImplem>(CalendarRepoImplem(getIt.get<DbServices>()));
}