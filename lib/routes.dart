import 'package:flutter/material.dart';
import 'package:rojas_johan_practicas/screens/dashboard_screen.dart';
import 'package:rojas_johan_practicas/screens/register_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/register': (BuildContext context) => const RegisterScreen(),
    '/dash': (BuildContext context) => DashboardScreen()
  };
}
