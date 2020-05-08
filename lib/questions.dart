

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Result.dart';
import 'package:oktoast/oktoast.dart'; 

class LovePage extends StatefulWidget {


  @override
  _LovePageState createState() => _LovePageState();
}

class _LovePageState extends State<LovePage> {

  final _list = <String>[
    "Do you know a boy/girl ?",
    "Do you love him/her ?",
    "Does He/She love you ?",
    "Are you jealous of him/her ?",
    "is He/She jealous of you ?",
    "Did He/She go out with you ?",
    "Did He/she kiss you ?",
    "Did He/She touch your hand ?",
    "Do you know his/her family ?",
    "Does He/She know your family ?",
    "Do you know the size of his/her shoes ?",
    "Does He/She know another girl/boy ?",
    "Is He/She Smiley person ?",
    "Is He/She Beautiful ?",
    "Does He/She  smoke ?",
    "Does He/She drink alcohol ?",
    "Did He/She give you a gift ?",
    "Did you give her/him a gift ?",
    "Did He/She go out with another girl/boy ?",
    "Did you know his/her favorite color ?",
    "Is always He/She looking at you ?",
    "Did you say the truth ?"
  ];
  int question = 0 ;
  int yes=0;
  int no=0;
  int doNotKnow=0;

  final raisedButtonDecoration =  const BoxDecoration(
              shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
              topLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0)
            ), 
              gradient:  LinearGradient(     
                   begin: Alignment.topLeft,
                   end: Alignment(0.8, 0.0),
                colors: [
                   Colors.white,

                  Color(0xFFEE507A),
                  
                ],
              ),);

  @override
  Widget build(BuildContext context) {

    return OKToast(
          child: Scaffold(
            body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/back_img.png"),
              colorFilter: ColorFilter.linearToSrgbGamma(),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              Text(_list[question], style:
              TextStyle(fontFamily: 'Pacifico',color: Color(0xFFEE507A),
                fontSize: 30, fontWeight: FontWeight.normal,),),
              SizedBox( height: 70.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              
                children: <Widget>[
                 
                  RaisedButton(
                   elevation: 20.0,
                      color:  Color(0xFFEE507A),
                       hoverElevation: 8.0,
                       hoverColor: Color(0xFFEE507A),
                       disabledElevation: 0.0,
                     shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45.0),
                      ),
                      padding: EdgeInsets.all(5.0),
                      disabledColor: Colors.transparent,

                    child: Text("YES",style:
                    TextStyle(fontSize: 18,color: Colors.white,
                        fontFamily: 'Pacifico',fontWeight: FontWeight.bold),),
                    onPressed: () { 
                                 setState(() {
                                    yes+=1;
                                 });
                                 changeQuestions(context,1);
                                  
                    }),
                  RaisedButton(
                   elevation: 20.0,
                      color:  Color(0xFFEE507A),
                       hoverElevation: 8.0,
                       hoverColor: Color(0xFFEE507A),
                       disabledElevation: 0.0,
                     shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45.0),
                      ),
                      padding: EdgeInsets.all(5.0),
                      disabledColor: Colors.transparent,
                    child: Text("NO",style:
                    TextStyle(fontSize: 18,color: Colors.white,
                        fontFamily: 'Pacifico',fontWeight: FontWeight.bold),),
                    onPressed: () { 
                                     setState(() {
                                          no+=1;
                                     });
                                   changeQuestions(context,2);
                    }),
                  RaisedButton(
                     elevation: 20.0,
                      color:  Color(0xFFEE507A),
                       hoverElevation: 8.0,
                       hoverColor: Color(0xFFEE507A),
                       disabledElevation: 0.0,
                     shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45.0),
                      ),
                      padding: EdgeInsets.all(5.0),
                      disabledColor: Colors.transparent,  
                    child: Text("I Am Not Sure",style:
                    TextStyle(fontSize: 18,color: Colors.white,
                        fontFamily: 'Pacifico',fontWeight: FontWeight.bold),),
                    onPressed: () { 
                      
                      setState(() {
                         doNotKnow+=1;

                      });
                      changeQuestions(context,3);
                    }
                    
                    ),
                  
                ],

              ),],
          ),
        ),
      ),
    );
  }

  void _showToast() {
    showToast(
      " Tap 'YES' to continue playing :*) ",
      position: ToastPosition.bottom,
      backgroundColor: Color(0xFFEE507A),
      radius: 13.0,
      textStyle: TextStyle(fontSize: 18.0,color: Colors.white),
      animationBuilder: Miui10AnimBuilder(),
    );
  }
  void changeQuestions(BuildContext context,int numBut){
    setState(() {
      
      if( question < (_list.length - 1) ){
           if(question == 0 && numBut != 1){
          
              _showToast();
             }else{
        question +=1;
             }
      }else{
         
        
        Navigator.of(context).push(MaterialPageRoute<Null>(
          builder: (BuildContext context) {
            return Scaffold(
              body: ResultPage(yes: yes,no: no,donKnow: doNotKnow,),
            );
          },
        ));
        }
      

    });

  }


}
