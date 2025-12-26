import 'package:flutter/material.dart';

class Containermodel {
  final Icon icon;
  final String lottieAsset;

  Containermodel({required this.icon, required this.lottieAsset});

  Containermodel container({Icon? icon, String? lottieAsset}){
    return Containermodel(icon: icon ?? this.icon, lottieAsset: lottieAsset?? this.lottieAsset);
  }
}