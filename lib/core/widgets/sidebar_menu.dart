import 'package:dentister/core/utils/app_assets.dart';
import 'package:dentister/core/utils/app_router.dart';
import 'package:dentister/features/patient_section/presentation/manager/patient_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SidebarMenu extends StatelessWidget {
  const SidebarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: MediaQuery.sizeOf(context).width*0.6,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height*0.05,),
              Center(child: Image.asset(AppAssets.logo,width: MediaQuery.sizeOf(context).width*0.45,),),
              SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),
              const Divider(),
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                  context.go(AppRouter.kHomeScreen);
                  },
                child: const ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home Screen"),

                ),
              ),
              InkWell(
                onTap: (){
                  BlocProvider.of<PatientCubit>(context).clearParameters();
                  context.push(AppRouter.kAddPatientScreen);
                  },
                child: const ListTile(
                  leading: Icon(Icons.person_add),
                  title: Text("Add New Patient"),
                ),
              ),
              InkWell(
                onTap: (){context.push(AppRouter.kShowPatientsScreen);},
                child: const ListTile(
                  leading: Icon(Icons.search),
                  title: Text("Search Patients"),
                ),
              ),
              InkWell(
                onTap: (){context.push(AppRouter.kAddVisitScreen);},
                child: const ListTile(
                  leading: Icon(Icons.add_card_outlined),
                  title: Text("Add New Visit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
