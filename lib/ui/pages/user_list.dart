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
    super.initState();
    userCubit = GetIt.instance<UserCubit>();
    userCubit.loadUsers();
    print('initState');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
        create: (context) => userCubit,
        child: BlocListener<UserCubit, UserState>(
          listener: (context, state) {
            if (state is UserLoadFailureState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Error"),
                ),
              );
            }
          },
          child: BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              print(state);
              if (state is UserLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is UserLoadSuccessState ||
                  state is UserSubmitSuccessState) {
                return ListView.builder(
                  itemCount: state.users.length,
                  itemBuilder: (context, index) {
                    return UserCard(
                      user: state.users[index],
                      userCubit: userCubit,
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text('No data'),
                );
              }
            },
          ),
        )
        // builder: (context, state) {
        //   if (state is UserLoadingState) {
        //     return const Center(
        //       child: CircularProgressIndicator(),
        //     );
        //   } else if (state is UserLoadSuccessState) {
        //     return ListView.builder(
        //       itemCount: state.users.length,
        //       itemBuilder: (context, index) {
        //         return UserCard(user: state.users[index]);
        //       },
        //     );
        //   } else {
        //     return const Center(
        //       child: Text('No data'),
        //     );
        //   }
        // },
        );
    // return BlocBuilder<UserCubit, UserState>(
    //   builder: (context, state) {
    //     if (state is UserLoadingState) {
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     } else if (state is UserLoadSuccessState) {
    //       return ListView.builder(
    //         itemCount: state.users.length,
    //         itemBuilder: (context, index) {
    //           return UserCard(user: state.users[index]);
    //         },
    //       );
    //     } else {
    //       return const Center(
    //         child: Text('No data'),
    //       );
    //     }
    //   },
    // );
  }
}

// class UserList extends StatefulWidget {
//   @override
//   _UserListState createState() => _UserListState();
// }

// class _UserListState extends State<UserList> {
//   UserBloc _userBloc;

//   @override
//   void initState() {
//     super.initState();
//     _userBloc = UserBloc(userUseCase: null);
//     _userBloc.add(LoadUsersEvent());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
