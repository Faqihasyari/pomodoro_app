import 'package:flutter/material.dart';

class Bullet extends StatelessWidget {
  const Bullet({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
                        left: 50,
                        top: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            12,
                            (i) => Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: 9,
                              height: 9,
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