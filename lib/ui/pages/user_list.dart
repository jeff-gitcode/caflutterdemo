import 'package:caflutterdemo/ui/cubit/auth_state.dart';
import 'package:caflutterdemo/ui/cubit/user_cubit.dart';
import 'package:caflutterdemo/ui/pages/user_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../cubit/user_state.dart';

class UserList extends StatefulWidget {
  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  late UserCubit userCubit;

  @override
  void initState() {
    userCubit = context.read<UserCubit>();
    userCubit.loadUsers();
    // userCubit = GetIt.instance<UserCubit>();
    // userCubit.loadUsers();
    print('initState');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      // return BlocProvider<UserCubit>(
      // create: (context) => userCubit,
      // child: BlocListener<UserCubit, UserState>(
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
      // child: BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        print(state);
        if (state is UserLoadingState) {
          print("UserLoadingState==");
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: state.users.length,
          itemBuilder: (context, index) {
            return UserCard(
              user: state.users[index],
            );
          },
        );
      },
      // ),
      // ),
    );
  }
}
