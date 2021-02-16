import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resultHandler;

  Result(this.resultScore,this.resultHandler);
  
   String get resultPhrase {
    String resultText;
    if (resultScore <= 15)
      resultText = 'you are awesome';
    else if (resultScore <= 20)
      resultText = 'you are likable';
    else if (resultScore <= 25)
      resultText = 'you are strange';
    else
      resultText = 'you are bad';
    return resultText;
  }
    @override
  Widget build(BuildContext context) {
    return Center (
      child: Column (
        children:<Widget>[
        Text(
          resultPhrase, 
          style:TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
          textAlign:TextAlign.center,
          ),
          FlatButton(
          child:Text(
            'Restart Quiz!'),
          textColor:Colors.blue,
          onPressed : resultHandler,
          ),
        ],
      ),
    );
  }
}
