import 'package:flutter/material.dart';
import 'package:flutter_app/next_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> titleList = ['Amazon','楽天','Yahoo!','Google','Twitter'];

  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text('パスワード管理'),
      ),
      body: ListView.builder(

        itemCount: titleList.length,

        itemBuilder: (BuildContext context, int i) {
          return Column(
              children: [
                ListTile(
                  onTap: (){
                    //リストがタップされたときに画面遷移する
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage(titleList[i])));
                  },
                  leading: Icon(Icons.vpn_key),
                  title: Text(titleList[i]),

                ),
                Divider(),
              ],
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //ボタンが押されたときの処理
          titleList.add('Google');
          print(titleList);
          setState(() {

          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

//todo 登録したID・PWを次の画面に渡す（main.dat, next_page.dat）
//todo 削除ボタン=>各リストの横に"×"を追加（main.dat）
//todo 文字サイズ（next_page.dat）
//todo 画面から新規ID・PWを登録できるようにする（main.dat）
//todo ログインページ（ID、PW、新規登録）