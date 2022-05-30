import 'dart:async';

import 'package:duo/widgets/mapa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';

class ViajePage extends StatefulWidget {
  static String id = 'viaje_page';

  @override
  _ViajePageState createState() => _ViajePageState();
}

class _ViajePageState extends State<ViajePage> {
  late GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];
  Timer? _debounce;
  @override
  void initState() {
    String apiKey = 'AIzaSyDid810tA2WZFYvd8XXRjUY0HPoen9YPFM';
    googlePlace = GooglePlace(apiKey);
  }

  void AutocompleteSearch(String value) async {
    var result = await googlePlace.autocomplete.get(value);
    if (result != null && result.predictions != null && mounted) {
      setState(() {
        print(result.predictions!.first.description);
        predictions = result.predictions!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                '\n ofrecer viaje ',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0),
              ),
              Recoger(),
              Entregar(),
              Toneladas(),
              Producto(),
              Flete(),
              Transporte(),
              Formadepago(),
              SizedBox(
                height: 100.0,
              ),
              continuar(),
            ],
          ),
        ),
      ),
    ));
  }

  Widget Recoger() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        color: Colors.black,
        child: TextField(
          style: const TextStyle(color: Colors.white, fontSize: 15.0),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            icon: Icon(
              Icons.add_location,
              color: Colors.white,
            ),
            labelStyle: TextStyle(color: Colors.white),
            hintStyle: TextStyle(color: Colors.grey),
            hintText: '  lugar',
            labelText: 'Recoger en:',
          ),
          onChanged: (value) {
            if (_debounce?.isActive ?? false) _debounce!.cancel();
            _debounce = Timer(const Duration(milliseconds: 1000), () {
              if (value.isNotEmpty) {
                AutocompleteSearch(value);
              } else {}
            });
          },
        ),
      );
    });
  }

  Widget Entregar() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        color: Colors.black,
        child: TextField(
          style: const TextStyle(color: Colors.white, fontSize: 15.0),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            icon: Icon(
              Icons.add_location_alt_outlined,
              color: Colors.white,
            ),
            labelStyle: TextStyle(color: Colors.white),
            hintStyle: TextStyle(color: Colors.grey),
            hintText: '  lugar',
            labelText: 'Entregar en:',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget Toneladas() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        color: Colors.black,
        child: TextField(
          style: const TextStyle(color: Colors.white, fontSize: 15.0),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            icon: Icon(
              Icons.balance,
              color: Colors.white,
            ),
            hintStyle: TextStyle(color: Colors.grey),
            hintText: '  Tonteladas',
            labelStyle: TextStyle(color: Colors.white),
            labelText: 'Peso(T)',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget Producto() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        color: Colors.black,
        child: TextField(
          style: const TextStyle(color: Colors.white, fontSize: 15.0),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            icon: Icon(
              Icons.production_quantity_limits,
              color: Colors.white,
            ),
            hintStyle: TextStyle(color: Colors.grey),
            hintText: '  Producto',
            labelStyle: TextStyle(color: Colors.white),
            labelText: 'Producto',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget Flete() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        color: Colors.black,
        child: TextField(
          style: const TextStyle(color: Colors.white, fontSize: 15.0),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            icon: Icon(
              Icons.attach_money,
              color: Colors.white,
            ),
            hintStyle: TextStyle(color: Colors.grey),
            hintText: ' dinero ',
            labelStyle: TextStyle(color: Colors.white),
            labelText: 'Flete',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget Transporte() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        color: Colors.black,
        child: TextField(
          style: const TextStyle(color: Colors.white, fontSize: 15.0),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            icon: Icon(
              Icons.local_shipping_outlined,
              color: Colors.white,
            ),
            hintStyle: TextStyle(color: Colors.grey),
            hintText: ' Camion',
            labelStyle: TextStyle(color: Colors.white),
            labelText: 'Transporte',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget Formadepago() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        color: Colors.black,
        child: TextField(
          style: const TextStyle(color: Colors.white, fontSize: 15.0),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(
              Icons.price_change_outlined,
              color: Colors.white,
            ),
            hintStyle: TextStyle(color: Colors.grey),
            hintText: ' Pago',
            labelStyle: TextStyle(color: Colors.white),
            labelText: 'Forma de pago',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget continuar() {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 30));
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MapaPage()));
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.blueAccent.shade400),
                padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                textStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: 18),
                )),
            child: const Text('    Continuar    '),
          ),
        ],
      ),
    );
  }
}
