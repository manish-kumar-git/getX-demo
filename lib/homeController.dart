import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'user_model.dart';

class HomePageController extends GetxController {
  User_Model? user_model;
  var isDataLoading = false.obs;

  final count = 0.obs;
  increase() => count.value++;

  getApi() async {
    try {
      isDataLoading(true);
      http.Response response = await http.get(
          Uri.tryParse('http://dummyapi.io/data/v1/user')!,
          headers: {'app-id': '6218809df11d1d412af5bac4'});
      if (response.statusCode == 200) {
        ///data successfully

        var result = jsonDecode(response.body);
        print('Anything from API call === === ===>${result.toString()}');
        user_model = User_Model.fromJson(result);
        print('User model   ---->>> ' + (user_model!.data!.first.firstName).toString());
      } else {
        ///error
      }
    } catch (e) {
      //log('Error while getting data is $e');
      print('Error while getting data is $e');
    } finally {
      isDataLoading(false);
    }
  }
}
