import 'package:flutter/material.dart';
import 'package:homefarming/finishPage.dart';
import 'package:homefarming/motivationPage.dart';
import 'package:homefarming/profilePage.dart';
import 'package:homefarming/recommend2Page.dart';
import 'package:homefarming/recommendPage.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var nickname = ''.obs;
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute:'/',
      getPages: [
        GetPage(name: '/', page: () => ProfilePage()),
        GetPage(name: '/b', page: () => MotivationPage()),
        GetPage(name: '/c', page: () => RecommendPage()),
        GetPage(name: '/d', page: () => Recommend2Page()),
        GetPage(name: '/e', page: () => FinishPage()),
        GetPage(name: '/home', page: () => MyPage()),
      ],
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Main page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Main Screen',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
              ),),
            // ElevatedButton(
            //     onPressed: (){
            //       Navigator.of(context).pushReplacement(
            //         MaterialPageRoute(builder: (context) =>
            //         const ProfilePage()),
            //       );
            //     },
            //     child: Text('Go to onboarding screen')
            // ),
          ],
        ),
      ),
    );
  }
}


