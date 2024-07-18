import 'package:dentister/core/utils/app_router.dart';
import 'package:dentister/features/home/presentation/views/widgets/add_patient_floating_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const AddPatientFloatingButton(),
      body: Center(child: InkWell(
        onTap: (){context.go(AppRouter.kShowPatientsScreen);},
        child: Text("Go to show patient screen"),)
      )
    );
  }
}