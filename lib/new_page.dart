import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> with SingleTickerProviderStateMixin {
  AnimationController controller;

  SequenceAnimation sequenceAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this);
    sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: Duration.zero,
            to: Duration(seconds: 1),
            tag: "opacity")
        .addAnimatable(
            animatable: Tween<double>(begin: 50, end: 150),
            from: Duration(seconds: 1),
            to: Duration(seconds: 2),
            tag: "width")
        .addAnimatable(
            animatable: Tween<double>(begin: 50, end: 150),
            from: Duration(seconds: 2),
            to: Duration(seconds: 5),
            tag: "height")
        .animate(controller);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonraki Sayfa"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget child) {
            return Opacity(
              opacity: sequenceAnimation["opacity"].value,
              child: Container(
                color: Colors.red,
                width: sequenceAnimation["width"].value,
                height: sequenceAnimation["height"].value,
              ),
            );
          },
        ),
      ),
    );
  }
}
