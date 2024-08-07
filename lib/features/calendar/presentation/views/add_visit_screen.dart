import 'package:dentister/features/calendar/presentation/views/widgets/visit_appbar.dart';
import 'package:dentister/features/calendar/presentation/views/widgets/visit_body.dart';
import 'package:dentister/features/calendar/presentation/views/widgets/visit_screen_save_button.dart';
import 'package:flutter/material.dart';


class AddVisitScreen extends StatelessWidget {
  const AddVisitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: VisitScreenSaveButton(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              VisitAppbar(title: "New Appointment"),
              VisitBody(isEditing: false,)
            ],
          ),
        )
      ),
    );
  }
}


