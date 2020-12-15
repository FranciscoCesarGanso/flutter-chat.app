import 'package:chat_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
class UsuariosPage extends StatefulWidget {
  

  @override
  _UsuariosPageState createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  RefreshController _refreshController =RefreshController(initialRefresh: false);
  final usuarios=[
    Usuario(uid: '1',nombre: 'Maria',email: 'm@.com',online: true),
    Usuario(uid: '2',nombre: 'Kiko',email: 'm@.com',online: true),
    Usuario(uid: '3',nombre: 'Laura',email: 'm@.com',online: false)  
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Mi nombre',style: TextStyle(color: Colors.black54),),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.exit_to_app,color: Colors.black54),
          onPressed: (){},
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            //offline_blod colors.red
            child: Icon(Icons.check_circle,color:Colors.blue[400]),
          )
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        child: _listViewUsuarios(),
        enablePullDown: true,
        header: WaterDropHeader(
          complete: Icon(Icons.check,color: Colors.blue[400]),
          waterDropColor: Colors.blue[400],
        ),
        onRefresh: _cargarUsuarios,
      )
    );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (_,i)=>_usuarioListTile(usuarios[i]),
      separatorBuilder: (_,i)=>Divider(), 
      itemCount: usuarios.length);
  }

  ListTile _usuarioListTile(Usuario usuario) {
    return ListTile(
        title: Text(usuario.nombre),
        subtitle: Text(usuario.email),
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(usuario.nombre.substring(0,2)),
        ),
        trailing: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: (usuario.online)?Colors.green:Colors.red
          ),
        ),
      );
  }
  _cargarUsuarios() async{
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }
}