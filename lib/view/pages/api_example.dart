import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/provider/profile_bloc/profile_event.dart';

import '../../provider/profile_bloc/profile_bloc.dart';
import '../../provider/profile_bloc/profile_state.dart';

class ApiExample extends StatefulWidget {
  const ApiExample({super.key});

  @override
  State<ApiExample> createState() => _ApiExampleState();
}

class _ApiExampleState extends State<ApiExample> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 80) + const EdgeInsets.all(10),
      child: Column(
        children: [
          BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
            if (state is LoadingState) {
              return const CircularProgressIndicator();
            } else if (state is SuccesState) {
              final user = state.user;
              return Container(
                height: 100,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    color: Colors.pink.withOpacity(0.4),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(user!.avatar),
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              const Text('Following'),
                              Text(user.following.toString())
                            ],
                          ),
                          const Spacer(),
                          Column(children: [
                            const Text('Followers'),
                            Text(user.followers.toString())
                          ]),
                        ],
                      ),
                      Text(user.userName),
                      Text(user.name),
                    ],
                  ),
                ),
              );
            }
            return const Text('Something went wrong');
          }),
          const SizedBox(
            height: 12,
          ),
          const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'My Repositories',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              )),
          BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
            if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SuccesState) {
              final repositories = state.repositories;

              return ListView.builder(
                shrinkWrap: true,
                itemCount: repositories?.length ?? 0,
                itemBuilder: (context, index) {
                  final repository = repositories?[index];
                  return ListTile(
                    title: Text('${index + 1}. ${repository?.name}'),
                    subtitle: Text(repository?.description ?? 'null'),
                    trailing: Text(repository!.starsCount.toString()),
                  );
                },
              );
            }
            return const SizedBox.shrink();
          }),
          const SizedBox(
            height: 40,
          ),
          TextFormField(
            controller: controller,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.trim().isEmpty) return;
              context.read<ProfileBloc>().add(GetUsersInformationEvent(
                    username: controller.text.trim(),
                  ));
            },
            child: const Text('Search'),
          )
        ],
      ),
    ));
  }
}
