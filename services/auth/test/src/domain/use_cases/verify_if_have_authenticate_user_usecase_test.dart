import 'package:auth/src/domain/repositories/verify_if_have_authenticate_user_repository.dart';
import 'package:auth/src/domain/use_cases/verify_if_have_authenticate_user_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockVerifyIfHaveAuthenticateUserRepository extends Mock
    implements VerifyIfHaveAuthenticateUserRepository {}

void main() {
  late VerifyIfHaveAuthenticateUserUsecase usecase;
  late MockVerifyIfHaveAuthenticateUserRepository mockRepository;

  setUp(() {
    mockRepository = MockVerifyIfHaveAuthenticateUserRepository();
    usecase = VerifyIfHaveAuthenticateUserUsecase(
      verifyIfHaveAuthenticateUserRepository: mockRepository,
    );
  });

  test('should return true when repository returns true', () async {
    when(() => mockRepository()).thenAnswer((_) async => true);

    final result = await usecase();

    expect(result, isTrue);
    verify(() => mockRepository()).called(1);
  });

  test('should return false when repository returns false', () async {
    when(() => mockRepository()).thenAnswer((_) async => false);

    final result = await usecase();

    expect(result, isFalse);
    verify(() => mockRepository()).called(1);
  });

  test('should throw when repository throws', () async {
    when(() => mockRepository()).thenThrow(Exception('error'));

    expect(() => usecase(), throwsA(isA<Exception>()));
    verify(() => mockRepository()).called(1);
  });
}
