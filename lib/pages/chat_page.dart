import 'dart:io';

import 'package:chat_app/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ChatPage extends StatefulWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin{
  @override
  final _textController=TextEditingController();
  final focusNode=new FocusNode();
  List<ChatMessage> _mensajes=[
    
  ];
  bool estaEscribiendo=false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title:Column(
          children: [
            CircleAvatar(
              maxRadius: 14,
              child: Text('Te',style: TextStyle(fontSize: 12),),
              backgroundColor: Colors.blue[100]
            ),
            SizedBox(height: 3,),
            Text('Test 1',style: TextStyle(color: Colors.black87,fontSize: 12),)
          ],
        ),
        elevation: 1,
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: _mensajes.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (_,i)=>_mensajes[i],
                reverse: true,
              )
            ),
            Divider( height: 1,),
            _inputChat()
          ],
        ),
      ),
    );
  }
  
  Widget _inputChat(){
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        height: 50,
        color: Colors.white,
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmit,
                onChanged: (value){
                  //cuando hay un valor para poder enviar el mensaje
                  setState(() {
                    if(value.trim().length>0){
                      estaEscribiendo=true;
                    }
                    else{
                      estaEscribiendo=false;
                    }
                  });
                },
                decoration: InputDecoration.collapsed(hintText: 'Enviar mensaje'),
                focusNode:focusNode ,
              )
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              child: Platform.isIOS ? CupertinoButton(child: Text("Enviar"), onPressed:estaEscribiendo?()=>_handleSubmit(_textController.text):null,) : Container(margin: EdgeInsets.symmetric(horizontal: 4),child: IconTheme(data:IconThemeData(color: Colors.blue[400]),child: IconButton(icon: Icon(Icons.send),onPressed:estaEscribiendo?()=>_handleSubmit(_textController.text):null,)),)
            )
          ],
        ),
      ),
    );
  }
  _handleSubmit(String texto){
    if(texto.length==0) return;
    _textController.clear();
    focusNode.requestFocus();
    final _newMessage=ChatMessage(uid:'123',texto: texto,animationController: AnimationController(vsync: this,duration: Duration(milliseconds: 200)));
    _mensajes.insert(0, _newMessage);
    _newMessage.animationController.forward();
    
    setState(() {
      estaEscribiendo=false;
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    for(ChatMessage message in _mensajes){
      message.animationController.dispose();
    }
    super.dispose();
  }
}