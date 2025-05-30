import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:stylish/controller/backend/userlist_controller.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  UserlistController userlistController = Get.put(UserlistController());
  @override
  void initState() {
    userlistController.getuser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User List')),
      body: Obx(() {
        if (userlistController.isLoading.value) {
          return const Center(child: CupertinoActivityIndicator(radius: 30));
        } else if (userlistController.userlist.isEmpty) {
          return const Center(child: Text('No Product Found'));
        } else {
          return ListView.builder(
            itemCount: userlistController.userlist.first.data!.length,
            itemBuilder: (context, index) {
              final user = userlistController.userlist.first.data![index];
              final suport = userlistController.userlist.first.support;
              return ListTile(
                leading: CircleAvatar(
                  child: Image.network(user.avatar.toString()),
                ),
                title: Text(user.firstName.toString()),
                subtitle: Text(suport!.text.toString()),
                trailing: Text(
                  user.lastName ?? '', // Safe null check
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                onTap: () {
                  userlistController.getuser();
                },
              );
            },
          );
        }
      }),
    );
  }
}
