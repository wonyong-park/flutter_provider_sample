import 'package:flutter/material.dart';
import 'package:flutter_provider_sample/src/home.dart';
import 'package:flutter_provider_sample/src/provider/bottom_navigation_provider.dart';
import 'package:flutter_provider_sample/src/provider/count_provider.dart';
import 'package:flutter_provider_sample/src/provider/movie_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      /// child 밑 하위 위젯들은 CountProvider에 접근이 가능하다.
      /// ChangeNotifierProvider는 1개의 상태만 관리할 수 있다.
      /// 여러개의 상태 관리를 위해서는 MultiProvider가 필요
      /// context를 통해 provider 접근 가능
      // home: ChangeNotifierProvider(
      //   create: (_) => CountProvider(),
      //   child: Home(),
      // ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => BottomNavigationProvider()),
          ChangeNotifierProvider(create: (_) => MovieProvider()),
        ],
        child: Home(),
      ),
    );
  }
}
