// ignore_for_file: deprecated_member_use
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app2/shaerd/bloc_observer/bloce_observer.dart';
import 'package:news_app2/shaerd/cubit/cubit.dart';
import 'package:news_app2/shaerd/cubit/state.dart';
import 'package:news_app2/shaerd/network/local/cash_helper.dart';
import 'package:news_app2/shaerd/network/remote/dio_helper.dart';

import 'layout/news_layout.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await ChashHelper.Init();
  bool? isDark = ChashHelper.getdata(Key: 'isDark');

  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp(isDark??=false));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  final bool isDark;
  const MyApp(this.isDark, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        
        BlocProvider(
          create: (context) => NewsCubit(NewsInitialState())
        ..Getbusiness()
        ..Getsports()
        ..Getscience()
        ..Gettechnology(),
        ),
        BlocProvider(
            create: (context) => NewsCubit(NewsInitialState())..changemode(
            fromshaerd: isDark
          ),
        ),
      ],
    
   
      child: BlocConsumer<NewsCubit, NewsSatates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
                primarySwatch: Colors.deepOrange,
                primaryColor: Colors.deepOrange,
                
                appBarTheme: const AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarBrightness: Brightness.light,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  backgroundColor: Colors.white,
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                  ),
                  actionsIconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    selectedItemColor: Colors.black, elevation: 20.0)),
            darkTheme: ThemeData(
                scaffoldBackgroundColor: Colors.grey[600],
                appBarTheme: const AppBarTheme(
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.black26,
                      statusBarBrightness: Brightness.dark,
                      statusBarIconBrightness: Brightness.light,
                    ),
                    color: Colors.black26,
                    titleTextStyle: TextStyle(color: Colors.white),
                    actionsIconTheme: IconThemeData(color: Colors.white)),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    backgroundColor: Colors.black26,
                    selectedIconTheme:
                        IconThemeData(color: Colors.deepOrange),
                    unselectedIconTheme: IconThemeData(color: Colors.white),
                    selectedLabelStyle: TextStyle(color: Colors.white),
                    unselectedLabelStyle: TextStyle(color: Colors.white),
                    selectedItemColor: Colors.deepOrange,
                    unselectedItemColor: Colors.white),
                textTheme: const TextTheme(
                  bodyText2: TextStyle(color: Colors.white),
                )),
            themeMode: NewsCubit.Get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}
