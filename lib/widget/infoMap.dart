import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  // "경남 창원시 마산회원구 봉암북21길" 주소의 예상 위도와 경도
  static const LatLng _kLocation = LatLng(35.223540, 128.599773);

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: _kLocation,
    zoom: 14.0, // 원하는 줌 레벨로 조절할 수 있습니다.
  );

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.hybrid,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
  }
}
