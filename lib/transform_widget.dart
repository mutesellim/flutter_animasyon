import 'package:flutter/material.dart';

class TransformWidget extends StatefulWidget {
  @override
  _TransformWidgetState createState() => _TransformWidgetState();
}

class _TransformWidgetState extends State<TransformWidget> {
  var _sliderDegeri = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Transform Widget"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            getSlider(),
            getRotate(),
            getScale(),
            getTranslate(),
          ],
        ));
  }

  getSlider() {
    return Slider(
      value: _sliderDegeri,
      min: 0,
      max: 100,
      onChanged: (yeniDeger) {
        setState(() {
          _sliderDegeri = yeniDeger;
        });
      },
    );
  }

  getRotate() {
    return Container(
      child: Transform.rotate(
        angle: _sliderDegeri,
        child: Container(
          height: 100,
          width: 100,
          color: Colors.green,
        ),
      ),
    );
  }

  getScale() {
    return Container(
      child: Transform.scale(
        scale: _sliderDegeri,
        child: Container(
          width: 1,
          height: 1,
          color: Colors.purple,
        ),
      ),
    );
  }

  getTranslate() {
    return Container(
      child: Transform.translate(
        offset: Offset(_sliderDegeri, _sliderDegeri),
        child: Container(
          width: 100,
          height: 100,
          color: Colors.purple,
        ),
      ),
    );
  }
}
