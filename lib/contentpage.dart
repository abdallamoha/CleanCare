import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContentPage extends StatelessWidget {
  //({@required this.title});
  //final title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("d"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Center(
              child: Container(
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 34,
                  backgroundImage: AssetImage('images/m.jpg'),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: <Widget>[
                buildContainerprofil(context),
                SizedBox(
                  height: 10,
                ),
                buildContainerprofil(context),
                SizedBox(
                  height: 10,
                ),
                buildContainerprofil(context),
                SizedBox(
                  height: 10,
                ),
                buildContainerprofil(context),
                SizedBox(
                  height: 10,
                ),
                buildContainerprofil(context),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(bottom: 25),
              width: 250,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {},
                child: Text("Button"),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildContainerprofil(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 50,
      width: MediaQuery.of(context).size.width - 20,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey,
            offset: Offset(-2.0, -2.0),
            blurRadius: 5.0,
            // spreadRadius: 4.0
          )
        ],
        border: Border.all(
          color: Colors.lightBlueAccent,
          width: 5,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(26),
        color: Colors.blue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('username'),
          Text('username'),
        ],
      ),
    );
  }
}
