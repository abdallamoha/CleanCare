import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReviewOrder extends StatefulWidget {
  @override
  _ReviewOrderState createState() => _ReviewOrderState();
}

class _ReviewOrderState extends State<ReviewOrder> {
  bool _isVisible = true;
//  initState() {
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        //title: Text('Review Order'),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blue,
            size: 3,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          GestureDetector(
              onTap: () {
                setState(() {
                  _isVisible = !_isVisible;
                });
              },
              child: Icon(
                Icons.edit,
                color: Colors.blue,
                size: 33,
              )),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            // flex: 2,
            child: Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 21, top: 10),
              child: Text(
                'Review Order',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 11,
          ),
          Expanded(
            flex: 5,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
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
                                image: AssetImage('images/house.png'),
                              )),
                        ),
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'T-shirt',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  //fontSize: 18,
                                ),
                              ),
                              Text(
                                'KSH 5',
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
                            Offstage(
                              offstage: _isVisible,
                              //maintainSize: true,
                              // maintainAnimation: true,
                              // maintainState: true,
                              // visible: _isVisible,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 35,
                                    height: 35,
                                    color: Colors.grey,
                                    child: Center(
                                      child: IconButton(
                                        iconSize: 20,
                                        icon: Icon(Icons.remove),
                                        onPressed: () {},
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
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 15, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Sub Total',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Color(0xff2F3142)),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        'KSH 94',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'FEE',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Color(0xff2F3142)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'KSH 5(TAx ID)',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 5,
                  color: Color(0xffFFFFF0),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Sub Total',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.blue[900]),
                      ),
                      Text(
                        'KSH 90',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.blue[900]),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 60, top: 20),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: <Widget>[
                        RawMaterialButton(
                          elevation: 4.0,
                          onPressed: () {},
                          fillColor: Colors.blue[900],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          constraints:
                              BoxConstraints.tightFor(width: 300, height: 50),
                          child: Text(
                            'REQUEST CLEAN CARE',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
