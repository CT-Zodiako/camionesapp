import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _fireBaseToken = 'AIzaSyBoLETARxKVbLes98VuisOyglJ39ZHxBdE';

  final storage = new FlutterSecureStorage();
//todo sii retorna algo es error  si no esta bien

  Future<String?> createUser(
    String email,
    String password,
  ) async {
    final Map<String, dynamic> authDara = {
      'email': email,
      'password': password,
    };

    final url =
        Uri.https(_baseUrl, '/v1/accounts:signUp', {'key': _fireBaseToken});

    final resp = await http.post(url, body: json.encode(authDara));

    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp.containsKey('idToken')) {
      //TODO El token toca guararlo en algun lugar seguro
      await storage.write(key: 'token', value: decodedResp['idToken']);
// decodedResp['idToken'];
      return null;
    } else {
      return decodedResp['error']['message'];
    }
  }

  Future<String?> login(
    String email,
    String password,
  ) async {
    final Map<String, dynamic> authDara = {
      'email': email,
      'password': password,
    };

    final url = Uri.https(
        _baseUrl, '/v1/accounts:signInWithPassword', {'key': _fireBaseToken});

    final resp = await http.post(url, body: json.encode(authDara));

    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp.containsKey('idToken')) {
      //TODO El token toca guararlo en algun lugar seguro
      // decodedResp['idToken'];
      await storage.write(key: 'token', value: decodedResp['idToken']);
      return null;
    } else {
      return decodedResp['error']['message'];
    }
  }

  Future logout() async {
    await storage.delete(key: 'token');
    return;
  }

  Future<String> readToken() async {
    return await storage.read(key: 'token') ?? '';
  }
}
