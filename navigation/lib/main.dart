import 'package:flutter/material.dart';
void main(){
  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      initialRoute: '/',
      routes:{
        '/': (context) => firstscreen(),
        '/second': (context) => secondScreen(),
      },
    );
  }
}

class firstscreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar : AppBar(title: Text('First Screen')),
      body : Center(
        child : ElevatedButton(
          child: Text(' Go to second screen'),
          onPressed: (){
            Navigator.pushNamed(context, '/second');
          },
        ),
      ),
    );
  }
}
class secondScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is teh secondd screen....'),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Go to first Screen'),
              onPressed: (){
                Navigator.pop(context);
              }
            )
          ],
        ),
      ),
    );
  }
}