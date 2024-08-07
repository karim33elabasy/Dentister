
import 'package:dentister/core/widgets/sidebar_menu.dart';
import 'package:dentister/features/home/presentation/views/widgets/home_appbar.dart';
import 'package:dentister/features/home/presentation/views/widgets/main_screen_floating_buttons.dart';
import 'package:dentister/features/home/presentation/views/widgets/my_calendar.dart';
import 'package:flutter/material.dart';

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
            Expanded(
              child: MyCalendar(),
            ),
          ],
        ),
      ),
    );
  }
}





