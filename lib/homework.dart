import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Image.asset('images/car.jpg', width: 110.0, height: 110.0),
            backgroundColor: const Color.fromARGB(255, 201, 55, 55),
          ),
          body: Drawer(
            child: ListView(padding: EdgeInsets.zero, children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(156, 58, 189, 124),
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Item2'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Item3'),
                onTap: () {
                  // Navigator.pop(context);
                },
              )
            ]),
          ),
        ));
  }
}
