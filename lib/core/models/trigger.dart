import 'package:hive/hive.dart';

part 'trigger.g.dart';

@HiveType(typeId: 2)
class TriggerModel extends HiveObject{
  @HiveField(0)
  String id;

  @HiveField(1)
  String trigger;

  TriggerModel({
    required this.id,
    required this.trigger
  });

  TriggerModel copyWith({String? id, String? trigger}){
    return TriggerModel(id: id??this.id, trigger: trigger?? this.trigger);
  }
}