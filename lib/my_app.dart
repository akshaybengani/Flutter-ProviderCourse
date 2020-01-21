import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_course/flavor.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Course',
      theme: ThemeData(primaryColor: Colors.amberAccent),
      home: MyHomeApp(),
    );
  }
}

class MyHomeApp extends StatefulWidget {
  @override
  _MyHomeAppState createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  int countval = 0; 
  @override
  Widget build(BuildContext context) {
    final flavor = Provider.of<Flavor>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(flavor.toString()),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Text('You have pushed the button this many times \n $countval', textAlign: TextAlign.center,),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          setState(() {
            countval ++;
          });
        },
      ),
    );
  }
}
