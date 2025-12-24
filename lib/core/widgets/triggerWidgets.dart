import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro_app/core/constants/color.dart';
import 'package:pomodoro_app/core/constants/font.dart';
import 'package:pomodoro_app/core/models/dotLine.dart';
import 'package:pomodoro_app/core/models/trigger.dart';
import 'package:pomodoro_app/presentation/screens/provider.dart';
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
    return Container(
      width: 300,
      height: 300,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bgContainerTrigger.withOpacity(0.8),
        borderRadius: BorderRadius.circular(5),
        
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ke trigger kenapa banh?', style: frindly,),
          DottedLineTriggers(color: Colors.black, height: 3,),
          Row(
            children: [
              Expanded(child: TextField(
                controller: triggerController,
                decoration: InputDecoration(
                  prefix: const SizedBox(width: 3,),
                   enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: garis,
                          width: 2,
                        ),),
                        hintText: 'Tambahkan Trigger...',
                        hintStyle: GoogleFonts.mansalva(letterSpacing: 2)
                ),
              )),
              SizedBox(width: 10,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 2,
                  
                  backgroundColor: Colors.white,
                  minimumSize: Size(20, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(6)),
                  side: BorderSide(width: 3, color: Colors.black),
                ),
                onPressed: () {
                context.read<TriggerProvider>().addTrigger(triggerController.text);
              }, child: Icon(Icons.add, color: Colors.black,))
            ],
          ),
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
    return Padding(padding: EdgeInsets.only(bottom: 5),
    child: Row(
      children: [
        Expanded(child: Text(trigger.trigger)),
        IconButton(onPressed: () {
          context.read<TriggerProvider>().deleteTrigger(trigger.id);
        }, icon: Icon(Icons.close))
      ],
    ),
    );
  }
}