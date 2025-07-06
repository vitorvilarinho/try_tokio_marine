import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import 'db_firestore_service_impl.dart';

abstract class DbFirestoreService {
  static DbFirestoreService? _instance;

  static DbFirestoreService get instance =>
      _instance ??= DbFirestoreServiceImpl(
        db: FirebaseFirestore.instance,
      );

  Future<Either<Failure, Map<String, dynamic>?>> saveData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });

  Future<Either<Failure, Map<String, dynamic>?>> fetchData({
    required String documentPath,
  });

  Future<Either<Failure, List<Map<String, dynamic>>>> fetchCollection({
    required String collectionPath,
  });

  Future<Either<Failure, Map<String, dynamic>?>> searchDocData({
    required String collectionPath,
    required String field,
    Object? isEqualTo,
  });
}
