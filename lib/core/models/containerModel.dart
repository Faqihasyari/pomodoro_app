import 'package:flutter/material.dart';

class Containermodel {
  final IconData? icon;
  final String? lottieAsset;

  Containermodel({this.icon, this.lottieAsset});

  Containermodel container({IconData? icon, String? lottieAsset}){
    return Containermodel(icon: icon ?? this.icon, lottieAsset: lottieAsset?? this.lottieAsset);
  }
}