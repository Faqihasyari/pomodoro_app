// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro_app/core/constants/color.dart';
import 'package:pomodoro_app/core/constants/font.dart';
import 'package:pomodoro_app/core/models/dotLine.dart';
import 'package:pomodoro_app/core/models/trigger.dart';
import 'package:pomodoro_app/presentation/screens/trigger_provider.dart';
import 'package:provider/provider.dart';

class Triggerwidgets extends StatefulWidget {
  const Triggerwidgets({super.key});

  @override
  State<Triggerwidgets> createState() => _TriggerwidgetsState();
}

class _TriggerwidgetsState extends State<Triggerwidgets> {
  @override
  Widget build(BuildContext context) {
    final triggerController = TextEditingController();
    final trigger = context.watch<TriggerProvider>().triggers;

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.8,
      height: screenHeight * 0.4,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bgContainerTrigger.withOpacity(0.8),
        borderRadius: BorderRadius.circular(5),
        
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ke Distract kenapa banh?', style: frindly,),
          const DottedLineTriggers(color: Colors.black, height: 3,),
          Row(
            children: [
              Expanded(child: TextField(
                cursorColor: Colors.black,
                style: fontBtnTimer,
                controller: triggerController,
                decoration: InputDecoration(
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                          color: garis,
                          width: 2,
                        )
                  ),
                  prefix: const SizedBox(width: 3,),
                   enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: garis,
                          width: 2,
                        ),),
                        hintText: 'Tambahkan Distract...',
                        hintStyle: GoogleFonts.mansalva(letterSpacing: 2)
                ),
              )),
              const SizedBox(width: 10,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 2,
                  
                  backgroundColor: Colors.white,
                  minimumSize: const Size(20, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(6)),
                  side: const BorderSide(width: 3, color: Colors.black),
                ),
                onPressed: () {
                context.read<TriggerProvider>().addTrigger(triggerController.text);
              }, child: const Icon(Icons.add, color: Colors.black,))
            ],
          ),
            const SizedBox(height: 15),

          Expanded(child: ListView.builder(
            itemCount: trigger.length,
            itemBuilder: (context, index) {
            final trig = trigger[index];
            return TriggerItem(trigger: trig);
          },))
        ],
      ),
    );
  }
}

class TriggerItem extends StatelessWidget {
  final TriggerModel trigger;

  const TriggerItem({super.key, required this.trigger});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      children: [
        Expanded(child: Text(trigger.trigger, style: scroller,)),
        InkWell(
            onTap: () {
              context.read<TriggerProvider>().deleteTrigger(trigger.id);
            },
            child: Image.asset('assets/icon/closeIcon.png', scale: 20,))
      ],
    ),
    );
  }
}