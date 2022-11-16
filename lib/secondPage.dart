import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/apiBuilder.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPage();
}

class _SecondPage extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page GetX'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'GetX is a quick, stable, and light state management library in a flutter. There are so many State Management libraries in flutter like MobX, BLoC, Redux, Provider, and so forth.\n\nGetX is additionally a strong miniature framework and utilizing this, we can oversee states, make routing, and can perform dependency injection.\nState management permits you information transfer inside the application. What’s more, at whatever point information is passed, the application’s state is updated, thusly rebuilding the system.\n',
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),

          Padding(
            padding: const EdgeInsets.all(40.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  minimumSize: const Size.fromHeight(40),
                  backgroundColor: Colors.purple.shade700,
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
                    Expanded(flex: 3, child: Text("Go to Home screen",style: TextStyle(fontSize: 20),)),
                  ],
                ),
                onPressed: () {
                  Get.back();
                }),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  minimumSize: const Size.fromHeight(40),
                  backgroundColor: Colors.purple.shade700,
                ),
                child: Row(
                  children: const [
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.arrow_circle_right_outlined,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(flex: 3, child: Text("Third Screen",style: TextStyle(fontSize: 20),)),
                  ],
                ),
                onPressed: () {
                  Get.to(()=>const ApiCallGetX());
                }),
          ),
        ],
      ),
    );
  }
}
