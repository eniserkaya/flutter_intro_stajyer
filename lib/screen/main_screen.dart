import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intro/model/kullanici.dart';
import 'package:flutter_intro/screen/profile_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Intro'),
      ),
      body: Center(
        child: Text(
          'Hoşgeldiniz',
          style: TextStyle(fontSize: 40.0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          sunucudanVerileriGetir().then((response) {
            Kullanici kullanici = Kullanici.fromJson(json.decode(response.data));
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(kullanici)));
          });
        },
        child: Icon(Icons.ac_unit),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text('Örnek İsim'),
                accountEmail: Text('asd@dsa.com'),
              currentAccountPicture: GestureDetector(
                onTap: () => print('Profil resmine tıklandı!'),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text('Örnek'),
                ),
              ),
            ),
            ListTile(
              title: Text('Profil'),
              leading: Icon(Icons.person),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(null))),
            )
          ],
        ),
      ),
    );
  }

  Future<Response> sunucudanVerileriGetir() async {
    var dio = Dio();
    createHttpRequestConfig(dio);
    Response? response;
    await dio
        .get('https://www.eniserkaya.com/tutorials/flutter/json_parser.php')
        .then((resp) {
      response = resp;
    });
    return response!;
  }

  createHttpRequestConfig(dio) {
    dio.options.connectTimeout = 15000;
    dio.options.receiveTimeout = 15000;
    dio.options.responseType = ResponseType.plain;
  }
}
