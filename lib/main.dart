import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/fantasy/fantasy_home.dart';

void main(List<String> args) {
  runApp(GetMaterialApp(
    title: "News Application",
    home: const FantasyHome(),
    theme: ThemeData(fontFamily: "Poppins"),
  ));
}
