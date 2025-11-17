import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        cameraConstraint: CameraConstraint.contain(
          bounds: LatLngBounds.fromPoints([
            const LatLng(
              -25.245742,
              -48.939075,
            ), // Coord superior/direira máxima
            const LatLng(
              -25.676351,
              -49.435638,
            ), // Coord iinferior/esquerda máxima
          ]),
        ),
        initialCenter: const LatLng(
          -25.43735519478566,
          -49.27010334955912,
        ), // Posição inicial, meio de Curitiba
        initialZoom: 13.0, // Define o zoom inicial do App
        minZoom: 12.0, // Valor mínimo (pode afastar até...)
        maxZoom: 16.0, // Valor máximo (pode ampliar até...)
      ),

      children: [
        TileLayer(
          urlTemplate:
              'https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png', // Puxa o png do mapa do CartoDB
          retinaMode: true, // Define a resolução do mapa para alta-qualdiade
          userAgentPackageName: 'com.example.app',
        ),
        RichAttributionWidget(
          attributions: [
            TextSourceAttribution(
              'OpeStreetMap contributors',
              onTap: () =>
                  launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
            ),
          ],
        ),
      ],
    );
  }
}
