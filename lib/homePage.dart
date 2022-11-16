import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/homeController.dart';
import 'package:getx/secondPage.dart';
enum SampleItem { itemOne, itemTwo, itemThree }
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageController controller = Get.put(HomePageController());
SampleItem? selectedMenu;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('GetX Demo'),
            PopupMenuButton<SampleItem>(
          initialValue: selectedMenu,
          // Callback that sets the selected popup menu item.
          onSelected: (SampleItem item) {
            setState(() {
              selectedMenu = item;
            });
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
            const PopupMenuItem<SampleItem>(
              value: SampleItem.itemOne,
              child: Text('Item 1'),
            ),
            const PopupMenuItem<SampleItem>(
              value: SampleItem.itemTwo,
              child: Text('Item 2'),
            ),
            const PopupMenuItem<SampleItem>(
              value: SampleItem.itemThree,
              child: Text('Item 3'),
            ),
          ],
        ),
          ],
        ),

      ),
      body: Column(
        children: [
          const Expanded(
              child: Image(image: AssetImage('assets/images/logo_get.png'))),
          const SizedBox(
            height: 20,
          ),
          Text('This is the counter intilized with GetX',
              style: Theme.of(context).textTheme.headline6),
          Obx(() => Text(
                '${controller.count.value}',
                style: Theme.of(context).textTheme.headline2,
              )),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              Get.snackbar('SnackBar', 'You got it alright GetX',
                  snackPosition: SnackPosition.BOTTOM,
                  snackStyle: SnackStyle.GROUNDED,
                  borderColor: Colors.indigo,
                  backgroundColor: Colors.indigo.shade50,
                  borderWidth: 2,
                  mainButton: TextButton(
                      onPressed: (() => print('SnackBar pressed')),
                      child: const Text(
                        'Okay',
                        style: TextStyle(color: Colors.black),
                      )));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.shade600,
                textStyle: const TextStyle(fontSize: 18)),
            child: const Text('Snack Bar GetX'),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 18, color: Colors.white),
                  backgroundColor: Colors.purple.shade700),
              onPressed: () {
                Get.defaultDialog(
                  title: 'GetX Alert',
                  middleText: 'GetX default Alert box is here!',
                  textConfirm: 'Okay',
                  confirmTextColor: Colors.white,
                  textCancel: 'Cancel',
                  onConfirm: () => Get.back(),
                );
              },
              child: const Text('Alert Dialog GetX')),
          
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: ElevatedButton(
              onPressed: (() {
                Get.to(() => const SecondPage());
              }),
              style: ElevatedButton.styleFrom(backgroundColor:Colors.purple.shade800, ),         
              child: Row(
                children: const [
                  Spacer(), 
                  Text('Goto Next Page',style: TextStyle(fontSize: 20),),
                Expanded(
                child: Icon(
              Icons.arrow_right_alt,
              size: 40,
            ))
            ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.increase(),
        tooltip: 'Increament',
        backgroundColor: Colors.purple.shade900,
        child: const Icon(Icons.add),
      ),
    );
  }
}
