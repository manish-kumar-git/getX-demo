import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/homeController.dart';

class ApiCallGetX extends StatefulWidget {
  const ApiCallGetX({Key? key}) : super(key: key);

  @override
  State<ApiCallGetX> createState() => _ApiCallGetX();
}

HomePageController controller = Get.put(HomePageController());

class _ApiCallGetX extends State<ApiCallGetX> {
  @override
  Widget build(BuildContext context) {
    controller.getApi();
    return Scaffold(
        appBar: AppBar(title: const Text('Api with GetX')),
        body:
            // SingleChildScrollView(
            //   child: Center(
            //     child: Column(
            //       children: [
            //         const SizedBox(height: 20,),
            //         ElevatedButton(
            //             onPressed: () {
            //               controller.getApi();
            //             },
            //             child: Text('Get Info!!')),
            //         const SizedBox(height: 50,),

            Obx(() => controller.isDataLoading.value
                ? const Center(child: CircularProgressIndicator())
                : _builScreen()));

    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

  Widget _builScreen() {
    return ListView.builder(
        itemCount: controller.user_model!.data!.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  padding: const EdgeInsets.only(left: 20),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage(
                            controller.user_model!.data![index].picture!),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            controller.user_model!.data![index].title!
                                .toUpperCase(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                          ),
                          Text(controller.user_model!.data![index].firstName!,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18)),
                          Text(controller.user_model!.data![index].lastName!,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18)),
                        ],
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              )
            ],
          );
        });
  }
}
