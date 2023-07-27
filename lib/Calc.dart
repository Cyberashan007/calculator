
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';
class calc extends StatefulWidget {
  const calc({super.key});

  @override
  State<calc> createState() => _calcState();
}

class _calcState extends State<calc> {
  List buttons= [
    '7','8','9','/',
    '4','5','6','*',
    '1','2','3','-',
    'C','0','=','+'
  ];
  double? evalExpression(String expression){
try {
  Parser p=Parser();
Expression exp=p.parse(expression);
// contextModel
}catch(e){
  print('ERROR:$e');
}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('CALCULATOR ',style: TextStyle(fontSize: 25,color: Colors.black87,fontWeight: FontWeight.bold),),
      backgroundColor: Colors.grey,
      ),

      backgroundColor: Colors.black12,
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              child: Text('0',style: TextStyle(fontSize: 62,color: Colors.grey),),
            ),
          ),
          Divider(),
          Expanded(
            flex: 2,
            child: Container(

              child: GridView.builder(
                  itemCount: 16,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),itemBuilder: (context,index){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.grey,shape:OvalBorder()),
      onPressed: (){},child: Text(buttons[index],style: TextStyle(fontSize: 45,color: Colors.black87),)),
    );
              }),
            ),
          )
        ],
      ),
    );
  }
}
