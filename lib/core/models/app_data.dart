import 'package:hive/hive.dart';

part 'app_data.g.dart';

@HiveType(typeId: 1)
class AppData extends HiveObject {
  @HiveField(0)
  int totalFocusSeconds;

  AppData({this.totalFocusSeconds = 0});
}