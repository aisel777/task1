import 'package:task/core/service/model/repository_model.dart';

import '../../core/service/model/user_model.dart';

sealed class ProfileState {}

class InitialState extends ProfileState {}

class LoadingState extends ProfileState {}

class SuccesState extends ProfileState {
  final User? user;
  final List<Repository>? repositories;

  SuccesState({this.user, this.repositories});
}

class Failurestate extends ProfileState {
  final String errormessage;

  Failurestate({required this.errormessage});
}
