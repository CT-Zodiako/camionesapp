import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _AutBackgraund());
  }
}

class _AutBackgraund extends StatelessWidget {
  const _AutBackgraund({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 1,
      color: Color.fromARGB(255, 0, 0, 0),
      // width: double.infinity,
      // height: double.infinity,
      child: Column(children: [
        const SizedBox(
          height: 0,
        ),
        _ImgDup(),
        _TxtBienvenido(),
        _BottonsInicio()
      ]),
    );
  }
}

class _ImgDup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.5,
     decoration : BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/camionero.jpg'), fit: BoxFit.cover)),
    );
  }
}

class _TxtBienvenido extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.26,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Bienvenido a MueveTruck',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Disfruta de ofertas de carga, servicios y mucho mas!',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class _BottonsInicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Container(
          width: double.infinity,
          height: size.height * 0.1,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.blue.shade900,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Iniciar sesion',
                    style: TextStyle(color: Colors.white),
                  )),
              onPressed: () {
                Navigator.popAndPushNamed(context, 'conect');
              }),
        ),
        Container(
          width: double.infinity,
          height: size.height * 0.1,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.blueAccent.shade400,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Text(
                    'Registrarse',
                    style: TextStyle(color: Colors.white),
                  )),
              onPressed: () {
                Navigator.popAndPushNamed(context, 'new_account');
              }),
        ),
      ],
    );
  }
}
