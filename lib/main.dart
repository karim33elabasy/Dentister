import 'package:dentister/core/main_data/cubit/main_cubit.dart';
import 'package:dentister/core/main_data/repo/main_repo_implem.dart';
import 'package:dentister/core/utils/app_router.dart';
import 'package:dentister/core/utils/services_locator.dart';
import 'package:dentister/features/calendar/presentation/manager/visit_cubit.dart';
import 'package:dentister/features/patient_section/data/repos/patient_repo_implem.dart';
import 'package:dentister/features/patient_section/presentation/manager/patient_cubit.dart';
import 'package:dentister/features/patient_section/presentation/manager/show_patients_cubit.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/calendar/data/repo/visit_repo_implem.dart';

main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context)=>const Dentister()
    )
  );
}

class Dentister extends StatelessWidget {
  const Dentister({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>MainCubit(getIt.get<MainRepoImplem>())..getDbData()),
        BlocProvider(create: (context)=>PatientCubit(getIt.get<PatientRepoImplem>())),
        BlocProvider(create: (context)=>ShowPatientsCubit(getIt.get<PatientRepoImplem>())),
        BlocProvider(create: (context)=>VisitCubit(getIt.get<VisitRepoImplem>()))
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
