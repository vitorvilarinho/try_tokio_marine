import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:db_firestore/db_firestore.dart';

import '../../../domain/failures/user_not_founded_failure.dart';
import '../../../domain/models/profile.dart';
import '../../mappers/profile_response_mapper.dart';
import '../../models/profile_request.dart';
import '../../models/profile_response.dart';
import '../data_source_service.dart';

class FirebaseRemoteService implements DataSourceService {
  FirebaseRemoteService({
    Mapper<ProfileResponse, Profile> profileResponseMapper =
        const ProfileResponseMapper(),
  }) : _profileResponseMapper = profileResponseMapper;

  final _firebaseService = DbFirestoreService.instance;
  final Mapper<ProfileResponse, Profile> _profileResponseMapper;

  @override
  Future<Either<Failure, void>> insertProfile({
    required ProfileRequest profile,
  }) async {
    final result = await _firebaseService.saveData(
      documentId: profile.cpf,
      path: 'users/',
      data: profile.toJson(),
    );

    return result.fold(
      (failure) => Left(failure),
      (_) => const Right(null),
    );
  }

  @override
  Future<Either<Failure, Profile>> fetchProfileByCpf({
    required String cpf,
  }) async {
    final data = await _firebaseService.fetchData(documentPath: 'users/$cpf');

    return data.fold(
      (failure) => Left(failure),
      (data) {
        if (data == null) {
          return const Left(UserNotFoundedFailure());
        }
        final profile = ProfileResponse.fromJson(data);
        return Right(_profileResponseMapper.cast(profile));
      },
    );
  }

  @override
  Future<Either<Failure, Profile>> fetchProfileByUid(
      {required String uid}) async {
    final data = await _firebaseService.searchDocData(
      collectionPath: 'users',
      field: 'uid',
      isEqualTo: uid,
    );

    return data.fold(
      (failure) => Left(failure),
      (data) {
        if (data == null) {
          return const Left(UserNotFoundedFailure());
        }
        final profile = ProfileResponse.fromJson(data);
        return Right(_profileResponseMapper.cast(profile));
      },
    );
  }
}
