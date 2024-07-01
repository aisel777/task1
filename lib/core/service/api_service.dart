import 'package:dio/dio.dart';
import 'package:task/core/service/model/repository_model.dart';
import 'package:task/core/service/model/user_model.dart';

class ApiService {
  ApiService() {
    dio = Dio(BaseOptions(baseUrl: 'https://api.github.com'));
  }

  late Dio? dio;

  Future<User> getUsersInformation(String userName) async {
    final response = await dio?.get('/users/$userName');
    final userJson = response!.data;

    return User.fromJson(userJson);
  }

  Future<List<Repository>> getUsersRepositories(String userName) async {
    final response = await dio?.get('/users/$userName/repos');
    final repositoryJsons = response!.data as List;
    final repositories =
        repositoryJsons.map((repoJson) => Repository.fromJson(repoJson));
    return repositories.toList();
  }

  fetchUser() {}
}
