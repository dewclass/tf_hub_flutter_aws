import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Instagram Clone App",
        theme: ThemeData(primarySwatch: Colors.amber),
        home: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12, right: 25),
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.green,
              ),
              Container(
                color: Colors.blue,
                width: 250,
                height: 150,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      color: Colors.black,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
