import 'package:hive/hive.dart';
part 'home_hive_dm.g.dart';

@HiveType(typeId: 1)
class HomeHiveDm extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String subject;
  @HiveField(4)
  final String body;
  @HiveField(5)
  final String createdAt;

  HomeHiveDm({
    required this.email,
    required this.subject,
    required this.body,
    required this.name,
    required this.createdAt,
    required this.id,
  });
}
