import 'package:convo_/core/helpers/app_strings.dart';
import 'package:convo_/core/routing/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: AppStrings.supabaseProjectUrl,
    anonKey: AppStrings.supabaseAnnonKey,
  );

  // Hive
  await Hive.initFlutter();
  await Hive.openBox('userDataBox');

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MyApp(appRouters: AppRouters()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouters});

  final AppRouters appRouters;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouters.generateRoute,
    );
  }
}
