import 'package:dentister/core/utils/app_router.dart';
import 'package:dentister/core/utils/services_locator.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

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
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
