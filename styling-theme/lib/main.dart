import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
        textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 20, color: Colors.blueAccent),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        ),
      ),
      home: ThemeExample(),
    );
  }
}



class ThemeExample extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Theme example....'),),
      body:Center(
        child: ElevatedButton(
          child: Text('Styled Button'),
          onPressed: (){},
        ),
      ),
    );
  }
}
