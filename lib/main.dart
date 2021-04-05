import 'package:draft/apps/dash_board_app/main_dash_board.dart';
import 'package:draft/apps/draft/containers/sample_container.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: DashBoard(),
      ),
    );
  }
}
