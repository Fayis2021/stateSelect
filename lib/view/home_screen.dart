import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/call_api_state.dart';
import '../model/state_data_model.dart';
import 'city_select_page.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchcontroller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    searchcontroller.dispose();
  }

  Api controller2 = Get.put(Api());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<Api>(
          builder: (controller) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: searchcontroller,
                  decoration: const InputDecoration(hintText: "Search"),
                  onChanged: (value) {
                    controller2.filterState(searchcontroller.text);
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: controller.myState.length,
                    itemBuilder: (context, index) {
                      StateWithCities city = controller.myState[index];

                      if (controller.myState.isEmpty &&
                          controller.apicallCondition.value == false) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (controller.myState.isEmpty &&
                          controller.apicallCondition.value == true) {
                        return const Center(child: Text('No data available.'));
                      }
                      return GestureDetector(
                        onTap: () async {
                          await controller.fetchMyCities(city.stateId);
                          Get.to(() => City_select_Page(
                                stateWithCities: city,
                              ));
                        },
                        child: Card(
                          margin: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text(
                              city.stateName,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 29, 28, 29)),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  city.stateId,
                                ),
                                const SizedBox(height: 8.0),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// ever(searchController.searchcontroller,
//         (dynamic value) => controller2.filterState(value));