sealed class ProfileEvent {}

class GetUsersInformationEvent extends ProfileEvent {
  final String username;

  GetUsersInformationEvent({required this.username});
}

class GetUsersRepositoriesEvent extends ProfileEvent {
  final String username;

  GetUsersRepositoriesEvent({required this.username});
}
