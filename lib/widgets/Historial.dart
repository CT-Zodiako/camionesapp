import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Historial extends StatefulWidget {
  static String id = '_historial';

  @override
  _Historial createState() => _Historial();
}

class _Historial extends State<Historial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('             Historial'),
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
