import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable implements Exception {
  @override
  List<Object?> get props => [];
}

class RemoteDatabaseFailure extends Failure {}

class LocalDatabaseFailure extends Failure {}
