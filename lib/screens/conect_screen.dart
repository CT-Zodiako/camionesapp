import 'package:duo/providers/login_form_proivder.dart';
import 'package:duo/services/services.dart';
import 'package:duo/ui/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _AutBackgraund());
  }
}

class _AutBackgraund extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 0, 0, 0),
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 200,
          ),
          _FormContainer(
            child: Column(
              children: [
                Text('Iniciar sesion',
                    style: TextStyle(
                        color: Color.fromARGB(192, 255, 255, 255),
                        fontSize: 30)),
                SizedBox(
                  height: 30,
                ),
                ChangeNotifierProvider(
                  create: (_) => LoginFormProvider(),
                  child: _LoginForm(),
                )
              ],
            ),
          ),
          SizedBox(
            height: 60,
          ),
          TextButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, 'new_account'),
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 16, 41, 182).withOpacity(0.1)),
                  shape: MaterialStateProperty.all(StadiumBorder())),
              child: Text(
                'Registrarse',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              )),
          SizedBox(
            height: 60,
          ),
        ]),
      ),
    );
  }
}

class _FormContainer extends StatelessWidget {
  final Widget child;

  const _FormContainer({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: Estilosdelformulario(),
        child: this.child,
      ),
    );
  }

  BoxDecoration Estilosdelformulario() => BoxDecoration(
          color: Color.fromARGB(83, 18, 24, 114),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 15, offset: Offset(0, 5))
          ]);
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
          key: loginForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.white),
                decoration: InputDecorations.authInputDecoration(
                    hintText: '',
                    labelText: 'Correo electronico',
                    prefixIcon: Icons.mail),
                onChanged: (value) => loginForm.email = value,
                validator: (value) {
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = new RegExp(pattern);

                  return regExp.hasMatch(value ?? '')
                      ? null
                      : 'Correo incorrecto';
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                autocorrect: false,
                obscureText: true,
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                    hintText: '',
                    labelText: 'Contraseña',
                    prefixIcon: Icons.password),
                onChanged: (value) => loginForm.password = value,
                validator: (value) {
                  if (value != null && value.length >= 8) return null;
                  return 'La contraseña debe ser de minimo de 8 caracteres';
                },
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: Colors.blue.shade900,
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      child: Text(
                        loginForm.isLoading ? 'Cargando' : 'Conectar',
                        style: TextStyle(color: Colors.white),
                      )),
                  onPressed: loginForm.isLoading
                      ? null
                      : () async {
                          FocusScope.of(context).unfocus();
                          final authService =
                              Provider.of<AuthService>(context, listen: false);
                          if (!loginForm.isValidForm()) return;
                          loginForm.isLoading = true;

                          //Todo validar si el login es correco
                          final String? errorMessage = await authService.login(
                              loginForm.email, loginForm.password);
                          // loginForm.email, loginForm.password);
                          if (errorMessage == null) {
                            Navigator.pushReplacementNamed(context, 'home');
                          } else {
                            ///todo mostrar error en pantalla
                            // print(errorMessage);
                            NotificationsService.showSnackbar(errorMessage);
                            loginForm.isLoading = false;
                          }
                        })
            ],
          )),
    );
  }
}
