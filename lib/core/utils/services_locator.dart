import 'package:dentister/core/utils/db_services.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';


GetIt getIt = GetIt.instance;

setup()async{
  getIt.registerSingleton<Database>(await DbServices.creatingDatabase());
  getIt.registerSingleton<DbServices>(DbServices(getIt.get<Database>()));
}