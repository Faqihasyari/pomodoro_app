import 'package:flutter/material.dart';
import 'package:pomodoro_app/core/constants/color.dart';
import 'package:pomodoro_app/core/widgets/todo_list.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text('jaksdjasndansdajdjansjandasndaalsndlnsdasnajsndn'),
              ],
            )),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                SizedBox(
                  width: 300,
                  height: 300,
                  child: Stack(
                    children: [
                      CuteTodoPage(),
                      // Positioned(
                      //   left: 70,
                      //   top: 250,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: List.generate(
                      //       12,
                      //       (i) => Container(
                      //         margin: const EdgeInsets.symmetric(horizontal: 4),
                      //         width: 12,
                      //         height: 12,
                      //         decoration: BoxDecoration(
                      //           color: Colors.black,
                      //           borderRadius: BorderRadius.circular(100),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
