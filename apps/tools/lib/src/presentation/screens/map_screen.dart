import 'package:built_collection/built_collection.dart';
import 'package:evefrontier_api/evefrontier_api.dart';
import 'package:evefrontier_tools/src/presentation/widgets/map_view_widget.dart';
import 'package:flutter/material.dart';

class MapScrean extends StatefulWidget {
  const MapScrean({super.key});

  @override
  State<MapScrean> createState() => _MapScreanState();
}

class _MapScreanState extends State<MapScrean> {
  final _api = EVEFrontierAPI();
  BuiltMap<String, SolarSystemEntity> _solarSystems =
      BuiltMap<String, SolarSystemEntity>();

  @override
  void initState() {
    super.initState();
    _loadSolarSystems();
  }

  void _loadSolarSystems() => _api.getSolarSystems().then(
    (value) => setState(() {
      _solarSystems = BuiltMap<String, SolarSystemEntity>.from(value.toMap());
    }),
  );

  @override
  Widget build(BuildContext context) {
    return MapViewWidget(solarSystems: _solarSystems);
  }
}
