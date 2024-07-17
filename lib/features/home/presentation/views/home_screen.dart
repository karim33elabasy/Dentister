import 'package:dentister/features/home/presentation/views/widgets/add_patient_floating_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: AddPatientFloatingButton(),
    );
  }
}