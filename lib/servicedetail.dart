import 'package:flutter/material.dart';
import 'washing.dart';

class ServicesDetail extends StatefulWidget {
  @override
  _ServicesDetailState createState() => _ServicesDetailState();
}

class _ServicesDetailState extends State<ServicesDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Services type',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(0.0),
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "you location",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "WESTI",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Services(
            servicesName: 'Wash',
            thumbnail: AssetImage('images/WASH1.png'),
            servicesName1: 'House Keeping',
            thumbnail1: AssetImage('images/house.png'),
            onpressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Washing()));
            },
            onpressed1: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Washing()));
            },
          ),
          Services(
            servicesName: 'Office janitor',
            thumbnail: AssetImage('images/icons8-housekeeping-100.png'),
            servicesName1: 'Premium Wash',
            thumbnail1: AssetImage('images/icons8-washing-machine-96.png'),
          ),
        ],
      ),
    );
  }
}

class Services extends StatelessWidget {
  final String servicesName;
  final String servicesName1;
  final ImageProvider thumbnail;
  final ImageProvider thumbnail1;
  final Function onpressed;
  final Function onpressed1;
  Services(
      {this.servicesName,
      this.thumbnail,
      this.onpressed,
      this.servicesName1,
      this.thumbnail1,
      this.onpressed1});
//
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: GestureDetector(
            onTap: () {
              onpressed();
            },
            child: Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              height: 160,
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Image(
                        height: 90,
                        image: thumbnail,
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      servicesName,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              onpressed1();
            },
            child: Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              height: 160,
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Image(
                        height: 100,
                        image: thumbnail1,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      servicesName1,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
