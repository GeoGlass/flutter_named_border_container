import 'package:flutter/material.dart';
import 'package:radio_check_container_box/named_border_container.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print("Screen width: ${MediaQuery.of(context).size.width}");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            NamedBorderContainer(
              title: 'Radio Container',
              subtitle: 'Example of a container with Radios',
              borderColor: Colors.green,
              titlePosition: TitlePosition.onTop,
              titleAlignAxis: 0.05,
              //margin: const EdgeInsets.symmetric(horizontal: 22.0),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              titleStyle: const TextStyle(color: Colors.green, fontSize: 32),
              child: Text('Teste'),
            ),
            RaisedButton(onPressed: null),
          ],
        ),
      ),
    );
  }
}
