import 'dart:async';

import 'package:duo/widgets/Historial.dart';
import 'package:duo/widgets/Notificaciones.dart';
import 'package:duo/widgets/Pagos.dart';
import 'package:duo/widgets/Perfil.dart';
import 'package:duo/widgets/viaje.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';

class MapaPage extends StatelessWidget {
  static String id = 'mapa_page';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  static final CameraPosition _position = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(2.449773, -76.593610),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  @override
  Widget build(BuildContext context) {
    final authServices = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                children: [
                  SizedBox(height: 10.0),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Update{
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MapaPage()));
                // ...
              },
            ),
            ListTile(
              leading: Icon(Icons.supervised_user_circle_outlined),
              title: const Text('Perfil'),
              onTap: () {
                // Update{
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Perfil()));
                // ...
              },
            ),
            ListTile(
              leading: Icon(Icons.local_shipping_outlined),
              title: const Text('Ofrecer viaje'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ViajePage()));
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(Icons.history_rounded),
              title: const Text('Historial'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Historial()));
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications_active),
              title: const Text('Notificaciones'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Notificaciones()));
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(Icons.attach_money_rounded),
              title: const Text('Pago'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Pagos()));
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: const Text('Salir'),
              onTap: () {
                authServices.logout();
                Navigator.pushReplacementNamed(context, 'login');
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      key: _scaffoldKey,
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _cameraPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text(''),
        icon: Icon(Icons.add_location),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(_position),
    );
  }
}
