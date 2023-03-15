import 'dart:convert';

import 'package:caflutterdemo/domain/user_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:json_to_form/json_schema.dart';
import 'package:json_to_form/json_to_form.dart';
import 'package:simple_form_builder/formbuilder.dart';
import 'package:simple_form_builder/global/checklistModel.dart';

import '../cubit/user_cubit.dart';
import 'constant.dart';

class CreateUser extends StatefulWidget {
  final UserEntity? user;
  final bool edit;

  CreateUser({this.user, this.edit = false, Key? key}) : super(key: key);

  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  UserCubit userCubit = GetIt.instance<UserCubit>();
  String userTitle = "Create User";
  dynamic form = {
    'fields': [
      {
        'key': 'id',
        'type': 'Input',
        'label': 'ID',
        'value': '',
      },
      {
        'key': 'name',
        'type': 'Input',
        'label': 'Name',
        'placeholder': "Enter Your Name",
        'required': true,
        'value': '',
      },
      {
        'key': 'email',
        'type': 'Input',
        'label': 'Email',
        'required': true,
        'value': '',
      },
      {
        'key': 'phone',
        'type': 'Input',
        'label': 'Phone',
        'value': '',
      },
      {
        'key': 'website',
        'type': 'Input',
        'label': 'Website',
        'value': '',
      },
    ]
  };

  dynamic response;

  // Map decorations = {
  //   'input1': const InputDecoration(
  //     prefixIcon: Icon(Icons.account_box),
  //     border: OutlineInputBorder(),
  //   ),
  //   'password1': const InputDecoration(
  //       prefixIcon: Icon(Icons.security), border: OutlineInputBorder()),
  // };

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print(json.encode(widget.user));
    userTitle = widget.edit ? "Edit User" : "Create User";

    (form["fields"] as List<dynamic>).forEach((item) => setDefaultValue(item));

    return Scaffold(
      appBar: AppBar(
        title: Text(userTitle),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: <Widget>[
            Text(
              userTitle,
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            JsonSchema(
              // decorations: decorations,
              form: json.encode(form),
              onChanged: (dynamic response) {
                this.response = response;
              },
              actionSave: (data) {
                print(data);
                if (widget.edit) {
                  // update user
                  userCubit.updateUser(user: UserEntity.fromForm(data));
                } else {
                  // create user
                  userCubit.createUser(user: UserEntity.fromForm(data));
                }
                Navigator.pop(context);
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              buttonSave: Container(
                height: 40.0,
                color: Colors.blueAccent,
                child: const Center(
                  child: Text("Save",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ]),
        ),
      ),
    );

    // return MaterialApp(
    //   title: 'FormBuilder Example',
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Create User'),
    //     ),
    //     body: SingleChildScrollView(
    //       child: Column(
    //         children: [
    //           FormBuilder(
    //             initialData: sampleData,
    //             index: 0,
    //             showIndex: false,
    //             // showPrefix
    //             //radioIcon
    //             //checklistIcon
    //             submitButtonText: 'Send',
    //             onSubmit: (ChecklistModel val) {
    //               if (val == null) {
    //                 print("no data");
    //               } else {
    //                 var json = jsonEncode(val.toJson());
    //                 print(json);
    //               }
    //             },
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

  Set<Set<String>> setDefaultValue(item) {
    return {
      if (item["key"] == "id") {item["value"] = widget.user?.id ?? ""},
      if (item["key"] == "name") {item["value"] = widget.user?.name ?? ""},
      if (item["key"] == "email") {item["value"] = widget.user?.email ?? ""},
      if (item["key"] == "phone") {item["value"] = widget.user?.phone ?? ""},
      if (item["key"] == "website")
        {item["value"] = widget.user?.website ?? ""},
    };
  }
}
