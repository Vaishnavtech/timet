import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class Item {
  String live;

  Item({required this.live});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      live: json['live'],
    );
  }

  Map<String, dynamic> toJson() => {
    'live': live,
  };
}


