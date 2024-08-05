import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import '../const/const.dart';
import '../service/service_api.dart';

class Cat{
  String id;
  String name;
  String origin;
  String description;
  String life_span;
  String reference_image_id;
  String imageUrl;

  Cat({
    required this.id,
    required this.name,
    required this.origin,
    required this.description,
    required this.life_span,
    required this.reference_image_id,
    required this.imageUrl
  });

  factory Cat.fromJson(Map<String, dynamic> json) => Cat(
    id: json["id"],
    name: json["name"],
    origin: json["origin"],
    description: json["description"],
    life_span: json["life_span"],
    reference_image_id: json["reference_image_id"],
      imageUrl : json["imageUrl"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "origin": origin,
    "description": description,
    "life_span" : life_span,
    "reference_image_id" : reference_image_id,
    "imageUrl" : imageUrl
  };
}