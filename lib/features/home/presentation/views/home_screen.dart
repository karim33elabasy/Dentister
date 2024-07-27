import 'package:dentister/core/utils/app_router.dart';
import 'package:dentister/core/widgets/sidebar_menu.dart';
import 'package:dentister/features/home/presentation/views/widgets/home_appbar.dart';
import 'package:dentister/features/home/presentation/views/widgets/main_screen_floating_buttons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: SidebarMenu(),
      floatingActionButton: MainScreenFloatingButtons(),
      body: SafeArea(
        child: Column(
          children: [
            HomeAppbar(),
            SingleChildScrollView(
              child: Column(
                children: [

                ],
              ),
            )

          ],
        )
      )
    );
  }
}
