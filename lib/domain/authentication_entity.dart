import 'package:caflutterdemo/domain/account_entity.dart';
import './account_entity.dart';

abstract class AuthenticationEntity {
  Future<AccountEntity> auth(AuthenticationParams params);
}

class AuthenticationParams {
  final String email;
  final String password;

  AuthenticationParams({required this.email, required this.password});
}
