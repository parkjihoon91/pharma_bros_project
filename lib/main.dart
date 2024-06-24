import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma_bros_project/common/view/webview_screen.dart';
import 'package:pharma_bros_project/main/product/view/product_detail_screen.dart';
import 'package:pharma_bros_project/main/view/main_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: _MyApp(),
    ),
  );
}

class _MyApp extends StatelessWidget {
  const _MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'notosanskr'),
      debugShowCheckedModeBanner: false,
      initialRoute: '/main',
      routes: {
        '/main': (_) => const MainScreen(),
        '/product_detail': (_) => const ProductDetail(),
        '/webview': (_) => const WebViewScreen(),
      },
    );
  }
}
