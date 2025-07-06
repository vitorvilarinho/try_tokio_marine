import 'package:auth/src/auth_service.dart';
import 'package:auth/src/data/data_sources/data_source_service.dart';
import 'package:auth/src/domain/repositories/remove_user_repository.dart';
import 'package:auth/src/domain/repositories/sign_in_with_email_and_password_repository.dart';
import 'package:auth/src/domain/repositories/sign_out_repository.dart';
import 'package:auth/src/domain/repositories/sign_up_with_email_and_password_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user/user.dart';

class MockDataSourceService extends Mock implements DataSourceService {}

class MockSignInWithEmailAndPasswordRepository extends Mock
    implements SignInWithEmailAndPasswordRepository {}

class MockSignOutRepository extends Mock implements SignOutRepository {}

class MockRemoveUserRepository extends Mock implements RemoveUserRepository {}

class MockSignUpWithEmailAndPasswordRepository extends Mock
    implements SignUpWithEmailAndPasswordRepository {}

class MockAuthService extends Mock implements AuthService {}

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUserCredential extends Mock implements UserCredential {}

class MockUser extends Mock implements User {}

class MockIdTokenResult extends Mock implements IdTokenResult {}

class MockUserService extends Mock implements UserService {}
