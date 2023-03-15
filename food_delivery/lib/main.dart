import 'package:flutter/material.dart';
import './config/index.dart';
import 'package:provider/provider.dart';
import './provider/current_index_provider.dart';
import 'pages/index_page.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CurrentIndexProvide()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: KString.mainTitle, //flutter女装商城
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: KColor.primaryColor,
      ),
      home: IndexPage(),
    );
  }
}
