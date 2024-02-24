import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mock_api_todo/classes/tasks.dart';
import 'package:http/http.dart' as http;
import 'package:mock_api_todo/network/api.dart';
import 'package:mock_api_todo/views/form_view.dart';
import 'package:mock_api_todo/views/user_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Todos> todoList = [];
  bool isLoading = false;

  getTodos() async {
    setState(() {
      isLoading = true;
    });

    try {
      final responce =
          await http.get(Uri.parse(BaseConfig.baseUrl + BaseConfig.getTask));
      var data = jsonDecode(responce.body.toString());
      for (Map<String, dynamic> i in data) {
        // print(i['title']);
        todoList.add(Todos.fromJson(i));
      }
    } catch (e) {}
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do'),
        centerTitle: true,
      ),
      body: !isLoading
          ? ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) => ListTile(
                    title: Text(todoList[index].title ?? "f"),
                    subtitle: Text(todoList[index].description ?? ""),
                  ))
          : const Center(child: CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FormView()));
        },
        child: const Icon(Icons.add),
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, right: 8.0, left: 8.0),
          child: ListView(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const UserView()));
                },
                child: const ListTile(
                  title: Text(
                    'User Screen',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
