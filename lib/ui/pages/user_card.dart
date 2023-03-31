import "package:caflutterdemo/ui/cubit/user_cubit.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "../../domain/user_entity.dart";
import "../cubit/user_state.dart";
import "add_user.dart";

class UserCard extends StatefulWidget {
  final UserEntity user;

  UserCard({super.key, required this.user});

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  late UserCubit userCubit;

  @override
  void initState() {
    userCubit = context.read<UserCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserLoadFailureState) {
          print(state);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Error"),
            ),
          );
        }
      },
      builder: (context, state) {
        print(state);
        if (state is UserLoadingState) {
          print("UserLoadingState==");
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.user.id,
                  style: Theme.of(context).textTheme.caption,
                ),
                Text(
                  widget.user.name,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  widget.user.email,
                  style: Theme.of(context).textTheme.caption,
                ),
                Text(
                  widget.user.phone,
                  style: Theme.of(context).textTheme.caption,
                ),
                Text(
                  widget.user.website,
                  style: Theme.of(context).textTheme.caption,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      child: Text('DELETE'),
                      onPressed: () async {
                        // TODO: buat fitur delete profile
                        print(widget.user.id);
                        userCubit.deleteUser(id: widget.user.id);
                      },
                    ),
                    ElevatedButton(
                      child: Text('EDIT'),
                      onPressed: () {
                        // TODO: buat fitur edit profile
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateUser(
                                      user: widget.user,
                                      edit: true,
                                    )));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
