import 'package:conduit/conduit.dart';

class User extends ManagedObject<_User> implements _User {}

class _User {
  @primaryKey
  int? id;
  @Column(unique: true, indexed: true)
  String? phoneNumber;
  @Column(nullable: true)
  String? accessToken;
  @Column(nullable: true)
  String? refreshToken;
  @Column(omitByDefault: true)
  String? salt;
  @Column(omitByDefault: true)
  String? hashPhone;
}
