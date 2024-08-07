import 'package:dentister/features/calendar/presentation/views/widgets/visit_appbar.dart';
import 'package:dentister/features/calendar/presentation/views/widgets/visit_body.dart';
import 'package:dentister/features/calendar/presentation/views/widgets/visit_screen_edit_button.dart';
import 'package:flutter/material.dart';

class EditVisitScreen extends StatelessWidget {
  const EditVisitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: VisitScreenEditButton(),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                VisitAppbar(title: "Edit Appointment"),
                VisitBody(isEditing: true,)
              ],
            ),
          )
      ),
    );
  }
}
