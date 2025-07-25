import 'package:collection/collection.dart';
import 'package:evefrontier_api/evefrontier_api.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:vector_math/vector_math_64.dart' hide Colors;

class MapViewWidget extends StatefulWidget {
  final List<SolarSystemEntity> solarSystems;

  const MapViewWidget({super.key, required this.solarSystems});

  @override
  State<MapViewWidget> createState() => _MapViewWidgetState();
}

class _MapViewWidgetState extends State<MapViewWidget> {
  Vector3 rotation = Vector3.zero();
  double zoom = 5.0;
  Offset focalPoint = Offset.zero;
  Offset panOffset = Offset.zero;
  Offset _hoverPoint = Offset.zero;

  @override
  void didUpdateWidget(covariant MapViewWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.solarSystems != oldWidget.solarSystems) {
      setState(() {});
    }
  }

  void _onScaleStart(ScaleStartDetails details) {
    setState(() {
      focalPoint = details.focalPoint;
    });
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      rotation.y += details.focalPointDelta.dx * 0.01;
      rotation.x -= details.focalPointDelta.dy * 0.01;
      if (details.scale != 1.0) {
        final oldZoom = zoom;
        final Size screenSize =
            (context.findRenderObject() as RenderBox?)?.size ?? Size.zero;
        final Offset screenCenter =
            Offset(screenSize.width / 2, screenSize.height / 2);
        final Offset worldPos =
            (focalPoint - panOffset - screenCenter) / oldZoom;
        zoom *= details.scale;
        zoom = zoom.clamp(5, 400.0);
        final Offset newScreenPos = worldPos * zoom + panOffset + screenCenter;
        panOffset += (focalPoint - newScreenPos) * 0.001;
      }
    });
  }

  void _onPointerSignal(PointerSignalEvent event) {
    if (event is PointerScrollEvent) {
      setState(() {
        focalPoint = event.position;
        zoom += event.scrollDelta.dy > 0 ? -1 : 1;
        zoom = zoom.clamp(5, 400.0);
      });
    }
  }

  void _onHover(PointerHoverEvent event) {
    setState(() {
      _hoverPoint = event.position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: _onHover,
      child: Listener(
        onPointerSignal: _onPointerSignal,
        child: GestureDetector(
          onScaleStart: _onScaleStart,
          onScaleUpdate: _onScaleUpdate,
          child: CustomPaint(
            size: Size.infinite,
            painter: _SolarSystemPainter(
              solarSystems: widget.solarSystems.toList(),
              rotation: rotation,
              zoom: zoom,
              focalPoint: focalPoint,
              panOffset: panOffset,
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
  final Offset panOffset;

  _SolarSystemPainter({
    required this.solarSystems,
    required this.rotation,
    required this.zoom,
    required this.focalPoint,
    required this.panOffset,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final screenCenter = Offset(size.width / 2, size.height / 2);
    final paint = Paint()..color = Colors.white;

    final center = _calculateCenter(solarSystems);

    final matrix = Matrix4.identity()
      ..translateByVector3(Vector3(panOffset.dx, panOffset.dy, 0))
      ..translateByVector3(Vector3(focalPoint.dx, focalPoint.dy, 0))
      ..scaleByVector3(Vector3(zoom, zoom, zoom))
      ..translateByVector3(Vector3(-focalPoint.dx, -focalPoint.dy, 0))
      ..translateByVector3(Vector3(screenCenter.dx, screenCenter.dy, 500))
      ..rotateX(rotation.x)
      ..rotateY(rotation.y)
      ..setEntry(3, 2, 0.001)
      ..translateByVector3(Vector3(-center.x * 1e-18, -center.y * 1e-18, 0));

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

      double brightnessFactor = (1.0 - (distanceToCenter / 500.0)).clamp(
        0.0,
        1.0,
      );
      Color starColor = Color.fromARGB(
        (255 * brightnessFactor).toInt(),
        255,
        255,
        255,
      );

      final starRadius = zoom > 50.0 ? 1.0 * (zoom / 50.0) : 1.0;

      canvas.drawCircle(
        Offset(transformed.x, transformed.y),
        starRadius,
        paint..color = starColor,
      );
      if (zoom > 200.0) {
        _drawText(canvas, system.name,
            starPosition.translate(0, starRadius * -3), size);
      }
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
