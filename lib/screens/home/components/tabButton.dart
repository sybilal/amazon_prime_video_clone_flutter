import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final String text;
  final int selectedPage;
  final int pageNumber;
  final Function onPressed;

  TabButton({this.text, this.selectedPage, this.pageNumber, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(pageNumber),
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Text(
            text,
            style: TextStyle(
              color: this.selectedPage == this.pageNumber
                  ? Colors.lightBlue
                  : Colors.grey,
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          )),
    );
  }
}
