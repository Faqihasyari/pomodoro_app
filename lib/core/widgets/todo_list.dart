import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro_app/core/constants/color.dart';
import 'package:pomodoro_app/core/constants/font.dart';
import 'package:pomodoro_app/core/models/task.dart';
import 'package:pomodoro_app/presentation/screens/provider.dart';
import 'package:provider/provider.dart';

class CuteTodoPage extends StatelessWidget {
  const CuteTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _taskController = TextEditingController();
    final tasks = context.watch<TaskProvider>().tasks;

    return Scaffold(
      backgroundColor: bg ,
      body: Container(
        width: 300,
        height: 300,
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
                          color: garis,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: btn,
                    side: BorderSide(color: garis, width: 2),
                    minimumSize: Size(20, 50),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    
                  ),
                  onPressed: () {
                    context.read<TaskProvider>().addTask(
                      _taskController.text,
                    );
                    _taskController.clear();
                  },
                  child: const Icon(Icons.add, color: garis,),
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
      
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return TaskItem(task: task);
                },
              ),
            ),
      
            // if (tasks.isEmpty)... [
            //   Center(
            //     child: Text('Belum ada task'),
            //   )
            // ] else ... [
            //   ListView.builder(itemBuilder: (context, index) {
            //     final task = tasks[index];
            //     return TaskItem(task:task)
            //   },)
            // ]
      
            // Contoh item
            // _todoItem("tugas proposal"),
            // _todoItem("tugas PPT"),
            // _todoItem("bikin video"),
            // _todoItem("masak"),
            // _todoItem("membasmi penjahat"),
          ],
        ),
      ),
    );
  }

  // Widget _todoItem(String title) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 6),
  //     child: Row(
  //       children: [
  //         Checkbox(
  //           value: false,
  //           onChanged: (_) {},
  //           shape: const CircleBorder(),
  //         ),
  //         Expanded(child: Text(title, style: const TextStyle(fontSize: 16))),
  //         IconButton(onPressed: () {}, icon: const Icon(Icons.close, size: 18)),
  //       ],
  //     ),
  //   );
  // }
}


class TaskItem extends StatelessWidget {
  final TaskModel task; 

  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Checkbox(
            value: task.isCompleted,
            onChanged: (value) {
              context.read<TaskProvider>().toggleTask(task.id);
            },
            shape: const CircleBorder(),
            activeColor: Colors.orange,
          ),
          Expanded(
            child: Text(
              task.task, 
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          IconButton(
            onPressed: () {
              context.read<TaskProvider>().deleteTask(task.id);
            },
            icon: const Icon(Icons.close, size: 18),
          ),
        ],
      ),
    );
  }
}
