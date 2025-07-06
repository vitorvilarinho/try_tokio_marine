import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import 'db_firestore_service.dart';
import 'domain/failures/save_database_failure.dart';

class DbFirestoreServiceImpl implements DbFirestoreService {
  const DbFirestoreServiceImpl({
    required FirebaseFirestore db,
  }) : _db = db;

  final FirebaseFirestore _db;

  @override
  Future<Either<Failure, Map<String, dynamic>?>> saveData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    try {
      if (documentId?.isNotEmpty ?? false) {
        await _db.collection(path).doc(documentId).set(data);
        final temp = await _db.collection(path).doc(documentId).get();
        final temp2 = temp.data();
        if (temp2 == null) {
          return const Left(SaveDatabaseFailure());
        }
        final result = temp2..addAll({'id': temp.id});
        return Right(result);
      }
      final documentReference = await _db.collection(path).add(data);

      final map = await documentReference.get();
      final result = map.data()?..addAll({'id': map.id});

      return Right(result);
    } on Exception catch (exception, stack) {
      return Left(SaveDatabaseFailure(
        exception: exception,
        stack: stack,
      ));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>?>> fetchData({
    required String documentPath,
  }) async {
    final doc = await _db.doc(documentPath).get();
    final data = doc.data();
    return Right(data ?? {});
  }

  @override
  Future<Either<Failure, Map<String, dynamic>?>> searchDocData({
    required String collectionPath,
    required String field,
    Object? isEqualTo,
  }) async {
    final query = await _db
        .collection(collectionPath)
        .where(field, isEqualTo: isEqualTo)
        .get();

    final data = query.docs.firstOrNull?.data();

    return Right(data ?? {});
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> fetchCollection({
    required String collectionPath,
  }) async {
    final collection = await _db.collection(collectionPath).get();
    final datas = collection.docs
        .map((doc) => doc.data()..addAll({'id': doc.id}))
        .toList();

    return Right(datas);
  }
}
