import 'package:fast_contacts/fast_contacts.dart';
import 'package:flashcardplus/flashcardplus.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:permission_handler/permission_handler.dart';

class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {

  int secilenIndex = 0;

  List<String> images = [
    'https://gank.io/images/5ba77f3415b44f6c843af5e149443f94',
    'https://gank.io/images/02eb8ca3297f4931ab64b7ebd7b5b89c',
    'https://gank.io/images/31f92f7845f34f05bc10779a468c3c13',
    'https://gank.io/images/b0f73f9527694f44b523ff059d8a8841',
    'https://gank.io/images/1af9d69bc60242d7aa2e53125a4586ad',
  ];

  List<Widget> cards = List.generate(
    images.length,
        (int index) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 23.0,
              spreadRadius: -13.0,
              color: Colors.black54,
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.network(
            images[index],
            fit: BoxFit.cover,
          ),
        ),
      );
    },
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("MİGROS", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.w800, fontSize: 30),),
        backgroundColor: Colors.white,
        actions: [
          IconButton(icon:Icon(Icons.sticky_note_2_outlined), color: Colors.grey, onPressed: (){

          },),
        ],
      ),
      body: Column(
        children: [
          FlashCardPlus(
          size: Size(400, 600),
      cards: cards,
    ),
          /* Container(
            height: double.infinity,
            child: FutureBuilder(
              future: getContacts(),
                builder: (context, AsyncSnapshot snapshot){
              if(snapshot.data == null){
                return Center(
                  child: SizedBox(
                      height: 50,
                      child: CircularProgressIndicator()),
                );
              }
              return ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index){
                    Contact contact = snapshot.data[index];
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            child: Icon(Icons.person),
                          ),
                          title: Text(contact.displayName),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(contact.phones.first.number),
                              Text(contact.emails.first.address),
                              Divider(),
                            ],
                          ),
                        ),
                      ],
                    );
              });
            }),
          ),
         */
        ],
      ),



      bottomNavigationBar: BottomNavigationBar(
        currentIndex: secilenIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.quick_contacts_mail), label: "bir"),
          BottomNavigationBarItem(icon: Icon(Icons.deblur), label: "iki"),
          BottomNavigationBarItem(icon: Icon(Icons.deck_outlined), label: "üç"),
          BottomNavigationBarItem(icon: Icon(Icons.developer_board_outlined), label: "dört"),
        ],
        onTap: (index){
          setState(() {
            secilenIndex = index;
          });
        },
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.black,
      ),
    );
  }


  Future<List<Contact>> getContacts() async {
    bool isGranted = await Permission.contacts.status.isGranted;
    if(!isGranted) {
      isGranted = await Permission.contacts.request().isGranted;
    }
    if(isGranted) {
      return await FastContacts.getAllContacts();
    }
    return [];
  }
}
