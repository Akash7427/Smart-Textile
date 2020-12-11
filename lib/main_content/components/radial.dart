import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarttextile/main_content/components/radial_menu.dart';
import 'package:smarttextile/main_content/provider/circle_provider.dart';

class Radial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    CircleProvider circleProvider = Provider.of<CircleProvider>(context);
    return Positioned(
      left: circleProvider.x > 0
          ? circleProvider.x < width - 80 ? circleProvider.x : width - 80
          : 0,
      top: circleProvider.y > 0
          ? circleProvider.y < height - 80 ? circleProvider.y : height - 80
          : 0,
      child: Draggable(
          data: 'Flutter',
          child: Container(
              height: circleProvider.size,
              width: circleProvider.size,
              decoration: BoxDecoration(
                  color: Colors.transparent, shape: BoxShape.circle),
              child: RadialMenu()),
          feedback: Container(
              height: 80,
              width: 80,
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: RadialMenu()),
          childWhenDragging: SizedBox(),
          onDraggableCanceled: (Velocity velocity, Offset offset) {
            circleProvider.setOffset(offset.dx, offset.dy);
          }),
    );
  }
}
