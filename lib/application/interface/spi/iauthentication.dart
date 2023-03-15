import 'package:caflutterdemo/domain/account_entity.dart';
import 'package:caflutterdemo/domain/authentication_params.dart';

abstract class IAuthentication {
  Future<AccountEntity> auth(AuthenticationParams params);
  Future<bool> logout();
}
