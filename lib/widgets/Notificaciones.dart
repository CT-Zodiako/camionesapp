import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notificaciones extends StatefulWidget {
  static String id= '_notificaciones';

  @override
  _Notificaciones createState() => _Notificaciones();
}

class _Notificaciones extends State<Notificaciones> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('             Historial'),
      ),
        backgroundColor: Colors.black,
        body: Container (
          child: Column(
              children: [
                 Text(
                  '\n\n\n\n\n\n\n\n\n\n\n\n               no hay notificaciones \n\n\n',
                    textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white24, fontSize: 20.0),     
                 )
                 ],
          ),
        ),      
    );
  }
}