import 'package:flutter/material.dart';

class Recommend2Page extends StatefulWidget {
  const Recommend2Page({super.key});

  @override
  State<Recommend2Page> createState() => _Recommend2PageState();
}

class _Recommend2PageState extends State<Recommend2Page> {
  var LevelList = ['초심자', '경험자', '중급자','고수'];

  var description = [
    '홈파밍이 처음이에요',
    '홈파밍을 시도한 경험은 있지만 성공하진 못했어요',
    '채소를 잘 관리하고 제배하는 방법을 알고있어요',
    '홈파밍 전문가 수준이에요'
  ];

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {

    final imageSizeW = MediaQuery.of(context).size.width;
    final imageSizeH = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('채소 추천',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LinearProgressIndicator(
                value: 0.66,
                backgroundColor: Colors.grey[350],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const Text(
              '채소를 얼마나 잘 기르시나요?',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Text(
              '아직 채소를 못 고르셨다면 팜어스가 추천해줄게요',
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: LevelList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Card(
                        color: selectedIndex == index? Colors.grey : Colors.grey[200],
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      LevelList[index],
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      description[index],
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                    );
                  }),
            ),
            Center(
              child: ElevatedButton(
                onPressed: selectedIndex != null? () {
                  Navigator.pushNamed(context, '/e');
                }: null,
                child: Text('다음'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(imageSizeW * 0.9, imageSizeH/12),
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.black,
                  textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}