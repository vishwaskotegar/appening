import 'package:appening/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../all_user/show_users_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formkey = GlobalKey<FormState>();
  late TextEditingController fullNameController;
  late TextEditingController jobNameController;

  @override
  void initState() {
    fullNameController = TextEditingController();
    jobNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    jobNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder inputBorder = OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(15));
    OutlineInputBorder errorBorder = OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(15));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Full name"),
              TextFormField(
                validator: (value) =>
                    value!.isEmpty == true ? "Enter the Name" : null,
                // maxLines: 1,
                controller: fullNameController,
                decoration: InputDecoration(
                    focusedBorder: inputBorder,
                    enabledBorder: inputBorder,
                    errorBorder: errorBorder,
                    focusedErrorBorder: errorBorder),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Job name"),
              TextFormField(
                validator: (value) =>
                    value!.isEmpty == true ? "Enter the Job" : null,
                controller: jobNameController,
                decoration: InputDecoration(
                    focusedBorder: inputBorder,
                    enabledBorder: inputBorder,
                    errorBorder: errorBorder,
                    focusedErrorBorder: errorBorder),
              ),
              const Spacer(),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.blue,
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    Get.find<UserController>().createUser(
                        fullNameController.text, jobNameController.text);
                    Get.to(() => const ShowUserScreen());
                  }
                },
                child: SizedBox(
                    width: double.maxFinite,
                    height: 50,
                    child: Center(
                        child: Text(
                      "Submit",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: Colors.white),
                    ))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
