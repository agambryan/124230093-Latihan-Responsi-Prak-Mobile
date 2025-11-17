import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  late String username;

  @HiveField(1)
  late String password;

  @HiveField(2)
  late String nama;

  @HiveField(3)
  late String nim;

  User({
    required this.username,
    required this.password,
    this.nama = 'Muhammad Agam Febryan',
    this.nim = '124230093',
  });
}