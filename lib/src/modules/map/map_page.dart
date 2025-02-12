import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:patinha_app/src/core/constants/constants.dart';
import 'package:patinha_app/src/modules/widgets/icon_button_patinha_perdida.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LocationData? _currentLocation;
  late Location _location;
  late MapController _mapController;
  LatLng _selectedLocation = LatLng(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    _location = Location();
    _mapController = MapController();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    _currentLocation = await _location.getLocation();
    setState(() {
      _selectedLocation =
          LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!);
    });
  }

  void _onMapTapped(LatLng latLng) {
    setState(() {
      _selectedLocation = latLng;
    });
    print("Coordenadas selecionadas: ${latLng.latitude}, ${latLng.longitude}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButtonPatinhaPerdida(),
          backgroundColor: PPColors.violetFillligth,
          title: Text(
            "Localização",
            style: TextStyle(color: PPColors.dark),
          )),
      body: _currentLocation == null
          ? Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: _selectedLocation,
                    initialZoom: 15.0,
                    onTap: (_, latLng) => _onMapTapped(latLng),
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c'],
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: _selectedLocation,
                          child: Icon(
                            Icons.pets,
                            color: PPColors.buttonPrimary,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        side: BorderSide.none,
                        backgroundColor: PPColors.violetFillligth),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        '/report/first',
                        arguments: {
                          'latitude': _selectedLocation.latitude,
                          'longitude': _selectedLocation.longitude,
                        },
                      );
                      print('Localização selecionada: $_selectedLocation');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: const Text(
                        'Confirmar Localização',
                        style: TextStyle(
                          color: PPColors.dark,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: FloatingActionButton(
          onPressed: () {
            _mapController.move(
                LatLng(
                    _currentLocation!.latitude!, _currentLocation!.longitude!),
                15.0);
          },
          child: const Icon(Icons.my_location),
        ),
      ),
    );
  }
}
