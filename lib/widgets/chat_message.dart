import 'package:flutter/material.dart';
class ChatMessage extends StatelessWidget {
  final String texto;
  final String uid;
  final AnimationController animationController;
  const ChatMessage({@required this.texto, @required this.uid, @required this.animationController});

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(parent: animationController,curve: Curves.easeOut),
        child: Container(
         child: this.uid=='123'?_miMessage():_notMiMessage(),
        ),
      ),
    );
  }

  Widget _miMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(bottom: 5,left: 50,right: 5),
        child: Text(this.texto,style: TextStyle(color: Colors.white),),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xff4D9EF6)
        ),
      ),

    );
  }

  Widget _notMiMessage() {
     return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(bottom: 5,left: 5,right: 50),
        child: Text(this.texto,style: TextStyle(color: Colors.black87),),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffE4E5E8)
        ),
      ),

    );
  }
}