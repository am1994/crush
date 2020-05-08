
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'questions.dart';


class ResultPage extends StatefulWidget {
  final int yes;
  final int no;
  final int donKnow;

  const ResultPage({
    @required this.yes,
    @required this.no,
    @required this.donKnow  }):
      assert(yes != null),
      assert(no != null),
      assert(donKnow != null);


  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  var map = { '000': 'He/She loves you',
              '001': 'He/She does not want you',
              '002': 'He/She in love with you',
              '010':'He/She wants to propose you',
              '011':'He/She is He/She jealous of you',
              '012':'He/She wants to forget you',
              '020':'you will break out',
              '021':'He/She wants another girl',
              '022':'He/She does not love you',
              '100':'He/She does not want anyone to be close to you',
              '101':'He/She hates you',
              '102':'He/She likes whatever you like',
              '110':'He/She Adores you',
              '111':'He/She likes you as a sister',
              '112':'He/She will not talk with you',
              '120':'He/She likes your personality',
              '121':'He/She does not want anything from you',
              '122':'He/She dies in you',
              '200':'He/She does not hate you',
              '201':'you wil quarrel',
              '202':'He/She wants you to be friend with benefits',
              '210':'He/She does not like your logic',
              '211':'He/She wants to marry you',
              '212':'He/She not ready for a serious relationship',
              '220':'He/She lies to you',
              '221':'He/She deos not want to part from you',
              '222':'He/She deos not want to get away from you'};

  int resultYes;
   int resultNo;
   int  resultDonKnow;
   String result;


   @override
   void initState() {
     super.initState();
     resultNo = widget.yes % 3;
     resultYes = widget.no % 3;
     resultDonKnow = widget.donKnow % 3;
     result = "$resultDonKnow"+"$resultNo"+"$resultYes";
      print("$result");

      var index=0;
     var entryList = map.entries.toList();
     while(index < entryList.length) {
       if(result == entryList[index].key){
         result = entryList[index].value;
       }
       index ++;
     }
   }



  @override
  Widget build(BuildContext context) {
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
            Text("Result",style: TextStyle(fontFamily: 'Pacifico',
              color:Color(0xFFEE507A),fontSize: 80,fontWeight: FontWeight.bold),),
            Card(
                   color: Colors.white ,
                   margin: EdgeInsets.all(15.0),
                   
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0), ), 
             child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 35.0),
                  child: Text("  $result ",
                  style: TextStyle(fontFamily: 'Source Sans Pro',
                  color:Color(0xFFEE507A),fontSize: 18,fontWeight: FontWeight.bold),)),
            ),
            SizedBox(height: 20.0,),
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

            child: Icon(Icons.arrow_back,color: Colors.white,size:60,),
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