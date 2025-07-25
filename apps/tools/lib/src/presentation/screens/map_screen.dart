import 'package:built_collection/built_collection.dart';
import 'package:evefrontier_api/evefrontier_api.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import '../widgets/map_view_widget.dart';

class MapScrean extends StatefulWidget {
  const MapScrean({super.key});

  @override
  State<MapScrean> createState() => _MapScreanState();
}

class _MapScreanState extends State<MapScrean> {
  final _api = EVEFrontierAPI(levelLog: Level.INFO);
  final _solarSystems = List<SolarSystemEntity>.empty(growable: true);

  @override
  void initState() {
    super.initState();
    _loadSolarSystems();
  }

  Future<void> _loadSolarSystems() async {
    const int limit = 500;
    final firstResponse = await _api.getSolarSystems(limit: limit, offset: 0);
    final total = firstResponse.metadata.total;

    setState(() {
      _solarSystems.addAll(firstResponse.data);
    });

    if (_solarSystems.length < total) {
      final futures = <Future>[];
      for (int offset = limit; offset < total; offset += limit) {
        futures.add(_api
            .getSolarSystems(limit: limit, offset: offset)
            .then((value) => setState(() {
                  _solarSystems.addAll(value.data);
                })));
      }
      return Future.wait(futures).then((_) => Future.value());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MapViewWidget(solarSystems: _solarSystems);
  }
}
