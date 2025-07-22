import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';
import 'package:evefrontier_api/evefrontier_api.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:vector_math/vector_math_64.dart' hide Colors;

class MapViewWidget extends StatefulWidget {
  final BuiltMap<String, SolarSystemEntity> solarSystems;

  const MapViewWidget({super.key, required this.solarSystems});

  @override
  State<MapViewWidget> createState() => _MapViewWidgetState();
}

class _MapViewWidgetState extends State<MapViewWidget> {
  Vector3 rotation = Vector3.zero();
  double zoom = 5.0;
  Offset focalPoint = Offset.zero;

  @override
  void didUpdateWidget(covariant MapViewWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.solarSystems != oldWidget.solarSystems) {
      setState(() {});
    }
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      rotation.y += details.focalPointDelta.dx * 0.01;
      rotation.x -= details.focalPointDelta.dy * 0.01;
      zoom *= details.scale;
      zoom = zoom.clamp(5, 400.0);
    });
  }

  void _onPointerSignal(PointerSignalEvent event) {
    if (event is PointerScrollEvent) {
      setState(() {
        zoom += event.scrollDelta.dy > 0 ? -1 : 1;
        zoom = zoom.clamp(5, 400.0);
      });
    }
  }

  void _onHover(PointerHoverEvent event) {
    setState(() {
      focalPoint = event.position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: _onHover,
      child: Listener(
        onPointerSignal: _onPointerSignal,
        child: GestureDetector(
          onScaleUpdate: _onScaleUpdate,
          child: CustomPaint(
            size: Size.infinite,
            painter: _SolarSystemPainter(
              solarSystems: widget.solarSystems.values.toList(),
              rotation: rotation,
              zoom: zoom,
              focalPoint: focalPoint,
            ),
          ),
        ),
      ),
    );
  }
}

class _SolarSystemPainter extends CustomPainter {
  final List<SolarSystemEntity> solarSystems;

  final Vector3 rotation;
  final double zoom;
  final Offset focalPoint;

  _SolarSystemPainter({
    required this.solarSystems,
    required this.rotation,
    required this.zoom,
    required this.focalPoint,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final screenCenter = Offset(size.width / 2, size.height / 2);
    final paint = Paint()..color = Colors.white;
    /* canvas.drawRect(
      Rect.fromLTRB(0, 0, size.width, size.height),
      Paint()..color = Colors.black,
    ); */

    final center = _calculateCenter(solarSystems);

    final matrix =
        Matrix4.identity()
          ..translate(screenCenter.dx, screenCenter.dy, 500)
          ..scale(zoom)
          ..rotateX(rotation.x)
          ..rotateY(rotation.y)
          ..setEntry(3, 2, 0.001)
          /* ..translate(-focalPoint.dx, -focalPoint.dy) */
          ..translate(-center.x * 1e-18, -center.y * 1e-18);

    for (var system in solarSystems) {
      final transformed = matrix.transformed3(
        Vector3(
          system.location.x * 1e-18,
          system.location.y * 1e-18,
          system.location.z * 1e-18,
        ),
      );

      if (transformed.x > size.width ||
          transformed.x < 0 ||
          transformed.y > size.height ||
          transformed.y < 0) {
        continue;
      }

      /* double zCamera = matrix.getTranslation().z;

      final distanceFactor = (transformed.z / 500).clamp(0.0, 1.0);
      final starColor = Color.fromARGB(
        (255 * (0.5 + distanceFactor)).toInt(),
        255,
        255,
        255,
      ); */

      final starPosition = Offset(transformed.x, transformed.y);
      double distanceToCenter = (starPosition - screenCenter).distance;

      // Определяем яркость: чем ближе к центру, тем ярче
      double brightnessFactor = (1.0 - (distanceToCenter / 500.0)).clamp(
        0.0,
        1.0,
      );
      Color starColor = Color.fromARGB(
        (255 * brightnessFactor).toInt(), // Альфа-канал зависит от расстояния
        255,
        255,
        255,
      );

      /* if (starColor.a < 0.3) continue; */

      /* final starSize = (1.5 * distanceFactor).clamp(1.0, 5.0); */

      /* if (starSize < 0.5) {
        continue;
      } */

      /* if (starSize > 2) {
        paint.shader = RadialGradient(
          colors: [Colors.white, Colors.black],
          stops: [0.2, 1.0],
        ).createShader(
          Rect.fromCircle( 
            center: Offset(starPosition.dx, starPosition.dy),
            radius: starSize,
          ),
        );
      } */

      canvas.drawCircle(
        Offset(transformed.x, transformed.y),
        1.0 /* starSize */,
        paint..color = starColor,
      );
      /* _drawText(canvas, system.solarSystemName, starPosition, size); */
    }
  }

  Vector3 _calculateCenter(List<SolarSystemEntity> solarSystems) {
    if (solarSystems.isEmpty) {
      return Vector3.zero();
    }
    final x = solarSystems.map((e) => e.location.x).average;
    final y = solarSystems.map((e) => e.location.y).average;
    final z = solarSystems.map((e) => e.location.z).max;
    return Vector3(x, y, z);
  }

  void _drawText(Canvas canvas, String text, Offset position, Size size) {
    final textSpan = TextSpan(
      text: text,
      style: TextStyle(color: Colors.white, fontSize: 12),
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: size.width);
    textPainter.paint(canvas, position + const Offset(6, -6));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
