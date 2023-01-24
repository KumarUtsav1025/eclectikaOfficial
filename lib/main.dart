import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'Constants/colors.dart';
import 'package:provider/provider.dart';
import 'Modals/global_state.dart';
import 'Screens/Welcome/welcome.dart';
import 'constants/strings.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Provider(
      create: (_)=> GlobalState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ESOW',
        routes: {
          S.routeWelcome: (_) => const Welcome(),
        },
        initialRoute: S.routeWelcome,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: C.gradientColor3,
              secondary: C.gradientColor,
            )
        ),
        home: const Welcome(),
      ),
    );
  }
}
