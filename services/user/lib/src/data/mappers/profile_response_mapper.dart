import 'package:core/core.dart';

import '../../domain/models/profile.dart';
import '../models/profile_response.dart';

class ProfileResponseMapper extends Mapper<ProfileResponse, Profile> {
  const ProfileResponseMapper();

  @override
  Profile cast(ProfileResponse model) => Profile(
        uid: model.uid,
        firstName: model.firstName,
        lastName: model.lastName,
        email: model.email,
        cpf: model.cpf,
      );
}
