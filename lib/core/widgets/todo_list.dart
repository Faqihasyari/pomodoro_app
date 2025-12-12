import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro_app/core/constants/font.dart';
import 'package:pomodoro_app/presentation/screens/provider.dart';
import 'package:provider/provider.dart';

class CuteTodoPage extends StatelessWidget {
  const CuteTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
  final _taskController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xfff7f2e8),
      body: Center(
        child: Container(
          width: 330,
          height: 500,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.orange.withOpacity(0.5),
                blurRadius: 2,
                offset: const Offset(5, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              Text("To Do List", style: frindly),
              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _taskController,
                      decoration: InputDecoration(
                        hintText: "Add task...",
                        prefix: const SizedBox(width: 8),
                        hintStyle: GoogleFonts.mansalva(letterSpacing: 2),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),

                        enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: Size(20, 50),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onPressed: () {
                      context.read<TaskProvider>().addTask(_taskController.text);
                      _taskController.clear();
                    },
                    child: const Icon(Icons.add),
                  ),
                  // Container(
                  //   width: 40,
                  //   height: 50,
                  //   decoration: BoxDecoration(
                  //     color: Colors.black,
                  //     borderRadius: BorderRadius.circular(6),
                  //   ),
                  //   child: const Icon(Icons.add, color: Colors.white),
                  // ),
                ],
              ),

              const SizedBox(height: 15),

              // Contoh item
              _todoItem("tugas proposal"),
              _todoItem("tugas PPT"),
              _todoItem("bikin video"),
              _todoItem("masak"),
              _todoItem("membasmi penjahat"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _todoItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Checkbox(
            value: false,
            onChanged: (_) {},
            shape: const CircleBorder(),
          ),
          Expanded(child: Text(title, style: const TextStyle(fontSize: 16))),
          IconButton(onPressed: () {}, icon: const Icon(Icons.close, size: 18)),
        ],
      ),
    );
  }
}
