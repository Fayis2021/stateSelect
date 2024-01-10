import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interviewat2/view/home_screen.dart';

import '../controllers/call_api_state.dart';
import '../controllers/data_asking_page_c.dart';

class MyForm extends StatefulWidget {
  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final MyController _controller = Get.put(MyController());

  TextEditingController namecontrooler = TextEditingController();

  var _key = GlobalKey<FormState>();

  Api controllerapi = Get.put(Api());

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    namecontrooler.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: namecontrooler,
                  decoration: const InputDecoration(
                    labelText: 'Enter your name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please fill the field";
                    }
                  },
                ),
                const SizedBox(height: 20),
                Obx(() => DropdownButtonFormField<String>(
                      value: _controller.selectedGender.value,
                      onChanged: (value) {
                        _controller.selectedGender.value = value!;
                      },
                      items: ['Male', 'Female', 'Other'].map((gender) {
                        return DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        );
                      }).toList(),
                      decoration: const InputDecoration(
                        labelText: 'Select your gender',
                      ),
                    )),
                ElevatedButton(
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        controllerapi.fetchMyStates();
                        _controller.name.value = namecontrooler.text;
                        Get.to(() => Home());
                      }
                    },
                    child: const Text("submit")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
