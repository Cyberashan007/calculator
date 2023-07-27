
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
  String _input = '';
  double _result=0.0;
  void _onBtPressed(String buttonText){
    setState(() {
      if(buttonText=='C'){
        _input = '';
        _result = 0.0;
      }
      else if(buttonText == '='){
        try {
          _result = evalExpression(_input);
          _input =_result.toString();
        }
        catch (e){
          _input = 'Error';
        }
      }
      else{
        _input += buttonText;
      }
    });
  }
  double evalExpression(String expression){
try {
  Parser p=Parser();
Expression exp=p.parse(expression);
ContextModel cm = ContextModel();
double evalResult = exp.evaluate(EvaluationType.REAL, cm);
return double.parse(evalResult.toStringAsFixed(2));
// contextModel
}catch(e){
 throw Exception("Invalied Expression");
}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('CALCULATOR ',style: TextStyle(fontSize: 25,color: Colors.black87,fontWeight: FontWeight.bold),),
      backgroundColor: Colors.grey,
      ),

      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              child: Text(_input,style: TextStyle(fontSize: 62,color: Colors.grey),),
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
      onPressed: (){_onBtPressed(buttons[index]);},child: Text(buttons[index],style: TextStyle(fontSize: 45,color: Colors.black),)),
    );
              }),
            ),
          )
        ],
      ),
    );
  }
}
