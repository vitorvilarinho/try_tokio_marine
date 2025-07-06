import 'package:core/core.dart';

import '../../domain/models/profile.dart';
import '../models/profile_request.dart';

class ProfileRequestMapper extends Mapper<Profile, ProfileRequest> {
  const ProfileRequestMapper();
  @override
  ProfileRequest cast(Profile model) => ProfileRequest(
        uid: model.uid,
        firstName: model.firstName,
        lastName: model.lastName,
        email: model.email,
        cpf: model.cpf,
        createdAt: DateTime.now(),
      );
}
