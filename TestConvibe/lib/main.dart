import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'Route/Routes.dart';
import 'Views/SplashScreen/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, device) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: SplashScreen.routeName,
          routes: routes,
        );
      },
    );
  }
}
