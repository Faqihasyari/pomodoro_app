import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pomodoro_app/core/models/trigger.dart'; // sesuaikan path jika perlu

class TriggerProvider with ChangeNotifier {
  final List<TriggerModel> _triggers = [];
  final Box<TriggerModel> _triggerBox;

  TriggerProvider({required Box<TriggerModel> triggerBox})
      : _triggerBox = triggerBox {
    _loadTriggers();
  }

  void _loadTriggers() {
    _triggers.clear();
    _triggers.addAll(_triggerBox.values);
    notifyListeners();
  }

  List<TriggerModel> get triggers => _triggers;

  Future<void> addTrigger(String triggerText) async {
    if (triggerText.trim().isEmpty) return;

    final newTrigger = TriggerModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      trigger: triggerText.trim(),
    );

    await _triggerBox.add(newTrigger);
    _loadTriggers();
  }

  Future<void> updateTrigger(String id, String newTriggerText) async {
    final trigger = _triggers.firstWhere((t) => t.id == id);
    trigger.trigger = newTriggerText;
    await trigger.save();
    notifyListeners();
  }

  // trigger buat delete
  Future<void> deleteTrigger(String id) async {
    final trigger = _triggers.firstWhere((t) => t.id == id);
    await trigger.delete();
    _loadTriggers();
  }
}