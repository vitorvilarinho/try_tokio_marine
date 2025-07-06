import 'package:auth/src/data/data_sources/data_source_service.dart';
import 'package:auth/src/data/repositories/verify_if_have_authenticated_user_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDataSourceService extends Mock implements DataSourceService {}

void main() {
  late DataSourceService mockDataSourceService;
  late VerifyIfHaveAuthenticatedUserRepositoryImpl repository;

  setUp(() {
    mockDataSourceService = MockDataSourceService();
    repository = VerifyIfHaveAuthenticatedUserRepositoryImpl(
      dataSourceService: mockDataSourceService,
    );
  });

  test('should return true when dataSourceService.hasUser returns true',
      () async {
    when(() => mockDataSourceService.hasUser()).thenAnswer((_) async => true);

    final result = await repository();

    expect(result, isTrue);
    verify(() => mockDataSourceService.hasUser()).called(1);
  });

  test('should return false when dataSourceService.hasUser returns false',
      () async {
    when(() => mockDataSourceService.hasUser()).thenAnswer((_) async => false);

    final result = await repository();

    expect(result, isFalse);
    verify(() => mockDataSourceService.hasUser()).called(1);
  });

  test('should throw when dataSourceService.hasUser throws', () async {
    when(() => mockDataSourceService.hasUser()).thenThrow(Exception('error'));

    expect(() => repository(), throwsException);
    verify(() => mockDataSourceService.hasUser()).called(1);
  });
}
