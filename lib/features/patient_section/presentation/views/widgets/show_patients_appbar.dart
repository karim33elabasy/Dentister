import 'package:dentister/core/utils/app_router.dart';
import 'package:dentister/features/patient_section/presentation/manager/show_patients_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ShowPatientsAppbar extends StatelessWidget {
  const ShowPatientsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    ShowPatientsCubit cubit = BlocProvider.of<ShowPatientsCubit>(context);
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: width*0.015,
            vertical: height*0.005
        ),
        child: Row(
          children: [
            IconButton(
                onPressed: (){
                  context.pop();
                },
                icon: Icon(Icons.arrow_back_ios_rounded,size: width*0.05,)
            ),
            SizedBox(width: width*0.02,),
            Expanded(
              child: TextFormField(
                controller: cubit.searchPatients,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  hintText: "Search with name / phone / location",
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.cancel_outlined),
                    onPressed: (){
                      cubit.searchPatients.text = "";
                      cubit.getPatients();
                    },
                  )
                ),
                onChanged: (query){
                  cubit.getPatients();
                },
              ),
            ),
            SizedBox(width: width*0.02,),
            IconButton(
                onPressed: (){
                  context.push(AppRouter.kAddPatientScreen);
                },
                icon: Icon(Icons.person_add_alt_1_rounded,size: width*0.06,)
            ),

          ],
        )
    );
  }
}
