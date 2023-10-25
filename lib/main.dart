import 'package:contacts/core/utils/styles.dart';
import 'package:contacts/features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {

  // sqfliteFfiInit();
  // databaseFactory = databaseFactoryFfi;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ContactApp());
}

class ContactApp extends StatelessWidget {
  const ContactApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      builder: (_, child) {
        return MaterialApp(
          theme:ThemeData(
            appBarTheme: AppBarTheme(
              centerTitle: true,
              titleTextStyle:  Styles.textStyle20.copyWith(
                color: Colors.blue
              ),
              backgroundColor: Colors.white,
              toolbarHeight: 50.h,
              elevation: 0,
            ),
            scaffoldBackgroundColor:  Colors.white,
          ),
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: const HomeView(),
    );
  }
}

