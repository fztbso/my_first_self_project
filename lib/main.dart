import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import 'mainPage.dart';

void main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[300]
      ),
      home: const mainPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Container> cards = [
    Container(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
        child: SizedBox.expand(child: Center(child: Text("Selamlar"))),
        color: Colors.greenAccent,
      ),
    ),
    Container(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
        child: SizedBox.expand(child: Center(child: Text("Cat = Kedi"))),
        color: Colors.redAccent,
      ),
    ),
    Container(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
        child: SizedBox.expand(child: Center(child: Text("qwertyu"))),
        color: Colors.deepPurpleAccent,
      ),
    ),
    Container(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
        child: SizedBox.expand(child: Center(child: Text("bbbbbbb"))),
        color: Colors.teal,
      ),
    ),
    Container(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
        child: SizedBox.expand(child: Center(child: Text("Selamlar"))),
        color: Colors.amber,
      ),
    ),
    Container(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
        child: SizedBox.expand(child: Center(child: Text("Selamlar"))),
        color: Colors.white,
      ),
    ),
    Container(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
        child: SizedBox.expand(child: Center(child: Text("Selamlar"))),
        color: Colors.brown,
      ),
    ),
  ];


  CardSwiperController _controller = CardSwiperController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*0.5,
          child: Center(
            child: Flexible(
                  child: CardSwiper(
                    cardBuilder: (context, index) => cards[index],
                    cardsCount: cards.length,
                    controller: _controller,
                    numberOfCardsDisplayed: 2,
            )),
          ),
        ),
        Divider(thickness: 3,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent
              ),
                onPressed: (){
              _controller.swipeLeft();
            }, child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text("Tekrar Göster"),
            )),
            Icon(Icons.graphic_eq),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green
                ),
                onPressed: (){
              _controller.swipeRight();
            }, child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text("Ezberledim"),
            )),
          ],
        ),
      ],
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Text("S.A."),
      ),
    );
  }
}


