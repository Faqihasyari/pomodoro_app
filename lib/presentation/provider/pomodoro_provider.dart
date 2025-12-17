import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:pomodoro_app/core/models/app_data.dart';

class PomodoroProvider with ChangeNotifier {
  late int _focusDuration;  
  late int _restDuration;    
  int _remainingTime = 0;
  bool _isRunning = false;
  bool _isFocusSession = true;
  Timer? _timer;
  int _totalFocusSeconds = 0;
  final Box<AppData> _dataBox;

  PomodoroProvider({required Box<AppData> dataBox}) : _dataBox = dataBox;


  // Getter
  int get remainingTime => _remainingTime;
  bool get isRunning => _isRunning;
  bool get isFocusSession => _isFocusSession;
  String get sessionType => _isFocusSession ? 'Focus' : 'Rest';

  // getter total fokus
  int get totalFocusSeconds => _totalFocusSeconds;
  int get totalFocusMinutes => _totalFocusSeconds ~/ 60;



  // Inisialisasi waktu dari input user
  void initialize(int focusMinutes, int restMinutes) {
    _focusDuration = focusMinutes * 60;
    _restDuration = restMinutes * 60;
    _remainingTime = _focusDuration;
    _isFocusSession = true;
    _isRunning = false;
    _timer?.cancel();
    notifyListeners();
  }



  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        _remainingTime--;
        notifyListeners();
      } else {
        _timer?.cancel();
        _switchSession();
        notifyListeners();
      }
    });
  }

  void resetTotalFocus() {
    _totalFocusSeconds = 0;
    notifyListeners();
  }

  void _switchSession() {
    if (_isFocusSession) {
      // setiap fokus selesai akan menambahkannya ke total fokus
      _totalFocusSeconds += _focusDuration - _remainingTime;

      // mulai jeda
      _isFocusSession = false;
      _remainingTime = _restDuration;
    } else {
      _isFocusSession = true;
      _remainingTime = _focusDuration;
    }
    _startTimer();
    notifyListeners();
  }

  void start() {
    if (_isRunning) return;
    _isRunning = true;
    _startTimer();
    notifyListeners();
  }

  void pause() {
    _timer?.cancel();
    _timer = null;
    _isRunning = false;
    notifyListeners();
  }

  void reset() {
    _timer?.cancel();
    _timer = null;
    _isRunning = false;
    _remainingTime = _isFocusSession ? _focusDuration : _restDuration;
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}