import 'package:flutter/material.dart';
import 'widtdrawn.dart';
import 'deposit.dart';

// ignore: must_be_immutable

  
class Balance extends StatefulWidget {

  Balance(
      {Key? key,ba })
      : super(key: key);


  @override
  State<Balance> createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  double wh = 0 , total =0 , ba = 0;

    TextEditingController _deposit = TextEditingController();

    TextEditingController _widtdrawn = TextEditingController();

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
             Icons.account_circle,
             color: Color(0xff5ac18e),
           ),
           hintText: 'จำนวนถอน',
           hintStyle: TextStyle(
             color: Colors.black38
           )
         ),
       ), 
      )

    ],

  );
}

Widget buildsubmit(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: RaisedButton(
      onPressed: (){
        setState(() {
             ba = (ba + double.parse(_deposit.text));
           });
         },
    
      padding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      color: Colors.white,
      child: Text(
        'ยืนยัน',
        style: TextStyle(
          color: Color(0xff5ac18e),
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
      ),

      ),

  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deposit'),
      ),
      body: Center(
        child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 80
                ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                    child: ListTile(
                    title: Text("Your Balance "),
                    subtitle: Text(ba.toString(),
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold),),
                  ),
                ),

                    SizedBox(height: 10),
                    SizedBox(height: 10),
                    buildDepo(context),
                   
                    SizedBox(height: 10),
                    buildsubmit(context)
                
        
                  

    
                  
                 

                  
                
                  
              ],
            ),
          ),
        ),
      ),
    ),);
      
    
  }
}
