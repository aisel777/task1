import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/service/api_service.dart';
import 'package:task/provider/profile_bloc/profile_event.dart';
import 'package:task/provider/profile_bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc()
      : apiService = ApiService(),
        super(InitialState()) {
    on<GetUsersInformationEvent>(getUsersInformationEvent);
  }
  getUsersInformationEvent(
      GetUsersInformationEvent event, Emitter<ProfileState> emit) async {
    emit(LoadingState());
    try {
      final user = await apiService.getUsersInformation(event.username);
      final repositories =
          await apiService.getUsersRepositories(event.username);

      emit(SuccesState(user: user, repositories: repositories));
    } catch (errormessage) {
      emit(Failurestate(errormessage: errormessage.toString()));
    }
  }

  late ApiService apiService;
}
