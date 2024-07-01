import 'package:task/core/service/model/user_model.dart';

sealed class AppState {}

class Initial extends AppState {}

class Success extends AppState {
  final List<User> users;

  Success({required this.users});
}

class Loading extends AppState {}

class Failure extends AppState {}
