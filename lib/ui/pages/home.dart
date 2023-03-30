import 'package:caflutterdemo/domain/user_entity.dart';
import 'package:caflutterdemo/ui/pages/add_user.dart';
import 'package:caflutterdemo/ui/pages/user_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UserEntity> users = [
    UserEntity(
        id: '1',
        name: 'John',
        email: 'test@test.com',
        phone: '1234567890',
        website: 'test.com'),
    UserEntity(
        id: '2',
        name: 'John2',
        email: 'test2@test.com',
        phone: '1234567890',
        website: 'test2.com'),
  ];

  final textController = TextEditingController();
  int? userIndex;
  IconData buttonIcon = Icons.add;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              'User List',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            Expanded(
                child: TextField(
              controller: textController,
            )),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CreateUser()));
                  // var user = UserEntity(
                  //     id: (users.length + 1).toString(),
                  //     name: textController.text,
                  //     email: 'test3@test.com',
                  //     phone: '1234567890',
                  //     website: 'test3.com');

                  // setState(() {
                  //   if (userIndex != null) {
                  //     users[userIndex!].name = textController.text;
                  //     userIndex = null;
                  //     buttonIcon = Icons.add;
                  //   } else {
                  //     users.add(user);
                  //   }
                  //   // users.add(user);
                  //   textController.clear();
                  // });
                  // print(user);
                },
                child: Icon(buttonIcon))
          ],
        ),
      ),

      body: UserList(),
      // body: ListView.builder(
      //   itemCount: users.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return UserCard(user: users[index]);

      //     //   return Card(
      //     //     child: ListTile(
      //     //       title: Text(users[index].name),
      //     //       subtitle: Text(users[index].email),
      //     //       trailing: ElevatedButton(
      //     //           onPressed: () {
      //     //             Navigator.push(
      //     //                 context,
      //     //                 MaterialPageRoute(
      //     //                     builder: (context) =>
      //     //                         UserCard(user: users[index])));
      //     //           },
      //     //           child: const Text('View')),
      //     //       onTap: () => setState(() {
      //     //         userIndex = index;
      //     //         textController.text = users[index].name;
      //     //         buttonIcon = Icons.save;
      //     //       }),
      //     //       onLongPress: () => setState(() {
      //     //         users.removeAt(index);
      //     //       }),
      //     //     ),
      //     //   );
      //   },
      // ),
      // body: const Center(
      //   child: Text('Hello World'),
      // ),
      bottomNavigationBar: NavigationBar(destinations: const [
        NavigationDestination(
          icon: Icon(Icons.explore),
          label: 'Explore',
        ),
        NavigationDestination(
          icon: Icon(Icons.bookmark),
          label: 'Saved',
        ),
        NavigationDestination(
          icon: Icon(Icons.notifications),
          label: 'Updates',
        ),
      ]),
    );
  }
}
