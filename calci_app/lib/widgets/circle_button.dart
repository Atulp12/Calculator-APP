import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function onClickbtn;

  CircleButton(this.text,this.color,this.onClickbtn);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
                      height: 50,
                      width: 50,
                      child: TextButton(
                        onPressed: () => onClickbtn(text),
                        style: TextButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: color,
                            foregroundColor: Colors.white,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            surfaceTintColor: Colors.white70
                            ),
                        child:Text(
                          text,
                          style: TextStyle(fontSize: 25,fontFamily: 'RobotoCondensed'),
                        ),
                      ),

  );
  }
}