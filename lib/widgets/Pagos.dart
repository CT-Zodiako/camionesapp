import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pagos extends StatefulWidget {
  static String id = '_notificaciones';

  @override
  _Pagos createState() => _Pagos();
}

class _Pagos extends State<Pagos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('             Pagos'),
      ),
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: [
            Text(
              '\n\n\n\n\n\n\n\n\n\n\n\n               Aun no ofreces viajes \n\n\n',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white24,
                  fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }
}
