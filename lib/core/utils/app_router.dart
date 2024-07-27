import 'package:dentister/features/calendar/presentation/views/add_visit_screen.dart';
import 'package:dentister/features/home/presentation/views/home_screen.dart';
import 'package:dentister/features/patient_section/presentation/views/add_patient_screen.dart';
import 'package:dentister/features/patient_section/presentation/views/edit_patient_screen.dart';
import 'package:dentister/features/patient_section/presentation/views/show_patients_screen.dart';
import 'package:dentister/features/splash_onboard/presentation/views/splash_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter{
  static String kSplashScreen = "/";
  static String kHomeScreen = "/kHomeScreen";
  static String kAddPatientScreen = "/kAddPatientScreen";
  static String kEditPatientScreen = "/kEditPatientScreen";
  static String kShowPatientsScreen = "/kShowPatientsScreen";
  static String kAddVisitScreen = "/kAddVisitScreen";

  static GoRouter router = GoRouter(
      routes: [
        GoRoute(
          path: kSplashScreen,
          builder: (context,state)=>const SplashScreen()
        ),
        GoRoute(
            path: kHomeScreen,
            builder: (context,state)=> HomeScreen()
        ),
        GoRoute(
            path: kAddPatientScreen,
            builder: (context,state)=>const AddPatientScreen()
        ),
        GoRoute(
            path: kEditPatientScreen,
            builder: (context,state)=>const EditPatientScreen()
        ),
        GoRoute(
            path: kShowPatientsScreen,
            builder: (context,state)=>const ShowPatientsScreen()
        ),
        GoRoute(
            path: kAddVisitScreen,
            builder: (context,state)=>const AddVisitScreen()
        ),
      ]
  );
}
