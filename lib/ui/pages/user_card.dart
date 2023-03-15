import "package:caflutterdemo/ui/cubit/user_cubit.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

import "../../domain/user_entity.dart";
import "add_user.dart";

class UserCard extends StatelessWidget {
  final UserCubit userCubit;
  final UserEntity user;

  const UserCard({required this.user, required this.userCubit});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.id,
              style: Theme.of(context).textTheme.caption,
            ),
            Text(
              user.name,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              user.email,
              style: Theme.of(context).textTheme.caption,
            ),
            Text(
              user.phone,
              style: Theme.of(context).textTheme.caption,
            ),
            Text(
              user.website,
              style: Theme.of(context).textTheme.caption,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  child: Text('DELETE'),
                  onPressed: () {
                    // TODO: buat fitur delete profile
                    print(user.id);
                    userCubit.deleteUser(id: user.id);
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
                                  user: user,
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
    // return Card(
    //   child:
    //       // ListTile(
    //       //   title: Text(user.name),
    //       //   subtitle: Text(user.email),
    //       //   trailing: Text(user.phone),
    //       // ),
    //       Column(
    //     children: [
    //       Text(user.name),
    //       Text(user.email),
    //       Text(user.phone),
    //       Text(user.website),
    //       ElevatedButton(
    //           onPressed: () {
    //             Navigator.push(
    //                 context,
    //                 MaterialPageRoute(
    //                     builder: (context) => CreateUser(
    //                           user: user,
    //                           edit: true,
    //                         )));
    //           },
    //           child: const Text('Edit')),
    //       ElevatedButton(
    //           onPressed: () {
    //             print(user.id);
    //             userCubit.deleteUser(id: user.id);
    //           },
    //           child: const Text('Delete'))
    //     ],
    //   ),
    // );
  }
}
