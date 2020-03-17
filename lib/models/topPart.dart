import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListMenu {
  ImageProvider imageThumbnail;
  String label;

  ListMenu({this.imageThumbnail, this.label});
}

List<ListMenu> menuObj = [
  ListMenu(
      imageThumbnail: AssetImage('images/TOP/icons8-t-shirt-100.png'),
      label: 'TOP'),
  ListMenu(
      imageThumbnail: AssetImage('images/BOTTOM/icons8-jeans-100.png'),
      label: 'BOTTOM'),
  ListMenu(
      imageThumbnail: AssetImage('images/DRESS/icons8-wedding-dress-100.png'),
      label: 'DRESS'),
  ListMenu(
      imageThumbnail: AssetImage('images/BLAZER/icons8-jacket-100.png'),
      label: 'BLAZER'),
  ListMenu(
      imageThumbnail: AssetImage('images/SHOES/icons8-shoes-96.png'),
      label: 'SHOES'),
];
