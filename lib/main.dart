import 'package:flutter/material.dart';
import 'package:flutter_animasyon/animasyon_widget.dart';
import 'package:flutter_animasyon/new_page.dart';
import 'package:flutter_animasyon/transform_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(
        title: "Flutter Demo Homepage",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    controller.addListener(() {
      setState(() {});
    });
    animation =
        ColorTween(begin: Colors.yellow, end: Colors.red).animate(controller);

    controller.forward();
    controller.addStatusListener((status) {
      debugPrint("Durum: " + status.toString());
      if (status == AnimationStatus.completed) {
        controller.reverse().orCancel;
      } else if (status == AnimationStatus.dismissed) {
        controller.forward().orCancel;
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Tıklama Sayısı"),
            Text(
              "$_counter",
              style: TextStyle(fontSize: controller.value * 100),
            ),
            Hero(
              tag: "mehmet",
              child: FlutterLogo(
                size: 64,
                colors: Colors.purple,
              ),
            ),
            RaisedButton(
              child: Text("Stagger Animasyon Sayfa"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => NewPage()));
              },
            ),
            RaisedButton(
              child: Text("Widget Animasyon Sayfa"),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AnimasyonWidget()));
              },
            ),
            RaisedButton(
              child: Text("Transform Widget Sayfa"),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TransformWidget()));
              },
            )

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: "Arttır",
        child: Icon(Icons.add),
      ),
    );
  }
}
