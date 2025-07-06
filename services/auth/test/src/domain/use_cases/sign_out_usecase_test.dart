import 'package:auth/src/domain/repositories/sign_out_repository.dart';
import 'package:auth/src/domain/use_cases/sign_out_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  late SignOutUsecase usecase;
  late SignOutRepository mockRepository;

  setUp(() {
    mockRepository = MockSignOutRepository();
    usecase = SignOutUsecase(signOutRepository: mockRepository);
  });

  test('should call SignOutRepository when usecase is called', () async {
    when(() => mockRepository()).thenAnswer((_) async {});

    await usecase.call();

    verify(() => mockRepository()).called(1);
  });

  test('should propagate errors from repository', () async {
    when(() => mockRepository()).thenThrow(Exception('Sign out failed'));

    expect(() => usecase.call(), throwsA(isA<Exception>()));
  });
}
