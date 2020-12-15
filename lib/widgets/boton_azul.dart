import 'package:flutter/material.dart';
class BotonAzul extends StatelessWidget {
  final Function press;
  final String text;
  final Color color;

  const BotonAzul({@required this.press, @required this.text, this.color=Colors.blue});
  @override
  Widget build(BuildContext context) {
    return  RaisedButton(
      elevation: 2,
      highlightElevation: 5,
      color: color,
      shape: StadiumBorder(),
      child: Container(
        height: 55,
        width: double.infinity,
        child: Center(
          child: Text(text,style: TextStyle(color: Colors.white,fontSize: 17,)),
        ),
      ),
      onPressed:press 
    );
  }
}