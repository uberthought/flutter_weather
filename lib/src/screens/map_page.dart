import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather/src/screens/forecast_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// import 'package:flutter_weather/src/api/data/forecast.dart';
import 'package:flutter_weather/src/state/forecast_state.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_weather/src/api/extensions/nws_extensions.dart';

class MapPage extends MaterialPage {
  MapPage() : super(child: Scaffold(appBar: AppBar(), body: const Body()));
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, layout) {
      return Column(
        children: [
          SizedBox(
            height: layout.maxHeight / 2,
            child: const SingleChildScrollView(child: ForecastWidget()),
          ),
          const Expanded(child: MapWidget()),
        ],
      );
    });
  }
}

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  State<MapWidget> createState() => MapWidgetState();
}

class MapWidgetState extends State<MapWidget> {
  final Completer<GoogleMapController> _controller = Completer();
  Set<Marker>? _markers;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  ForecastState? _forecastState;

  @override
  void initState() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
    }

    _forecastState = context.read<ForecastState>();
    final forecastState = _forecastState;
    if (forecastState == null) return;
    forecastState.addListener(forecastStateListener);
    forecastState.setCoordinates(latitude: 27.9585274, longitude: -82.7886386);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.hybrid,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      markers: _markers ?? <Marker>{},
      onTap: (latLng) {
        final forecastState = _forecastState;
        if (forecastState == null) return;
        forecastState.setCoordinates(latitude: latLng.latitude, longitude: latLng.longitude);
      },
    );
  }

  Future<void> forecastStateListener() async {
    final forecastState = _forecastState;
    if (forecastState == null) return;
    // if (kDebugMode) print('Lat, Lon ${forecastState.stationLatitude}, ${forecastState.stationLongitude}');
    final latitude = forecastState.stationLatitude;
    final longitude = forecastState.stationLongitude;
    final stationIdentifier = forecastState.stationIdentifier;
    if (latitude == null || longitude == null || stationIdentifier == null) return;
    final stationPosition = CameraPosition(target: LatLng(latitude, longitude), zoom: 12);

    _markers = (await Future.wait(forecastState.stations.map((e) async => Marker(
              markerId: MarkerId(e.stationIdentifier),
              position: LatLng(e.latitude, e.longitude),
              infoWindow: InfoWindow(title: e.name, snippet: '${e.latitude}, ${e.longitude}'),
              icon: await createCustomMarkerBitmap(e.stationIdentifier),
            ))))
        .toSet();

    setState(() {});

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(stationPosition));
  }

  @override
  void dispose() {
    final forecastState = _forecastState;
    if (forecastState == null) return;
    forecastState.removeListener(forecastStateListener);
    super.dispose();
  }

  Future<BitmapDescriptor> createCustomMarkerBitmap(String title) async {
    TextSpan span = TextSpan(
      style: const TextStyle(
        // color: Colors.white,
        // color: Prefs.singleton().getTheme() == 'Dark' ? Colors.white : Colors.black,
        fontSize: 35.0,
        fontWeight: FontWeight.bold,
      ),
      text: title,
    );

    TextPainter tp = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    tp.text = TextSpan(
      text: title,
      style: TextStyle(
        fontSize: 24.0,
        color: Theme.of(context).colorScheme.onSecondary,
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
    );

    final recorder = PictureRecorder();
    final c = Canvas(recorder);

    tp.layout();
    tp.paint(c, const Offset(20.0, 10.0));

    /* Do your painting of the custom icon here, including drawing text, shapes, etc. */

    final p = recorder.endRecording();
    final pngBytes = await (await p.toImage(tp.width.toInt() + 40, tp.height.toInt() + 20)).toByteData(format: ImageByteFormat.png);

    final data = Uint8List.view(pngBytes!.buffer);

    return BitmapDescriptor.fromBytes(data);
  }
}
