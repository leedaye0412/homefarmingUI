import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:homefarming/finishPage.dart';
import 'package:homefarming/main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController nicknameController = TextEditingController();
  int nicknameLength = 0;
  bool containsSC = false;
  File? image;

  @override
  Widget build(BuildContext context) {
    final imageSize = MediaQuery.of(context).size.width / 3;
    final imageSizeW = MediaQuery.of(context).size.width;
    final imageSizeH = MediaQuery.of(context).size.height;

    @override
    void dispose() {
      nicknameController.dispose();
      super.dispose();
    }

    Future<void> _getImageFromGallery() async {
      final imagePicker = ImagePicker();
      final pickedImage =
          await imagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        if (pickedImage != null) {
          image = File(pickedImage.path);
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '프로필 설정',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LinearProgressIndicator(
                  value: 0.0,
                  backgroundColor: Colors.grey[350],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '프로필 사진과 닉네임을 정해주세요!',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: imageSize,
                        height: imageSize,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[350],
                          image: image != null
                              ? DecorationImage(
                                  image: FileImage(image!),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: image == null
                            ? Center(
                                  child: Text(
                                    '프로필',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ): null,
                      ),
                      ElevatedButton(
                        onPressed: _getImageFromGallery,
                        child: Text('앨범'),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(10,40),
                            backgroundColor: Colors.grey,
                            foregroundColor: Colors.black,
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 10)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('닉네임', textAlign: TextAlign.left),
                    Text('$nicknameLength/10', textAlign: TextAlign.right),
                  ],
                ),
                TextField(
                  controller: nicknameController,
                  onChanged: (value) {
                    if (value.length <= 10) {
                      setState(() {
                        nicknameLength = value.length;
                        containsSC = RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]')
                            .hasMatch(value);
                      });
                      // 입력된 텍스트에서 특수문자를 제외한 글자만 필터링
                      String filteredText =
                      value.replaceAll(RegExp(r'[^A-Za-z0-9가-힣]'), '');
                      // 필터링된 텍스트를 입력 필드에 적용
                      if (nicknameController.text != filteredText) {
                        nicknameController.value =
                            nicknameController.value.copyWith(
                              text: filteredText,
                              selection: TextSelection(
                                  baseOffset: filteredText.length,
                                  extentOffset: filteredText.length),
                              composing: TextRange.empty,
                            );
                      }
                    } else {
                      // 입력값이 10을 초과하면 마지막으로 입력된 문자를 삭제하여 10자로 제한
                      nicknameController.value = TextEditingValue(
                        text: value.substring(0, 10),
                        selection: TextSelection.collapsed(offset: 10),
                      );
                    }
                  },
                  decoration: InputDecoration(
                    labelText: '닉네임을 입력해주세요',
                  ),
                ),
                if (containsSC)
                  Text(
                    '특수문자는 입력할 수 없어요',
                    style: TextStyle(color: Colors.red),
                  ),
                SizedBox(
                  height: 130,
                ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          String nickname = nicknameController.text;
                          Get.find<UserController>().nickname.value = nickname;
                          Get.toNamed('/b');
                        },
                        child: Text('다음'),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(imageSizeW * 0.9, imageSizeH/12),
                            backgroundColor: Colors.grey,
                            foregroundColor: Colors.black,
                            textStyle:
                            TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
