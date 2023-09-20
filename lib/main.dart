import 'package:flutter/material.dart';
import 'package:flutter_conn_database/providers/Transaction_provider.dart';
import 'package:flutter_conn_database/screens/form_screen.dart';
import 'package:flutter_conn_database/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return TransactionProvider();
        })
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.orange),
        home: const MyHomePage(
          title: 'รายการเงิน',
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: TabBarView(children: [HomeScreen(), FormScreen()]),
          bottomNavigationBar: TabBar(tabs: [
            Tab(
              text: "รายการ",
            ),
            Tab(
              text: "บันทึกขอมูล",
            ) 
          ]),
        ));
  }
}
