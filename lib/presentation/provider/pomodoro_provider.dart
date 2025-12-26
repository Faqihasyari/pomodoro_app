import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pomodoro_app/core/models/app_data.dart';

enum PomodoroActionStatus { success, notInitialized, notRunning }


class PomodoroProvider with ChangeNotifier {
  // declare audio
  late final AudioPlayer _audioPlayer;
  late int _focusDuration;  
  late int _restDuration;    
  int _remainingTime = 0;
  bool _isRunning = false;
  bool _isFocusSession = true;
  bool _isInitializated = false;
  Timer? _timer;
  int _totalFocusSeconds = 0;
  final Box<AppData> _dataBox;

  PomodoroProvider({required Box<AppData> dataBox}) : _dataBox = dataBox{
    _remainingTime = 25 * 60;
    _audioPlayer = AudioPlayer();
  }

  // Getter
  int get remainingTime => _remainingTime;
  bool get isRunning => _isRunning;
  bool get isInitializated => _isInitializated;
  bool get isFocusSession => _isFocusSession;
  String get sessionType => _isFocusSession ? 'Focus' : 'Rest';

  // getter total fokus
  int get totalFocusSeconds => _totalFocusSeconds;
  int get totalFocusMinutes => _totalFocusSeconds ~/ 60;

  int get activeFocusMinutes => _focusDuration ~/ 60;
  int get activeRestMinutes => _restDuration ~/ 60;

  // ambil total
  int get totalFokusSeconds {
    final data = _dataBox.get('main')?? AppData();
    return data.totalFocusSeconds;
  }



  // Inisialisasi waktu dari input user
  void initialize(int focusMinutes, int restMinutes) {
    _focusDuration = focusMinutes * 60;
    _restDuration = restMinutes * 60;
    _remainingTime = _focusDuration;
    _isFocusSession = true;
    _isRunning = false;
    _timer?.cancel();
    _isInitializated = true;
    notifyListeners();
  }

  Future<void> _playNotificationSound() async {
    try {
      await _audioPlayer.play(AssetSource('assets/audio/notifikasi.mp3'));
    } catch (e) {
      print('Gagal memnunculkan suara $e');
    }
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
      final current = _dataBox.get('main')?? AppData();
      current.totalFocusSeconds += _focusDuration;
      _dataBox.put('main', current);
      
      // mulai jeda
      _isFocusSession = false;
      _remainingTime = _restDuration;
    } else {
      _isFocusSession = true;
      _remainingTime = _focusDuration;
    }
    _playNotificationSound();
    _startTimer();
    notifyListeners();
  }

  PomodoroActionStatus start() {
    if (!_isInitializated) {
      return PomodoroActionStatus.notInitialized;
    }
    if (_isRunning) return PomodoroActionStatus.success;
    _isRunning = true;
    _startTimer();
    notifyListeners();
    return PomodoroActionStatus.success;
  }

  void pause() {
    _timer?.cancel();
    _timer = null;
    _isRunning = false;
    notifyListeners();
  }

  PomodoroActionStatus reset() {
    if (!_isInitializated) {
    return PomodoroActionStatus.notInitialized;
  }
    _timer?.cancel();
    _timer = null;
    _isRunning = false;
    _remainingTime = _isFocusSession ? _focusDuration : _restDuration;
    notifyListeners();
    return PomodoroActionStatus.success;
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _timer?.cancel();
    super.dispose();
  }
}