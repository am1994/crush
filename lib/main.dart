
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'questions.dart';

void main() {
  return runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),);
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
        final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration:  const BoxDecoration(
  
             gradient:  LinearGradient(     
                  begin: Alignment.topLeft,
                  end: Alignment(0.8, 0.0),
               colors: [
                 Color(0xFFFFF9C4),
                 Color(0xFFFFCDD2),
               ],
             ),),
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         
         children: <Widget>[
           Image.asset("assets/heart.png",width: 300.0,),
           Text("Crush",style: TextStyle(color:Color(0xFFEE507A),fontSize: 80,
                   fontWeight: FontWeight.bold,fontFamily: 'Pacifico',
                 shadows: <Shadow>[
                    Shadow(
                      offset: Offset(10.0, 10.0),
                      blurRadius: 8.0,
                       color: Colors.white,
          
           ),
                 ],
                 ),),
           SizedBox(height: 15.0,),
        RaisedButton(
          elevation: 20.0,
          color:  Color(0xFFEE507A),
          hoverElevation: 8.0,
          hoverColor: Color(0xFFEE507A),
          disabledElevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(45.0),
          ),
          disabledColor: Colors.transparent,

          child: Icon(Icons.arrow_forward,color: Colors.white,size:60,),
          onPressed: () => navigateToQuestions(context),),

         ],
      ),
      ),
    );
  }
  void navigateToQuestions(BuildContext context){
      Navigator.of(context).push(MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return Scaffold(
            body: LovePage(),
          );
        },
      ));
  }
}
