import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({this.message, this.statusCode});

  final String? message;
  final int? statusCode;

  @override
  List<Object?> get props => [message, statusCode];
}

class ServerFailure extends Failure {
  const ServerFailure({super.message, super.statusCode});

  @override
  String toString() => 'ServerFailure: $message';
}

class CacheFailure extends Failure {
  const CacheFailure({super.message});

  @override
  String toString() => 'CacheFailure: $message';
}

class NetworkFailure extends Failure {
  const NetworkFailure({super.message = 'No internet connection'});

  @override
  String toString() => 'NetworkFailure: $message';
}

class AuthFailure extends Failure {
  const AuthFailure({super.message});

  @override
  String toString() => 'AuthFailure: $message';
}

class LocationFailure extends Failure {
  const LocationFailure({super.message});

  @override
  String toString() => 'LocationFailure: $message';
}

class ValidationFailure extends Failure {
  const ValidationFailure({super.message});

  @override
  String toString() => 'ValidationFailure: $message';
}

class PermissionFailure extends Failure {
  const PermissionFailure({super.message = 'Permission denied'});

  @override
  String toString() => 'PermissionFailure: $message';
}

class NotFoundFailure extends Failure {
  const NotFoundFailure({super.message = 'Resource not found'});

  @override
  String toString() => 'NotFoundFailure: $message';
}

class MatchingFailure extends Failure {
  const MatchingFailure({super.message});

  @override
  String toString() => 'MatchingFailure: $message';
}
