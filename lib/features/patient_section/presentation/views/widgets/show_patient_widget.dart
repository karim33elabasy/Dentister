import 'package:dentister/features/patient_section/data/model/patient_model.dart';
import 'package:dentister/features/patient_section/presentation/views/widgets/patient_info_widget.dart';
import 'package:flutter/material.dart';

class ShowPatientWidget extends StatelessWidget {
  final PatientModel patient;
  const ShowPatientWidget({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      padding: EdgeInsets.all(
        width*0.03
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Icon(Icons.account_circle,color: patient.color,size: width*0.15,),
              ),
              SizedBox(width: width*0.03,),
              Expanded(
                flex: 4,
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Patient ID : ${patient.id}",maxLines: 1,style: TextStyle(fontSize: width*0.03,color: Colors.black87,overflow: TextOverflow.ellipsis),),
                      Text(patient.name,maxLines: 1,style: TextStyle(fontSize: width*0.04,fontWeight: FontWeight.w700,color: Colors.black87,overflow: TextOverflow.ellipsis),),
                      Text(patient.notes.isEmpty? "No notes to display ...":patient.notes
                        ,maxLines: 1,style: TextStyle(fontSize: width*0.03,color: Colors.black87,overflow: TextOverflow.ellipsis),),

                    ],
                  ),
                ),
              ),
              Icon(Icons.circle_rounded,color: patient.currentPatient==true? Colors.greenAccent:Colors.redAccent,size: width*0.06,)
            ],
          ),
          SizedBox(height: width*0.02,),
           PatientInfoWidget(iconData: Icons.location_on_outlined,text: patient.address.isEmpty? "No available address":patient.address ,),
           PatientInfoWidget(iconData: Icons.person,
             text: patient.dateBirth== null? "Not available":"${DateTime.now().year - patient.dateBirth!.year} years old",),
           PatientInfoWidget(iconData: Icons.phone,text: patient.phone.isEmpty? "Not available":patient.phone ,),
           PatientInfoWidget(iconData: Icons.calendar_month,
             text: patient.lastVisit== null? "Not available":"${patient.lastVisit!.day}/${patient.lastVisit!.month}/${patient.lastVisit!.year}",),
           PatientInfoWidget(iconData: Icons.next_week_outlined,text: "next visit: cleaning and shaping of lower right six",),
        ],
      ),
    );
  }
}

