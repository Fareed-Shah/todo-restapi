import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mock_api_todo/classes/users.dart';
import 'package:mock_api_todo/network/api.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  List<Users> uesrList = [];
  bool isLoading = false;

  getUsers() async {
    setState(() {
      isLoading = true;
    });

    try {
      final responce =
          await http.get(Uri.parse(BaseConfig.baseUrl + BaseConfig.getUsers));
      var data = jsonDecode(responce.body.toString());
      for (Map<String, dynamic> i in data) {
        // print(i['title']);
        uesrList.add(Users.fromJson(i));
      }
    } catch (e) {}
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "user profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: !isLoading
          ? ListView.builder(
              itemCount: uesrList.length,
              itemBuilder: (context, index) => ListTile(
                    title: Text(uesrList[index].name ?? "f"),
                    subtitle: Text(uesrList[index].email ?? ""),
                  ))
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
