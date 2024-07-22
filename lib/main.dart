import 'package:dentister/core/utils/app_router.dart';
import 'package:dentister/core/utils/services_locator.dart';
import 'package:dentister/features/patient_section/presentation/manager/patient_cubit.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

main(){
  setup();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context)=>const Dentister()
    )
  );
}

class Dentister extends StatelessWidget {
  const Dentister({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context)=>PatientCubit())],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
