import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../../domain/models/profile.dart';
import '../../domain/repositories/insert_profile_repository.dart';
import '../data_sources/data_source_service.dart';
import '../mappers/profile_request_mapper.dart';
import '../models/profile_request.dart';

class InsertProfileRepositoryImpl implements InsertProfileRepository {
  const InsertProfileRepositoryImpl({
    required DataSourceService dataSourceService,
    Mapper<Profile, ProfileRequest> mapper = const ProfileRequestMapper(),
  })  : _dataSourceService = dataSourceService,
        _mapper = mapper;

  final DataSourceService _dataSourceService;
  final Mapper<Profile, ProfileRequest> _mapper;
  @override
  Future<Either<Failure, Profile>> call({
    required Profile profile,
  }) async {
    final result = await _dataSourceService.insertProfile(
      profile: _mapper.cast(profile),
    );
    return result.fold(
      (failure) => Left(failure),
      (_) => Right(profile),
    );
  }
}
