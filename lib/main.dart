import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

void main() {
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
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurpleAccent,
          shadowColor: Colors.black,
          elevation: 20,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
        ),
        scaffoldBackgroundColor: Colors.grey[300]
      ),
      home: const MyHomePage(title: 'My First Project'),
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
      alignment: Alignment.center,
      color: Colors.black,
      child: const Text('1'),
    ),
    Container(
      alignment: Alignment.center,
      color: Colors.red,
      child: const Text('2'),
    ),
    Container(
      alignment: Alignment.center,
      color: Colors.purple,
      child: const Text('3'),
    ),
    Container(
      alignment: Alignment.center,
      color: Colors.yellow,
      child: const Text('4'),
    ),
    Container(
      alignment: Alignment.center,
      color: Colors.orangeAccent,
      child: const Text('5'),
    ),
    Container(
      alignment: Alignment.center,
      color: Colors.greenAccent,
      child: const Text('6'),
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
          Divider(),
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
              VerticalDivider(),
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


