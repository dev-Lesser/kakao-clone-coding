import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //stless 커맨드
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold( // 상중하
          appBar: AppBar(
            title: Text('카카오톡 클론코딩'),
            backgroundColor: Color(0xfff3b21c),
            leading: Icon(Icons.beach_access,color: Colors.black,),
            titleTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20),
          ),
          body: Container(
            padding: EdgeInsets.all(20),
            child: SizedBox(
              child: ListView(
                children: [
                    Container(
                      child: Text('내 정보', style: TextStyle(fontSize: 10)),
                      padding: EdgeInsets.all(10),
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          child: const Icon(Icons.person)
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text('내이름', style: TextStyle(fontFamily: 'gangwon'),)
                        )
                      ],
                  ),
                  Divider(color: Colors.black, thickness: 0.2),
                  Container(
                      child: Text('내 친구 정보', style: TextStyle(fontSize: 10)),
                    padding: EdgeInsets.all(10),
                  ),
                  for (var i = 0; i < 30; i++) Column(
                      children: [
                        ContactItem(),
                        Divider(color: Colors.black, thickness: 0.1)
                      ]
                  ),
                ]
              )
            )
          ),

          bottomNavigationBar: BottomAppBar(
            child: SizedBox(
            height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(icon: Icon(Icons.person), onPressed: (){},),
                  IconButton(icon: Icon(Icons.chat), onPressed: (){},),
                  IconButton(icon: Icon(Icons.center_focus_weak_sharp), onPressed: (){},),
                  IconButton(icon: Icon(Icons.menu), onPressed: (){},),
                ],
              )
            ),
          )
        )
    );

  }
}

// 커스텀 위젯 클래스 stless > 그냥 됨
class ContactItem extends StatelessWidget {
  const ContactItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(primary: Colors.black),
        child: Row(
          children: [
            CircleAvatar(
                backgroundColor: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                child: const Icon(Icons.person, color: Colors.white,)
            ),
            Container(
                padding: EdgeInsets.all(20),
                child: Text(getRandString(3))
            ),
          ],
        ),
      onPressed: (){
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 200,
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('Modal BottomSheet'),
                    TextButton(
                      child: const Text('Done!'),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

String getRandString(int len) {
  var random = math.Random.secure();
  var values = List<int>.generate(len, (i) =>  random.nextInt(255));
  return base64UrlEncode(values);
}