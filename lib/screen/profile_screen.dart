import 'dart:io';

import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var name = 'A. Enis Erkaya';
  String? profileImgFilePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Profil'),
        backgroundColor: Colors.grey[850],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    //TODO: imagePicker kullanılacak
                    print('tıklandı');
                  },
                  child: profileImgFilePath == null
                      ? Text(
                    'Profil fotoğrafı seçebilirsiniz.',
                    style: TextStyle(color: Colors.white),
                  )
                      : CircleAvatar(
                    radius: 100.0,
                    backgroundImage: FileImage(new File(profileImgFilePath!)),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey[800],
                height: 60.0,
              ),
              Text(
                'İsim',
                style: TextStyle(color: Colors.grey, letterSpacing: 2.0),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                name,
                style: TextStyle(
                    color: Colors.amberAccent[200],
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                    letterSpacing: 2.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Icon(
                    Icons.email,
                    color: Colors.grey[400],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'enis.erkaya@tubitak.gov.tr',
                    style: TextStyle(color: Colors.grey[400]),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
