import 'dart:convert';
import 'package:flutter/material.dart';

OscarModel oscarModelFromJson(String str) => OscarModel.fromJson(json.decode(str));

String oscarModelToJson(OscarModel data) => json.encode(data.toJson());

class OscarModel {
    OscarModel({
        this.nif,
        this.nombre,
        this.apellido,
        this.edad,
    });

    int nif;
    String nombre;
    String apellido;
    int edad;

    factory OscarModel.fromJson(Map<String, dynamic> json) => OscarModel(
        nif: json["NIF"],
        nombre: json["Nombre"],
        apellido: json["Apellido"],
        edad: json["Edad"],
    );

    Map<String, dynamic> toJson() => {
        "NIF": nif,
        "Nombre": nombre,
        "Apellido": apellido,
        "Edad": edad,
    };
}