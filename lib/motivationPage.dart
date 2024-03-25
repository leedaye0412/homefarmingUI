import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MotivationPage extends StatefulWidget {
  const MotivationPage({Key? key});

  @override
  State<MotivationPage> createState() => _MotivationPageState();
}

class _MotivationPageState extends State<MotivationPage> {
  var imageList = [
    'image/bok choy.jpg',
    'image/bok choy.jpg',
    'image/bok choy.jpg'
  ];

  var motivattionList = ['채솟값 절약', '신선하고 안전한 식재료', '스트레스 해소와 정서적 안정'];

  var description = [
    '물가가 올라서 채솟값을 절약하고 싶어요',
    '직접 키운 채소로 신선한 요리를 만들고 싶어요',
    '홈파밍을 통해 정서적 안정이 필요해요'
  ];

  int selectedMotivations = 0;

  Set<int> selectedIndexes = {};

  @override
  Widget build(BuildContext context) {
    final imageSizeW = MediaQuery.of(context).size.width;
    final imageSizeH = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '홈파밍 동기 선택',
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
                  value: 0.33,
                  backgroundColor: Colors.grey[350],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              const Text(
                '홈파밍을 하는 이유가 궁금해요!',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Text(
                '내 홈파밍 동기에 맞는 응원 메시지를 전해드릴게요.',
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
                    itemCount: motivattionList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if(selectedIndexes.contains(index)){
                              selectedIndexes.remove(index);
                              selectedMotivations--;
                            }else{
                              selectedIndexes.add(index);
                              selectedMotivations++;
                            }
                          });
                        },
                        child: Card(

                            color: selectedIndexes.contains(index)? Colors.grey : Colors.grey[200],
                            child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 80,
                                height: 70,
                                child: Image.asset(imageList[index]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    motivattionList[index],
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    description[index],
                                    style: const TextStyle(fontSize: 10),
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
                  onPressed: selectedMotivations >=1 ? () {
                    Navigator.pushNamed(context, '/c');
                  } : null,
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
