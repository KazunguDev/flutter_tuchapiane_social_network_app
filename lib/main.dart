import 'package:flutter/material.dart';
import 'package:flutter_tuchapiane_social_network_app/config/app_routes.dart';
import 'package:flutter_tuchapiane_social_network_app/provider/app_repo.dart';
import 'package:flutter_tuchapiane_social_network_app/provider/post_provider.dart';
import 'package:flutter_tuchapiane_social_network_app/provider/user_provider.dart';
import 'package:flutter_tuchapiane_social_network_app/styles/app_colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AppRepo>(
        create: (context) => AppRepo(),
      ),
      ChangeNotifierProvider<PostProvider>(
        create: (context) => PostProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => UserProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Urbanist',
        scaffoldBackgroundColor: AppColors.background,
        brightness: Brightness.dark,
      ),
      initialRoute: AppRoutes.user,
      routes: AppRoutes.pages,
    );
  }
}
