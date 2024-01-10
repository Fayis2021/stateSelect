import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interviewat2/model/state_data_model.dart';
import '../controllers/data_asking_page_c.dart';

class ShowUserDetails extends StatelessWidget {
  ShowUserDetails(
      {super.key, required this.city, required this.stateWithCities});

  City city;
  StateWithCities stateWithCities;
  MyController mycont = Get.put(MyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
              "Mr/Ms ${mycont.name}, you are from ${city.cityName} in ${stateWithCities.stateName}, India."),
        ),
      ),
    );
  }
}
