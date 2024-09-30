import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sefatafixer/pages/themes/theme_provider.dart';

import 'pages/client_home_page.dart';
import 'pages/get_started_page.dart'; // Import the Get Started Page
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/service_provider_home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'My App',
          theme: themeProvider.themeData,
          debugShowCheckedModeBanner: false, // Remove the debug banner
          initialRoute: '/getStarted', // Set Get Started as the initial route
          routes: {
            '/getStarted': (context) =>
                const GetStartedPage(), // Add the new route
            '/': (context) => LoginPage(),
            '/register': (context) => RegisterPage(),
            '/clientHome': (context) => const ClientHomePage(),
            '/serviceProviderHome': (context) => ServiceProviderHomePage(),
          },
        );
      },
    );
  }
}
