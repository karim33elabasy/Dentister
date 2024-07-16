import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

main(){
  runApp(
    DevicePreview(builder: ()=>Dentister())
  );
}

class Dentister extends StatelessWidget {
  const Dentister({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: ,
    );
  }
}
