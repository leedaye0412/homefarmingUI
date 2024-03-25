import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:homefarming/main.dart';

class FinishPage extends StatefulWidget {


  @override
  State<FinishPage> createState() => _FinishPageState();
}

class _FinishPageState extends State<FinishPage> {
  @override
  Widget build(BuildContext context) {
    final nickname = Get.find<UserController>().nickname.value;
    final imageSizeW = MediaQuery.of(context).size.width;
    final imageSizeH = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '가입 완료',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: LinearProgressIndicator(
                  value: 1.0,
                  backgroundColor: Colors.grey[350],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        color: Colors.grey[200],
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
                          child: Column(
                            children: [
                              Container(
                                width: imageSizeW * 0.5,
                                height: imageSizeH / 3,
                                child: Image.asset('image/vegetables.jpg'),
                              ),
                              Text(
                                '$nickname 님 가입이 완료되었어요',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '홈에서 추천 채소를 확인해보세요!',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '성취감과 즐거움을 느낄 수 있도록',
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '$nickname 님의 홈파밍 여정에 도움을 드릴게요',
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Text('시작하기'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(imageSizeW * 0.9, imageSizeH / 12),
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.black,
                  textStyle: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

