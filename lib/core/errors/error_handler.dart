import 'package:cloud_firestore/cloud_firestore.dart';
import '../errors/exceptions.dart';
import '../errors/failures.dart';
import 'package:fpdart/fpdart.dart';

Either<Failure, T> handleFirestoreException<T>(Object e) {
  if (e is FirebaseException) {
    switch (e.code) {
      case 'not-found':
        return left(NotFoundFailure(message: e.message));
      case 'permission-denied':
        return left(PermissionFailure(message: e.message));
      case 'unavailable':
        return left(ServerFailure(message: 'Service unavailable', statusCode: 503));
      case 'deadline-exceeded':
        return left(ServerFailure(message: 'Request timed out', statusCode: 504));
      default:
        return left(ServerFailure(message: e.message, statusCode: int.tryParse(e.code ?? '')));
    }
  }
  return left(ServerFailure(message: e.toString()));
}

T handleFirestoreExceptionThrow<T>(Object e) {
  if (e is FirebaseException) {
    switch (e.code) {
      case 'not-found':
        throw ServerException(message: e.message ?? 'Not found', code: e.code);
      case 'permission-denied':
        throw ServerException(message: e.message ?? 'Permission denied', code: e.code);
      default:
        throw ServerException(message: e.message ?? 'Unknown error', code: e.code);
    }
  }
  throw ServerException(message: e.toString());
}
