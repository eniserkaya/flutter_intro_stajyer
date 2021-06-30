import 'package:flutter_intro/model/sehir.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kullanici.g.dart';

@JsonSerializable()
class Kullanici extends Object {
  String ad;
  String soyad;
  List<Sehir> gezilenYerler;



  Kullanici(this.ad, this.soyad, this.gezilenYerler);

  factory Kullanici.fromJson(Map<String, dynamic> json) =>
      _$KullaniciFromJson(json);
}