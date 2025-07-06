import 'package:core/core.dart';

import '../../domain/models/authentication_model.dart';
import '../../domain/models/authentication_token_model.dart';
import '../models/authentication_response.dart';

class AuthenticationMapper
    extends Mapper<AuthenticationResponse, AuthenticationModel> {
  const AuthenticationMapper();

  @override
  AuthenticationModel cast(AuthenticationResponse model) => AuthenticationModel(
        uid: model.uid,
        email: model.email,
        authenticationTokenModel: AuthenticationTokenModel(
          authTime: model.authToken.authTime,
          expirationTime: model.authToken.expirationTime,
          issuedAtTime: model.authToken.issuedAtTime,
          signInProvider: model.authToken.signInProvider,
          token: model.authToken.token,
          refreshToken: model.authToken.refreshToken,
        ),
      );
}
