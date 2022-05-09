import 'dart:io';

import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'Balance.dart';
import 'deposit.dart';


class registerscreen extends StatefulWidget {
  const registerscreen({ Key? key }) : super(key: key);

  @override
  _registerscreenState createState() => _registerscreenState();
}




class _registerscreenState extends State<registerscreen> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _ID = TextEditingController();
  TextEditingController _GPA = TextEditingController();
  TextEditingController _Gradua = TextEditingController();
  TextEditingController _cer = TextEditingController();
  TextEditingController _deposit = TextEditingController();
  TextEditingController _widtdrawn = TextEditingController();
  String _choose1 = '' ;
  String _choose2 = '';
  String _choose3 = '';
  String _choose4 = '';
  double ba = 0;
  late String depo;
  
Widget buildUsername(BuildContext context){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[

      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0,2)
            )
          ]
        ),
       height: 60,
       child: TextField(
         controller: _name,
         keyboardType: TextInputType.number,
         style: TextStyle(
           color: Colors.black87
         ),
         decoration: InputDecoration(
           border: InputBorder.none,
           contentPadding: EdgeInsets.only(top: 14),
           prefixIcon: Icon(
             Icons.account_circle,
             color: Color(0xff5ac18e),
           ),
           hintText: 'จำนวนเงินฝาก',
           hintStyle: TextStyle(
             color: Colors.black38
           )
         ),
       ), 
      )

    ],

  );
}



Widget buildBtn(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: RaisedButton(
      onPressed: (){setState(() {
             ba = (ba + double.parse(_deposit.text));
           });
         },
     
      padding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      color: Colors.white,
      child: Text(
        'ฝากเงิน',
        style: TextStyle(
          color: Colors.pink,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
      ),

      ),

  );
}

Widget buildBtn2(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: RaisedButton(
      onPressed: (){
        setState(() {
             ba = (ba - double.parse(_deposit.text));
             if (ba < 0){
              throw Exception('fail to widtdrawn you not have enough money');
              AlertDialog alert = AlertDialog(
              title: Text("คุณมีเงินคงเหลือไม่เพียงพอ"),
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                return alert;
                },
              );
          }else{
              print('ถอนเงินจากบัญชี');
            }
           });
         },


     
      padding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      color: Colors.white,
      child: Text(
        'ถอนเงิน',
        style: TextStyle(
        color: Colors.pink,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
      ),

      ),

  );
}

  Widget buildDepo(BuildContext context){
   return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[

      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0,2)
            )
          ]
        ),
       height: 60,
       child: TextField(
         controller: _deposit,
         keyboardType: TextInputType.number,
         style: TextStyle(
           color: Colors.black87
         ),
         decoration: InputDecoration(
           border: InputBorder.none,
           contentPadding: EdgeInsets.only(top: 14),
           prefixIcon: Icon(
             Icons.attach_money_sharp,
           ),
           hintText: 'จำนวนเงิน',
           hintStyle: TextStyle(
             color: Colors.black38
           )
         ),
       ), 
      )

    ],

  );
}

  Widget buildWidt(BuildContext context){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[

      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0,2)
            )
          ]
        ),
       height: 60,
       child: TextField(
         controller: _widtdrawn,
         keyboardType: TextInputType.number,
         style: TextStyle(
           color: Colors.black87
         ),
         decoration: InputDecoration(
           border: InputBorder.none,
           contentPadding: EdgeInsets.only(top: 14),
           prefixIcon: Icon(
             Icons.attach_money_sharp,
             color: Color(0xff5ac18e),
           ),
           hintText: 'จำนวนเงินถอน',
           hintStyle: TextStyle(
             color: Colors.black38
           )
         ),
       ), 
      )

    ],

  );
}


  @override



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('ATM'),
        
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Center(
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container( 
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration( 
                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 80
                ),
  

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    Container(
                       margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                       height: 150,
                       width: 400,
                       padding: const EdgeInsets.all(20),
                    child: ListTile(
                    title: Text("Your Balance \n"),
                    subtitle: Text(ba.toString(),
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold),
                    
                    ),
                  ),
                      color: Colors.white,
                      
                      ),

                  
                  

                    SizedBox(height: 10),
                    buildDepo(context),
                    SizedBox(height: 10),
                    buildBtn(context),

                    buildBtn2(context)
                  ],
                ),
              ),
              )],

          ),
        ),

      ),
      ),
    );
  }
}



