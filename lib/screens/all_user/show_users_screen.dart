import 'dart:developer';

import 'package:appening/models/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/user_controller.dart';

class ShowUserScreen extends StatelessWidget {
  const ShowUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios_new)),
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: FutureBuilder<UserDataModel>(
          future: Get.find<UserController>().showAllUsers(),
          builder: (context, snapshot) {
            return snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : snapshot.data!.data.isEmpty
                    ? const Center(child: Text("There are no profiles to show"))
                    : ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.data.length,
                        itemBuilder: (context, index) {
                          // print(snapshot.data);
                          // return Container();
                          return ListTile(
                            onTap: () => log(
                                "tapped on id: ${snapshot.data!.data[index].id}"),
                            leading: CircleAvatar(
                              backgroundColor: Colors.grey,
                              backgroundImage: NetworkImage(
                                  snapshot.data!.data[index].avatar),
                            ),
                            title: Text(snapshot.data!.data[index].first_name),
                            subtitle: Text(snapshot.data!.data[index].email),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(
                            thickness: 2,
                          );
                        },
                      );
          },
        ),
      ),
    );
  }
}
