import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_course/counter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Course',
      theme: ThemeData(primaryColor: Colors.amberAccent),
      
      // The ChangeNotifierProvider is a root widget which provides values to its child widgets
      // The value can be taken from a class which mixins with ChangeNotifier.
      // The Counter is the class name which mixins with the ChangeNotifier.
      // Here we need to provide a create: function which takes current context to work.
      // Previously it was called as builder function now its create function.
      // The function is taking value as the class constructor which needs to be monitored/
      home: ChangeNotifierProvider<Counter>(
        child: MyHomeApp(),
        // Builder is deprecated so now we will use create: insteed of builder
        create: (context) => Counter(),
      ),
      // So this Counter class will always be active throughout the application 

    );
  }
}

class MyHomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // The counter is the class object of Counter class containing the logic of increasing count
    // We are taking the value from provider.
    // So by default the Provider builds the whole Widget tree again whenever we get a change
    // The change is issued by the change notifier class in this case it is Counter class
    // So if anyof the widget or class calls changenotifier in the Counter class
    // The provider package will rebuild all the widget trees listening to the change
    // Here we dont want to rebuild the whole tree again we just need to rebuild the counter text
    // so we have provided listen:false with context this will take care that the widget tree will not change automatically
    final counter = Provider.of<Counter>(context, listen: false);
    // So now we have a problem if the widget tree isin't rebuilts by himself then
    // how do we update the text so we have to use a consumer in this case
    // ? A consumer is a widget which listen specifically to the specified widget tree branch insteed of rebuilding the whole context
    // Consumer will only build the text widget containing the counter.

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Provider Package'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('You have pushed the button this many times.'),

          // So here we have used the consumer widget which listens to changes in the specified Text Widget tree only
          // So we get three values as arguments of the builder constructor here.
          // (context, counter, child), Always remember whenever we call provider or consumer we get value of the object
          // The 1st value is context, which we dont need because we already have a context from stateless widget
          // The 2nd one is the counter class object and that we need to get the new value
          // The 3rd one is the child which I honestly dont know.
          Consumer<Counter>(
            builder: (_, counter, __) => Text(counter.count.toString()),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
        // Right now the increment is itself a function and onPressed requires a function
        // So we cannot pass two functions, as such we have passed the pointer of the increment function
        onPressed: counter.increment,
      ),
    );
  }
}
