// ignore_for_file: deprecated_member_use

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
    final taskController = TextEditingController();
    final tasks = context.watch<TaskProvider>().tasks;

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return  Container(
        width: screenWidth * 0.8,
      height: screenHeight * 0.4,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 2, color: Colors.black),
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
                    style: fontBtnTimer,
                    cursorColor: Colors.black,
                    controller: taskController,
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
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: garis,
                          width: 2,
                        ),
                      ),
                      

                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: garis,
                          width: 2,
                        ),

                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: btn,
                    side: const BorderSide(color: garis, width: 2),
                    minimumSize: const Size(20, 50),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    
                  ),
                  onPressed: () {
                    context.read<TaskProvider>().addTask(
                      taskController.text,
                    );
                    taskController.clear();
                  },
                  child: const Icon(Icons.add, color: garis,),
                ),
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
      
            
          ],
        ),
      );
    
  }
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
              style: scroller,
            ),
          ),
          InkWell(
            onTap: () {
              context.read<TaskProvider>().deleteTask(task.id);
            },
            child: Image.asset('assets/icon/closeIcon.png', scale: 20,))
        ],
      ),
    );
  }
}
