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
          title: Center(
            child: SizedBox(
              width: 100,
              child: Image.asset('images/car.jpg'),
            ),
          ),
        ),
        body: const SnakeBarPage(),
      ),
    );
  }
}

class SnakeBarPage extends StatelessWidget {
  const SnakeBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      onPressed: () {
        final snackbar = SnackBar(
          content: const Text('Hi baby'),
          action: SnackBarAction(
            label: 'undo',
            onPressed: () {
              final wow = SnackBar(
                content: const Text('Action'),
                action: SnackBarAction(label: 'redo', onPressed: () {}),
              );
              ScaffoldMessenger.of(context).showSnackBar(wow);
            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      },
      child: const Text('Click Me'),
    ));
  }
}
