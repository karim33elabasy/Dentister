import 'package:dentister/features/calendar/presentation/views/widgets/visit_appbar.dart';
import 'package:flutter/material.dart';

class AddVisitScreen extends StatelessWidget {
  const AddVisitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              VisitAppbar(),
            ],
          ),
        )
      ),
    );
  }
}
