import 'package:flutter/material.dart';
import 'package:flutter_conn_database/providers/Transaction_provider.dart';
import 'package:flutter_conn_database/screens/form_screen.dart';
import 'package:flutter_conn_database/screens/home_screen.dart';
import 'package:flutter_conn_database/screens/list_product.dart';
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
        theme: ThemeData(primarySwatch: Colors.blue),
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
        length: 3,
        child: Scaffold(
          
          backgroundColor: Colors.black,
          body:
              TabBarView(
                
                children: [HomeScreen(), ListProduct(), FormScreen()]),
          bottomNavigationBar: TabBar(
              
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.list_alt_sharp,
                    color: Colors.white,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.save_rounded,
                    color: Colors.white,
                  ),
                )
              ]),
        ));
  }
}
