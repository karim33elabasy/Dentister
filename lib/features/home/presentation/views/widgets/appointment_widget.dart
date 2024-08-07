import 'package:dentister/core/main_data/cubit/main_cubit.dart';
import 'package:dentister/core/utils/app_router.dart';
import 'package:dentister/core/utils/methods.dart';
import 'package:dentister/features/calendar/data/model/visit_model.dart';
import 'package:dentister/features/calendar/presentation/manager/visit_cubit.dart';
import 'package:dentister/features/patient_section/data/model/patient_model.dart';
import 'package:dentister/features/patient_section/presentation/manager/patient_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class AppointmentWidget extends StatelessWidget {
  final PatientModel patient;
  final VisitModel visit;
  const AppointmentWidget({super.key, required this.patient, required this.visit});

  @override
  Widget build(BuildContext context) {
    VisitCubit visitCubit = BlocProvider.of<VisitCubit>(context);
    PatientCubit patientCubit = BlocProvider.of<PatientCubit>(context);
    MainCubit mainCubit = BlocProvider.of<MainCubit>(context);
    return Slidable(
      startActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            autoClose: true,
            onPressed: (context){
              patientCubit.loadParameters(patient);
              context.push(AppRouter.kEditPatientScreen);
            },
            icon: Icons.person_pin_rounded,
            backgroundColor: Colors.blue,
          ),
          SlidableAction(
            onPressed: (context){
              visitCubit.loadParameters(visit,patient);
              context.push(AppRouter.kEditVisitScreen);
            },
            icon: Icons.calendar_month,
            backgroundColor: Colors.teal,
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (context){
              visit.visitDone = true;
              visitCubit.editVisit(visit: visit,);
              mainCubit.getDbData();
            },
            icon: Icons.done_outline_sharp,
            backgroundColor: Colors.indigoAccent,
          ),
          SlidableAction(
            onPressed: (context){
              visitCubit.removeVisit(visit.id!);
              mainCubit.getDbData();
            },
            icon: Icons.delete,
            backgroundColor: Colors.redAccent,
          )
        ],
      ),
      child: ListTile(
        leading: Icon(Icons.person,color: patient.color,),
        title: Text(patient.name,style: const TextStyle(overflow: TextOverflow.ellipsis),maxLines: 1,),
        onTap: (){
          visitCubit.loadParameters(visit,patient);
          context.push(AppRouter.kEditVisitScreen);
        },
        trailing: IconButton(
          icon: const Icon(Icons.phone,color: Colors.green,),
          onPressed: ()async{
            if(patient.phone.length>3){
              final Uri url = Uri(
                scheme: 'tel',
                path: patient.phone);
              if(await canLaunchUrl(url)){
                await launchUrl(url);
              }
            }else{
              ScaffoldMessenger.of(context).showSnackBar(mySnackBar(text: "Phone number not available", context: context));
            }

          },
        ),
      ),
    );
  }
}