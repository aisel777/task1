import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/service/api_service.dart';
import 'package:task/provider/app_bloc/app_event.dart';
import 'package:task/provider/app_bloc/app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  late final ApiService _apiService;

  AppBloc()
      : _apiService = ApiService(),
        super(Initial()) {
    on<GetUserEvent>(fetchUser);
  }

  fetchUser(GetUserEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      final datas = await _apiService.fetchUser();
      final users = datas;
      emit(Success(users: users));
    } on DioException catch (exp) {
      log(exp.message!);
      emit(Failure());
    }
  }
}
