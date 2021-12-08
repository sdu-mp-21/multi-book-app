import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return ListView(
      // Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
      // // crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "saved",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: getLatestEvents(),
              );
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "Applications",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        SizedBox(
            height: itemHeight,
            width: double.infinity,
            child: functionTile(itemHeight, itemWidth, <String, Function>{})),
      ],

    );
  }

  Widget getLatestEvents() {
    return SizedBox(
      width: 175,
      height: 100,
      child: Column(
        children: [
          Container(
            width: 175,
            height: 100,
            color: Colors.black,),
          const Text(
            "Data",
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.end,
          )
        ],
      ),
    );
  }

  /// We return some Application function using Card.
  /// In this method we will create Containers with Grid view.
  /// For example: we have 4 applications, and I want to see
  /// 2 card in Row, and 2 in Column.
  /// it will to create this
  /// It using childAspectRatio, he checked size height, width
  /// and it creating container with size Height / Width
  Widget functionTile(
      var itemHeight, var itemWidth, Map<String, Function> manageRouting) {
    return GridView.count(
      primary: false,
      crossAxisSpacing: 1,
      childAspectRatio: itemHeight / itemWidth,
      mainAxisSpacing: 1,
      crossAxisCount: 2,
      children: [
        getCard("manga", "assets/images/icons/red_color.png",
            manageRouting["manga"]),
        getCard("book", "assets/images/icons/red_color.png",
            manageRouting["book"]),
        getCard("audiobook", "assets/images/icons/red_color.png",
            manageRouting["audiobook"])

      ],
    );
  }

  /// Get Card in Main page.
  /// For Example We want ot add 4 Widget when if we click to Card,
  /// it will go to other page using Routing
  /// Card will return Container with Text and Background image.
  Widget getCard(String text, String assetPath, var functionRoute) {
    return SizedBox(
      width: 100,
      height: 50,
      child: Card(
          semanticContainer: true,
          elevation: 10,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(
            color: Colors.blueAccent,
            child: ListTile(
              trailing: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: null,
              enabled: true,
              tileColor: Colors.white,
            ),
          )),
    );
  }
}
