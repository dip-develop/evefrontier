import 'package:built_collection/built_collection.dart';
import 'package:evefrontier_api/evefrontier_api.dart';
import 'package:flutter/material.dart';

import '../widgets/map_view_widget.dart';

class MapScrean extends StatefulWidget {
  const MapScrean({super.key});

  @override
  State<MapScrean> createState() => _MapScreanState();
}

class _MapScreanState extends State<MapScrean> {
  final _api = EVEFrontierAPI();
  BuiltList<SolarSystemEntity> _solarSystems = BuiltList<SolarSystemEntity>();

  @override
  void initState() {
    super.initState();
    _loadSolarSystems();
  }

  void _loadSolarSystems() => _api.getSolarSystems().then(
        (value) => setState(() {
          _solarSystems = value.data;
        }),
      );

  @override
  Widget build(BuildContext context) {
    return MapViewWidget(solarSystems: _solarSystems);
  }
}
