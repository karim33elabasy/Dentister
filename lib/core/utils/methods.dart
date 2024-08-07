import 'package:dentister/core/utils/app_colors.dart';
import 'package:dentister/core/utils/db_services.dart';
import 'package:dentister/core/utils/services_locator.dart';
import 'package:flutter/material.dart';

import '../../features/calendar/data/model/visit_model.dart';

SnackBar mySnackBar({required String text,required BuildContext context}){
  return SnackBar(
    content: Text(text,style: TextStyle(fontSize: MediaQuery.sizeOf(context).width*0.03,color: Colors.white),),
    action: SnackBarAction(label: "Ok",onPressed: (){},),
    backgroundColor: AppColors.teal,
  );
}

Future<List<VisitModel>> getVisits()async{
  DbServices dbServices = getIt.get<DbServices>();
  List<Map<String,dynamic>> data = await dbServices.readData('visits', null, null);
  List<VisitModel> myData = [];
  for(var i in data){
    myData.add(VisitModel.fromDb(i));
  }
  return myData;
}