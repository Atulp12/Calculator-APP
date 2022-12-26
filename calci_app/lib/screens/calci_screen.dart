import 'package:calci_app/widgets/circle_button.dart';
import 'package:flutter/material.dart';

class CalciScreen extends StatefulWidget {
  @override
  State<CalciScreen> createState() => _CalciScreenState();
}

class _CalciScreenState extends State<CalciScreen> {

  int first = 0;
  int second = 0;
  String history = '';
  String textTodisplay = '';
  String res = '';
  String operation = '';

  void onClickbtn(String btnVal) {
    if (btnVal == 'C') {
      textTodisplay = '';
      first = 0;
      second = 0;
      res = '';
    } else if (btnVal == 'AC') {
      textTodisplay = '';
      first = 0;
      second = 0;
      res = '';
      history = '';
    }else if (btnVal == '+/-'){
      if(textTodisplay[0] != '-'){
        res = '-$textTodisplay';
      }
      else{
        res = textTodisplay.substring(1);
      }
    }
     else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == 'x' ||
        btnVal == '÷') {
      first = int.parse(textTodisplay);
      res = '';
      operation = btnVal;
    } else if (btnVal == '=') {
      second = int.parse(textTodisplay);
      if (operation == '+') {
        res = (first + second).toString();
        history = first.toString() + operation.toString() + second.toString();
      }
      if (operation == '-') {
        res = (first - second).toString();
        history = first.toString() + operation.toString() + second.toString();
      }
      if (operation == 'x') {
        res = (first * second).toString();
        history = first.toString() + operation.toString() + second.toString();
      }
      if (operation == '÷') {
        res = (first / second).toString();
        history = first.toString() + operation.toString() + second.toString();
      } 
    }
    else {
        res = int.parse(textTodisplay + btnVal).toString();
      }

    setState(() {
      textTodisplay = res;
    });
      
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text(
      //     'Calci',
      //     style: TextStyle(
      //         fontSize: 25, fontFamily: 'Raleway', fontWeight: FontWeight.bold),
      //   ),
      //   backgroundColor: Colors.black12,
      // ),
      body: Column(
        children: [
          Container(
            height: size.height * 0.33,
            padding: const EdgeInsets.all(20),
            // margin: EdgeInsets.all(10),
            alignment: AlignmentDirectional.bottomEnd,
            child: Text(history,style: const TextStyle(fontSize: 20,fontFamily: 'RobotoCondensed',color: Colors.white30),),
          ),
          Container(
            height: size.height * 0.10,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(10),
            alignment: AlignmentDirectional.bottomEnd,
            child: Text(textTodisplay,style: const TextStyle(fontSize: 35,fontFamily: 'RobotoCondensed'),)
          ),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            crossAxisSpacing: 8,
            padding: const EdgeInsets.all(12),
            children: [
              CircleButton('AC', Colors.blue,onClickbtn),
              CircleButton('C', Colors.blue,onClickbtn),
              CircleButton('+/-', Colors.blue,onClickbtn),
              CircleButton('÷', Colors.blue,onClickbtn),
              CircleButton('7', Colors.black54,onClickbtn),
              CircleButton('8', Colors.black54,onClickbtn),
              CircleButton('9', Colors.black54,onClickbtn),
              CircleButton('x', Colors.blue,onClickbtn),
              CircleButton('4', Colors.black54,onClickbtn),
              CircleButton('5', Colors.black54,onClickbtn),
              CircleButton('6', Colors.black54,onClickbtn),
              CircleButton('-', Colors.blue,onClickbtn),
              CircleButton('1', Colors.black54,onClickbtn),
              CircleButton('2', Colors.black54,onClickbtn),
              CircleButton('3', Colors.black54,onClickbtn),
              CircleButton('+', Colors.blue,onClickbtn),
              CircleButton('%', Colors.black54,onClickbtn),
              CircleButton('0', Colors.black54,onClickbtn),
              CircleButton('.', Colors.black54,onClickbtn),
              CircleButton('=', Colors.green,onClickbtn),
            ],
          ),
        ],
      ),
    );
  }
}
