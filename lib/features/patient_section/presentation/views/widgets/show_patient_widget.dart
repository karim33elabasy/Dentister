import 'package:dentister/features/patient_section/presentation/views/widgets/patient_info_widget.dart';
import 'package:flutter/material.dart';

class ShowPatientWidget extends StatelessWidget {
  const ShowPatientWidget({super.key});

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
                child: CircleAvatar(
                  radius: width*0.08,
                ),
              ),
              SizedBox(width: width*0.03,),
              Expanded(
                flex: 4,
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Patient ID : #45212",maxLines: 1,style: TextStyle(fontSize: width*0.03,color: Colors.black87,overflow: TextOverflow.ellipsis),),
                      Text("Ahmed Said Metwally",maxLines: 1,style: TextStyle(fontSize: width*0.04,fontWeight: FontWeight.w700,color: Colors.black87,overflow: TextOverflow.ellipsis),),
                      Text("No notes to display ...",maxLines: 1,style: TextStyle(fontSize: width*0.03,color: Colors.black87,overflow: TextOverflow.ellipsis),),

                    ],
                  ),
                ),
              ),
              Icon(Icons.circle_rounded,color: Colors.greenAccent,size: width*0.06,)
            ],
          ),
          SizedBox(height: width*0.02,),
          const PatientInfoWidget(iconData: Icons.location_on_outlined,text: "No adreh jfhd fkjdh nmfbd smn bs snvmnfvbnvvvvvvvvvjkff v",),
          const PatientInfoWidget(iconData: Icons.person,text: "30 years old",),
          const PatientInfoWidget(iconData: Icons.phone,text: "0121321321351",),
          const PatientInfoWidget(iconData: Icons.calendar_month,text: "Last visit : 16/7/2024",),
          const PatientInfoWidget(iconData: Icons.next_week_outlined,text: "next visit: cleaning and shaping of lower right six",),
        ],
      ),
    );
  }
}

