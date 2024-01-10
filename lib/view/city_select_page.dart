import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/call_api_state.dart';
import '../model/state_data_model.dart';
import 'Show_detail.dart';

class City_select_Page extends StatelessWidget {
  City_select_Page({super.key, required this.stateWithCities});

  StateWithCities stateWithCities;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select City"),),
      body: GetBuilder<Api>(
        builder: (controller) => ListView.builder(
            itemCount: controller.mycities.length,
            itemBuilder: (context, index) {
              City city = controller.mycities[index];

              if (controller.mycities.isEmpty &&
                  controller.apicallCondition.value == false) {
                return const Center(child: CircularProgressIndicator());
              } else if (controller.mycities.isEmpty &&
                  controller.apicallCondition.value == true) {
                return const Center(child: Text('No data available.'));
              }
              return GestureDetector(
                onTap: () {
                  Get.to(() => ShowUserDetails(
                        city: city,
                        stateWithCities: stateWithCities,
                      ));
                },
                child: Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      city.cityName,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 29, 28, 29)),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
