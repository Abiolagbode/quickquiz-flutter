import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase{
    var resultText = "You did it";
    if(resultScore <=1){
      resultText = "You are awesome and innocent";
    }else if(resultScore >= 2){
      resultText = "You are good to go";
    }else{
      resultText = "You are so bad";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
            textAlign: TextAlign.center,
          ),
          FlatButton(child: Text("Restart Quiz"), onPressed: resetHandler,
          color: Colors.blueAccent,),
        ],
      ),
    );
  }
}
