import 'dart:convert';

import 'package:restaurant_app_sub1/models/resto_model.dart';

class Restaurants {
  List restaurants;

  Restaurants({required this.restaurants});

  factory Restaurants.fromJson(Map<String, dynamic> json) => Restaurants(
      restaurants: List<RestoModel>.from(
          json['restaurants'].map((o) => RestoModel.fromJson(o))));

  Map<String, dynamic> toJson() =>
      {"restaurants": List<dynamic>.from(restaurants.map((o) => o.toJson()))};
}

Restaurants restaurantFromJson(String str) =>
    Restaurants.fromJson(json.decode(str));
