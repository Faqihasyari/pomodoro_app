import 'package:flutter/material.dart';

class Bullet extends StatelessWidget {
  const Bullet({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
                        left: 70,
                        top: 250,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            12,
                            (i) => Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                        ),
                      );
  }
}