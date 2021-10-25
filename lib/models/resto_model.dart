import 'dart:convert';

import 'package:restaurant_app_sub1/models/menus_model.dart';

class RestoModel {
  String? id;
  String? name;
  String? description;
  String? pictureId;
  String? city;
  num? rating;
  Menu? menus;

  RestoModel(
      {this.id,
      this.name,
      this.description,
      this.pictureId,
      this.city,
      this.rating,
      this.menus});

  RestoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    pictureId = json['pictureId'];
    city = json['city'];
    rating = json['rating'];
    menus = Menu.fromJson(json['menus']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'pictureId': pictureId,
      'city': city,
      'rating': rating,
      'menus': menus?.toJson()
    };
  }
}

List<RestoModel> parseResto(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json);
  return parsed.map((e) => RestoModel.fromJson(e)).toList();
}
