import 'dart:convert';

import 'package:get/get.dart';

import '../model/state_data_model.dart';
import 'package:http/http.dart' as http;

class Api extends GetxController {
  // @override
  // void dispose() {
  //   super.dispose();
  //   searchcontroller.dispose();
  // }

  // TextEditingController searchcontroller = TextEditingController();
  //api state releated
  RxList<StateWithCities> myState = <StateWithCities>[].obs;
  RxBool apicallCondition = false.obs;

// api city releated
  RxList<City> mycities = <City>[].obs;

  Future<void> fetchMyStates() async {
    try {
      String link = "https://api.minebrat.com/api/v1/states";

      final response = await http.get(Uri.parse(link));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        List StateData = jsonResponse;

        myState.value = StateData.map(
                (doc) => StateWithCities.fromJson(doc as Map<String, dynamic>))
            .toList();

        apicallCondition.value = true;
      }
      update();
    } catch (e) {
      Get.snackbar("Error", "$e");
    }
  }

//filter

  void filterState(String filterStateName) async {
    print(filterStateName);
    if (filterStateName.isEmpty) {
      await fetchMyStates();
    } else {
      myState.value = myState
          .where((state) => state.stateName
              .toLowerCase()
              .contains(filterStateName.toLowerCase()))
          .toList();
    }
    update();
  }

  Future<void> fetchMyCities(String id) async {
    try {
      String link = "http://api.minebrat.com/api/v1/states/cities/$id";

      final response = await http.get(Uri.parse(link));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        List cityData = jsonResponse;
        mycities.value = cityData
            .map((doc) => City.fromJson(doc as Map<String, dynamic>))
            .toList();
      }
      update();
    } catch (e) {
      Get.snackbar("Error", "$e");
    }
  }
}
