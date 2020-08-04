import 'package:flutter/material.dart';

class AnimasyonWidget extends StatefulWidget {
  @override
  _AnimasyonWidgetState createState() => _AnimasyonWidgetState();
}

class _AnimasyonWidgetState extends State<AnimasyonWidget> {
  var _color = Colors.blue;
  var _width = 200.0;
  var _height = 200.0;
  var _ilkCocukAktif = true;
  var _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animasyon Widget"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              AnimatedContainer(
                height: _height,
                width: _width,
                duration: Duration(seconds: 3),
                color: _color,
              ),
              RaisedButton(
                onPressed: () {
                  _animatedContainerAnimasyonu();
                },
                color: Colors.red,
                child: Text("Animated Container"),
              ),
              AnimatedCrossFade(
                firstChild: FlutterLogo(
                  colors: Colors.green,size: 100,
                ),
                secondChild: FlutterLogo(
                  colors: Colors.red,size: 100,
                ),
                crossFadeState: _ilkCocukAktif
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: Duration(seconds: 3),
              ),
              RaisedButton(
                onPressed: () {
                  _animatedCrossFadeAnimasyonu();
                },
                color: Colors.red,
                child: Text("CrossFade Animasyonu"),
              ),
              AnimatedOpacity(opacity: _opacity,duration: Duration(seconds: 2),child: FlutterLogo(size: 100,),),              RaisedButton(
                onPressed: () {
                  _opacityAnimasyonu();
                },
                color: Colors.red,
                child: Text("Opacity Animasyonu"),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _animatedContainerAnimasyonu() {
    setState(() {
      _color = Colors.yellow;
      _width = 300;
      _height = 300;
    });
  }

  void _animatedCrossFadeAnimasyonu() {
    setState(() {
      _ilkCocukAktif = !_ilkCocukAktif;
    });
  }

  void _opacityAnimasyonu() {
    setState(() {
      _opacity=_opacity==1.0?0.0:1.0;
    });

  }
}
