import 'package:flutter/material.dart';
import 'package:restaurant_app_sub1/models/resto_model.dart';

class DetailScreen extends StatelessWidget {
  final RestoModel resto;
  const DetailScreen({Key? key, required this.resto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(resto.name.toString()),
    );
  }
}
