import 'package:auth/src/data/data_sources/data_source_service.dart';
import 'package:auth/src/data/repositories/sign_out_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  late DataSourceService mockDataSourceService;
  late SignOutRepositoryImpl repository;

  setUp(() {
    mockDataSourceService = MockDataSourceService();
    repository =
        SignOutRepositoryImpl(dataSourceService: mockDataSourceService);
  });

  group('SignOutRepositoryImpl', () {
    test('should call signOut on DataSourceService', () async {
      // Arrange
      when(mockDataSourceService.signOut).thenAnswer((_) async {});

      // Act
      await repository.call();

      // Assert
      verify(mockDataSourceService.signOut).called(1);
    });

    test('should throw if DataSourceService.signOut throws', () async {
      // Arrange
      when(mockDataSourceService.signOut)
          .thenThrow(Exception('Sign out failed'));

      // Act & Assert
      expect(() => repository.call(), throwsException);
    });
  });
}
