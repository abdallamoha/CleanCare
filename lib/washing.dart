import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cleancare/review_oder.dart';
import 'package:cleancare/models/topPart.dart';
import 'package:cleancare/models/categories.dart';

class Washing extends StatefulWidget {
  @override
  _WashingState createState() => _WashingState();
}

class _WashingState extends State<Washing> {
  int selectedIndex = 0;

  var toppart = ListMenu();
  var x = 0;

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (selectedIndex == 0) {
      content =
          buildColumn(myobjCategoriesTOP.length, toppart, myobjCategoriesTOP);
    } else if (selectedIndex == 1) {
      content = buildColumn(
          myobjCategoriesBOTTOM.length, toppart, myobjCategoriesBOTTOM);
    } else if (selectedIndex == 2) {
      content = buildColumn(
          myobjCategoriesDRESS.length, toppart, myobjCategoriesDRESS);
    } else if (selectedIndex == 3) {
      content = buildColumn(
          myobjCategoriesBlazer.length, toppart, myobjCategoriesBlazer);
    } else if (selectedIndex == 4) {
      content = buildColumn(
          myobjCategoriesSHOES.length, toppart, myobjCategoriesSHOES);
    }
    return Scaffold(
      //backgroundColor: Color(),
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Washing.',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_basket,
                  color: Colors.white,
                  size: 33.0,
                ),
              ),
              Container(
                  alignment: Alignment.topRight,
                  width: 22,
                  height: 24,
                  margin: EdgeInsets.only(top: 5, left: 30),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(16)),
                  //padding: EdgeInsets.only(left: 30, top: 2),
                  child: Center(
                    child: Text(
                      "14",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )),
            ],
          ),
        ],
      ),
      body: content,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => ReviewOrder()));
        },
        tooltip: 'Review Order',
        child: Icon(Icons.navigate_next),
      ),
    );
  }

  Column buildColumn(number, topmenu, obj) {
    var length = number;
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Select Clothes',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.more_horiz,
                      ),
                      iconSize: 30.0,
                      color: Colors.blueGrey,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Container(
                // color: Colors.greenAccent,
                height: 120.0,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 10.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: menuObj.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
//                    onTap: () => Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                        builder: (_) => ChatScreen(
//                          user: favorites[index],
//                        ),
//                      ),
//                    ),

                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: index == selectedIndex
                                  ? Color(0xff5F82C1)
                                  : Color(0xffE1EAF9),
                              radius: 35.0,
                              backgroundImage: menuObj[index].imageThumbnail,
                            ),
                            SizedBox(height: 6.0),
                            Text(
                              menuObj[index].label,
                              // favorites[index].name,
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            //  padding: EdgeInsets.only(left: 10.0),
            itemCount: length,
            itemBuilder: (BuildContext context, int index) {
              //  x += int.parse(obj[index].price);
              return Container(
                margin: EdgeInsets.all(5),
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Container(
                            // width: 84,
                            //height: 84,
                            color: Colors.white,
                            child: Image(
                              image: obj[index].IMAGE,
                            )),
                      ),
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              obj[index].label,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                //fontSize: 18,
                              ),
                            ),
                            Text(
                              'KSH $x',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            child: Text(
                              'x1',
                              style: TextStyle(fontSize: 15),
                            ),
                            margin: EdgeInsets.only(left: 45),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 35,
                                height: 35,
                                color: Colors.grey,
                                child: Center(
                                  child: IconButton(
                                    iconSize: 20,
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      if (x == obj[index].price) {
                                        return;
                                      } else {
                                        setState(() {
                                          x -= int.parse(obj[index].price);
                                        });
                                        print(x);
                                      }
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                width: 35,
                                height: 35,
                                color: Colors.blue,
                                child: Center(
                                  child: IconButton(
                                    iconSize: 20,
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        x += int.parse(obj[index].price);
                                      });
                                      print(x);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
