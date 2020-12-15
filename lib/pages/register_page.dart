import 'package:chat_app/widgets/boton_azul.dart';
import 'package:chat_app/widgets/custom_input..dart';
import 'package:chat_app/widgets/labels.dart';
import 'package:chat_app/widgets/logo.dart';
import 'package:flutter/material.dart';
class RegisterPage extends StatelessWidget {
  const RegisterPage({Key key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color(0xffF2F2F2),
     body: SafeArea(
       child: SingleChildScrollView(
         physics: BouncingScrollPhysics(),
         child: Container(
           height: MediaQuery.of(context).size.height*0.9,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Logo(titulo:"Register"),
               _Form(),
               Labels(ruta: 'login',textVariable: "Ingresar",titulo: "¿Ya tienes cuenta",),
            
               Container(margin: EdgeInsets.only(bottom:50),child: Text("Términos y condiciones de uso",style: TextStyle(fontWeight: FontWeight.w200),))
             ],
           ),
         ),
       ),
     ),
    );
  }
}

class _Form extends StatefulWidget {
  

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl=new TextEditingController();
  final nombreCtrl=new TextEditingController();
  final passCtrl= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:20),
      padding: EdgeInsets.symmetric(horizontal: 50),
       child: Column(
         children: [
          CustomInput(icon: Icons.perm_identity,placeholder: "Nombre",textController:nombreCtrl,),
          CustomInput(icon: Icons.email_outlined,placeholder: "Email",keyboardType: TextInputType.emailAddress,textController:emailCtrl,),
          CustomInput(icon: Icons.lock_outlined,placeholder: "Password",textController:passCtrl,isPassword: true,),
          BotonAzul(press: ()=>print("hola"), text: "Ingrese")
         ],
       )
    );
  }
}