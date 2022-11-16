# getx

GetX State Management In Flutter
Learn How To Implement GetX State Management In Your Flutter Apps

GetX State Management In Flutter
Flutter is without a doubt the best framework for developing cross-platform applications. Application improvement with Flutter is genuinely magnificent and simple since it gives a rich arrangement of adaptable widgets. Notwithstanding, some state the management choices will not permit you to feel the genuine force of the Flutter framework since you need to burn through your development time implementing a superfluous boilerplate.

State management is an intricate topic of conversation in Flutter. Be that as it may, many state management libraries, like Provider, are accessible, which most developers suggest. At the point when we begin building any application in a flutter, we should conclude which state management we want to utilize. It would be simpler for you to pursue this choice with this blog.

Inthis article, we will explore the GetX State Management In Flutter. We will see how to implement a demo program. I would like to explain GetX, a powerful flutter framework, and learn how to use the get package in your flutter applications.

get | Flutter Package
GetX is an extra-light and powerful solution for Flutter. It combines high-performance state management, and intelligent…
pub.dev

Table Of Contents ::

What is GetX?

Principles

Three Pillars Of GetX

Why GetX?

Implementation

Code Implement

Code File

API Integration Using GetX

Conclusion


>>What is GetX?:

GetX is a quick, stable, and light state management library in a flutter. There are so many State Management libraries in flutter like MobX, BLoC, Redux, Provider, and so forth.

GetX is additionally a strong miniature framework and utilizing this, we can oversee states, make routing, and can perform dependency injection.
State management permits you information transfer inside the application. What’s more, at whatever point information is passed, the application’s state is updated, thusly rebuilding the system.

Along these lines, developers must be especially cautious about managing the state of an application since state updation may at times appear to be exorbitant for a complex application.


>>Principles:
There are three principles of GetX:

> Performance: When contrasted with other state management libraries, GetX is best since it consumes the least assets and gives better execution. It doesn’t utilize ChangeNotifier or Streams. Take a gander at the beneath RAM graph portraying different state managers.
> Productivity: GetX’s syntax is simple so it is useful. It saves a ton of time for the developers and speeds up the application since it doesn’t utilize additional assets. It utilizes just those assets which are right now required and after its work is done, the assets will be free naturally. If every one of the assets is stacked into the memory, it won’t be simply useful. So better to involve GetX in this.
> Organization: GetX code is coordinated as View, Logic, route, and dependency injection. So we needn’t bother with any additional context to navigate different screens. We can navigate to the screen without utilizing the unique circumstance so we are not dependent on the widget tree.


>>Three Pillars Of GetX:
> State Management: There are two types of state management:-
Simple State Manager: It uses the GetBuilder function.

Reactive State Manager: It uses GetX and Obx.

> Route Management: To make Widgets like Snackbar, Bottomsheets, dialogs, and so forth. Then, at that point, we can involve GetX in it because GetX can assemble these widgets without utilizing context.
> Dependency Management: GetX has a straightforward yet strong answer for dependency management utilizing controllers. To bring data from different Classes then with the assistance of GetX, we can do this in a solitary line of code. Eg: Get.put()


>>Why GetX?:

GetX is a very lightweight and powerful state management solution for flutter.

> High performance: GetX utilizes as less assets as could be expected. It doesn’t rely upon Streams or ChangeNotifier. All things being equal, it utilizes low inertness GetValue and GetStream to further develop execution.
> Less code: You might be tired of implementing boilerplate in the bloc pattern and wasting development energy on superfluous codes. Time is money, isn’t that so? In GetX, you won’t compose any boilerplate. You can accomplish the same thing a lot quicker, with less code in GetX. Don’t bother making classes for the state and event, since these boilerplates don’t exist in GetX.
> No code generation: There is a compelling reason need to utilize code generators by any means. So your significant development time won’t squander more on running code generators(build_runner) whenever you change your code.
> Don’t worry about context: Your application context is important. Yet, sending the context from your view to the controller can be, here and there lumbering. In GetX, you don’t have to do this. You can get to controllers inside one more controller with no unique context.
> No unnecessary rebuilds: Undesirable modifies are an issue of state managers based on ChangeNotifier. Whenever you roll out an improvement in your ChangeNotifier class, all widgets that rely upon that ChangeNotifier class are rebuilt. Some rebuilds might be superfluous and expensive. It might diminish the application’s performance too. You don’t need to stress over this in GetX since it doesn’t utilize the ChangeNotifier by any means.
> Code organization is simple: Bloc’s popularity comes from its prevalent code sorting-out capacities. It makes it more straightforward to isolate your business rationale from the show layer. GetX is a characteristic development for this as true documentation says. In GetX, you can isolate the business rationale as well as the show layer.


>>Implementation:
*Step 1: Add the dependencies

Add dependencies to pubspec — yaml file.

dependencies:
  flutter:
    sdk: flutter
  get: ^4.6.1
  
  
*Step 2: Import

import 'package:get/get.dart';

*Step 3: Run flutter packages get in the root directory of your app.

@How to implement code in dart file :
You need to implement it in your code respectively:

*Create a new dart file called main.dart inside the lib folder.

In the main. dart file, we will return GetMaterialApp(). Also, we will add a theme for color, and a home for showing starting screen.

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:getx/homePage.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(backgroundColor: Colors.indigo.shade100,
      primarySwatch: Colors.purple),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


*Create a new dart file called home_page_controller.dart inside the lib folder.

We will create a class called MyHomePageController inside it and extend the GetxController class. We will add the final count is equal to 0. obs. In GetX, to make a variable observable — this means that when it changes, other parts of our application depending on it will be notified. To do this we simply need to add .obs to the variable initialization. So for our above count variable, we will add .obs to 0.

To wrap things up with the MyHomePageController we will implement the increment method.

import 'package:get/get.dart';

class HomePageController extends GetxController {
  final count = 0.obs;
  increment() => count.value++;
}
>Create a new dart file called home_page.dart inside the lib folder.

First, we will create inside the HomePage class, we will instantiate the HomePageController.

final HomePageController controller = Get.put(HomePageController());
For our count, we want the Text widget to be updated with the current count. So we will wrap the Text widget with Obx widget.

Obx(
  () => Text(
    '${controller.count.value}',
    style: Theme.of(context).textTheme.headline4,
  ),
),

>We will add floatingActionButton, we will call the increment method when the floatingActionButton is pressed.

floatingActionButton: FloatingActionButton(
  onPressed: controller.increment,
  tooltip: 'Increment',
  backgroundColor: Colors.cyan,
  child: const Icon(Icons.add),
),
When we run the application, we ought to get the screen’s output like the underneath screen capture.

> Snackbar:
On the home page, we will also create a show snackbar button using Getx in a flutter. In this button, onPressed method we will add inside Get. snackbar(). Also, we will add snackPosition and backgroundColor. In the child method, we will add the text ‘Show Snackbar’.

ElevatedButton(
    style: ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 18),
      primary: Colors.teal,
    ),
    onPressed: () {
      Get.snackbar('GetX Snackbar', 'Yay! Awesome GetX Snackbar',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.tealAccent);
    },
    child: const Text('Show Snackbar')),
    
>When we run the application, we ought to get the screen’s output like the underneath screen capture.

> Dialog:
On the home page, we will also create a show alertDialog button using Getx in a flutter. In this button, onPressed method we will add inside Get. defaultDialog(). Also, we will add the title, middle text, textConfirm, confirmTextColor, and textCancel. In the child method, we will add the text ‘Show AlertDialog’.

ElevatedButton(
    style: ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 18),
      primary: Colors.teal,
    ),
    onPressed: () {
      Get.defaultDialog(
          title: 'GetX Alert',
          middleText: 'Simple GetX alert',
          textConfirm: 'Okay',
          confirmTextColor: Colors.white,
          textCancel: 'Cancel');
    },
    child: const Text('Show AlertDialog')),
    
    
>When we run the application, we ought to get the screen’s output like the underneath screen capture.


Dialog Output
> Navigation In GetX:
On the home page, we will create a button ‘Go to next screen’ text and icon. On this button, onPressed method. We will add Get.to(() => const SecondPage()) for navigating screen without using context.

Padding(
  padding: const EdgeInsets.all(12.0),
  child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        minimumSize: const Size.fromHeight(40),
        primary: Colors.teal,
      ),
      child: Row(
        children: const [
          Spacer(),
          Text("Go to next screen"),
          SizedBox(
            width: 20,
          ),
          Expanded(
              child: Icon(
            Icons.arrow_right_alt,
            size: 40,
          ))
        ],
      ),
      onPressed: () {
        Get.to(() => const SecondPage());
      }),
),


When we run the application, we ought to get the screen’s output like the underneath screen capture.

*Create a new dart file called second_page.dart inside the lib folder.

>We will create a new SecondPage class. In this class, we will add a text and an ElevatedButton and wrap into it a Column widget.

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "The Flutter app developers at FlutterDevs have decades of industry experience under a single roof,"
                    " and this empowers us to serve you with excellence.",
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                    minimumSize: const Size.fromHeight(40),
                    primary: Colors.teal,
                  ),
                  child: Row(
                    children: const [
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(flex: 3, child: Text("Go to Home screen")),
                    ],
                  ),
                  onPressed: () {
                    Get.back();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
  
>When the user presses the ‘Go to home screen’ button then, the user back to the home screen. On this onPressed method, we will add Get. back() for navigation without using context.

When we run the application, we ought to get the screen’s output like the underneath screen capture.

When we run the application, we ought to get the console final output like the underneath.

Launching lib/main.dart on ONEPLUS A5010 in debug mode...
Running Gradle task 'assembleDebug'...
✓  Built build/app/outputs/flutter-apk/app-debug.apk.
Installing build/app/outputs/flutter-apk/app.apk...
Debug service listening on ws://127.0.0.1:38103/2vooOVfhIIY=/ws
Syncing files to device ONEPLUS A5010...
[GETX] Instance "GetMaterialController" has been created
[GETX] Instance "GetMaterialController" has been initialized
[GETX] GOING TO ROUTE /HomePage
[GETX] Instance "HomePageController" has been created
[GETX] Instance "HomePageController" has been initialized
[GETX] OPEN DIALOG 849896188
[GETX] CLOSE DIALOG 849896188
[GETX] GOING TO ROUTE /SecondPage
[GETX] CLOSE TO ROUTE /SecondPage
[GETX] GOING TO ROUTE /SecondPage
[GETX] CLOSE TO ROUTE /SecondPage
  
  
>>Code File:
  
import 'package:flutter/material.dart';
import 'package:flutter_getx_statemanagement/view_screens/second_page.dart';
import 'package:get/get.dart';
import '../controllers/home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter GetX State Management Demo"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        tooltip: 'Increment',
        backgroundColor: Colors.cyan,
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              "assets/logo.png",
              width: 300,
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(
              () => Text(
                '${controller.count.value}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 18),
                  primary: Colors.teal,
                ),
                onPressed: () {
                  Get.snackbar('GetX Snackbar', 'Yay! Awesome GetX Snackbar',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.tealAccent);
                },
                child: const Text('Show Snackbar')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 18),
                  primary: Colors.teal,
                ),
                onPressed: () {
                  Get.defaultDialog(
                      title: 'GetX Alert',
                      middleText: 'Simple GetX alert',
                      textConfirm: 'Okay',
                      confirmTextColor: Colors.white,
                      textCancel: 'Cancel');
                },
                child: const Text('Show AlertDialog')),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                    minimumSize: const Size.fromHeight(40),
                    primary: Colors.teal,
                  ),
                  child: Row(
                    children: const [
                      Spacer(),
                      Text("Go to next screen"),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Icon(
                        Icons.arrow_right_alt,
                        size: 40,
                      ))
                    ],
                  ),
                  onPressed: () {
                    Get.to(() => const SecondPage());
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
  
  
>When we run the application, we ought to get the screen’s output like the underneath screen capture.


>>API Integration Using GetX:
  
*Add the dependencies in pubspec.ymal file.
  
  dependencies:
  flutter:
    sdk: flutter
  get: ^4.6.5
  cupertino_icons: ^1.0.5
  http: ^0.13.5
  
  *Create two-variable first for user_model and isDataLoading for loader in HomePageController class in homePageController.dart
  
  class HomePageController extends GetxController {
  User_Model? user_model;
  var isDataLoading = false.obs;

  final count = 0.obs;
  increase() => count.value++;

*Fetch API in the controller(Create a method getApi() inside HomePageController class).
  
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
  
Create getApi() in which Fetch API in the controller. we pass try, catch, and finally. In try first, we add isDataLoading loader as true. and create a response and add an API link by using HTTP. get. If the status code is true then it shows the data. otherwise, print the error. And In finally, we pass the isDataLoading loader as false.
  
  
*Create a User_model file in which we add the model of API. we can easily create the data model by using JsonToDart. In this, we add our JSON file and convert it into a dart file.
  
  class User_Model {
  List<Data>? data;
  int? total;
  int? page;
  int? limit;

  User_Model({this.data, this.total, this.page, this.limit});

  User_Model.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    total = json['total'];
    page = json['page'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['page'] = this.page;
    data['limit'] = this.limit;
    return data;
  }
}

class Data {
  String? id;
  String? title;
  String? firstName;
  String? lastName;
  String? picture;

  Data({this.id, this.title, this.firstName, this.lastName, this.picture});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['picture'] = this.picture;
    return data;
  }
}
  
*Now lets create new page to show the Api results
  
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
    controller.getApi();    //API gets called using GetX controller before building ui.
    return Scaffold(
        appBar: AppBar(title: const Text('Api with GetX')),
        body:
  }
  
*In the body, we wrap all the code with Obx for state management and add a condition that if isDataLoader is true it shows data otherwise it shows CircularProgressIndicator().
  
   Obx(() => controller.isDataLoading.value
                ? const Center(child: CircularProgressIndicator())
                : _builScreen()));
  
*In _builScreen we return ListView.builder(), in item count pass user model length. And in the builder, we pass context and index and return Column(). In the children of the column, we add SizedBox and container. In Container, we pass the row and add image and column. add the column as a child of the container. In the children, we pass three texts, title, first name, and last name.
  
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
  
  **It's done if you have done everything right it should work smooth Or you know you can just clone from my reposetory and contact me for any issue or quary.**
  
>>Conclusion:
In the article, I have explained the basic structure of GetX State Management in a flutter; you can modify this code according to your choice. This was a small introduction to GetX State Management On User Interaction from my side, and it’s working using Flutter. we have been through How to call Rest API Using GetX along with how to implement it in a Flutter. By using we can perform many operations and create a Flutter application.

  
