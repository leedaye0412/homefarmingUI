import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RecommendPage extends StatefulWidget {
  const RecommendPage({Key? key});

  @override
  State<RecommendPage> createState() => _MotivationPageState();
}

class _MotivationPageState extends State<RecommendPage> {
  var description = [
    '홈파밍에 오래 신경쓸 수 있어요(1시간 이상)',
    '아침 저녁으로 홈파밍에 집중 가능해요(30분 이상)',
    '하루 일과를 마치면 시간이 촉박해요(30분 미만)'
  ];

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {

    final imageSizeW = MediaQuery.of(context).size.width;
    final imageSizeH = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '채소 추천',
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
              '채소과 함께 할 수 있는 시간을 알려주세요!',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Text(
              '아직 채소를 못 고르셨다면 팜어스가 추천해줄게요',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: description.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Card(
                          color: selectedIndex == index? Colors.grey : Colors.grey[200],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              description[index],
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          )),
                    );
                  }),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/e');
                    },
                    child: Text('건너뛰기'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(imageSizeW * 0.4, imageSizeH/12),
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.black,
                      textStyle: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: selectedIndex != null ?() {
                      Navigator.pushNamed(context, '/d');
                    }: null,
                    child: Text('다음'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(imageSizeW * 0.4, imageSizeH/12),
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.black,
                      textStyle: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
