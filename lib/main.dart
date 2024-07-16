import 'package:dentister/core/utils/app_router.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

main(){
  runApp(
    DevicePreview(builder: (context)=>const Dentister())
  );
}

class Dentister extends StatelessWidget {
  const Dentister({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
    );
  }
}
