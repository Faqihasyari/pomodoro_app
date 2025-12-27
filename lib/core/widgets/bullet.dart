import 'package:flutter/material.dart';

class Bullet extends StatelessWidget {
  const Bullet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 370),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          12,
          (i) => Container(
            margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.013),
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