import 'package:duo/screens/screens.dart';

import 'package:duo/services/services.dart';
import 'package:duo/widgets/viaje.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => AuthService()),
    ], child: MyApp());
  }
}

Future initialization(BuildContext? context) async {
  await Future.delayed(Duration(seconds: 4));
}

class MyApp extends StatelessWidget {
  static const tittle = 'Native Splash Screen';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movetruck',
      initialRoute: 'login',
      routes: {
        'login': (_) => LoginScreen(),
        'conect': (_) => ConectScreen(),
        'new_account': (_) => NewAccountScreen(),
        'rec_pass': (_) => RecuperarPassScreen(),
        'home': (_) => ViajePage(),
        'iniciar': (_) => ViajePage(),
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
    );
  }
}
