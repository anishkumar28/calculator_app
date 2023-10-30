import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title,});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {

  String output = '0';
  String _output = '00';
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  buttonPressed(String buttonText){
    if(buttonText == "C"){
      _output = '0';
      num1 = 0;
      num2 = 0;
      operand = '';
    } else if(buttonText == '+' || buttonText == '-' || buttonText == '×' || buttonText == '/'){
      num1 = double.parse(output);
      operand = buttonText;
      _output = '0';
    }else if(buttonText == '.'){
      if(_output.contains('.')){
      }
      else{
        _output = _output + buttonText;
      }
    }
    else if(buttonText == '='){
      num2 = double.parse(output);
      if(operand == '+' ){
        _output = (num1 + num2).toString();
      }
      if(operand == '-' ){
        _output = (num1 - num2).toString();
      }
      if(operand == '×' ){
        _output = (num1 * num2).toString();
      }
      if(operand == '/' ){
        _output = (num1 / num2).toString();
      }
      num1 = 0;
      num2 = 0;
      operand = "";
    }
    else{
      _output = _output + buttonText;
    }
    setState(() {
      output = double.parse(_output).toStringAsFixed(0);
    });
  }

  Widget buildButton(String buttonText){
    return Expanded(
        child: SizedBox(
          height: 90.0,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: OutlinedButton(
              onPressed: () => buttonPressed(buttonText),
              child: Text(
                buttonText,
                style: const TextStyle(
                  color: Colors.pink,
                  fontSize:20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(
          color: Colors.white,
        ),),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(output,
              style: const TextStyle(
                color: Colors.black,
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
          const Expanded(child: Divider(color: Colors.white),),
          Container(
            color: Colors.white70,
            child: Column(
              children: [
                Row(
                  children: [
                    buildButton('7'),
                    buildButton('8'),
                    buildButton('9'),
                    buildButton('/'),
                  ],
                ),
                Row(
                children: [
                  buildButton('4'),
                  buildButton('5'),
                  buildButton('6'),
                  buildButton('×'),
                ],
              ),
                Row(
                  children: [
                    buildButton('1'),
                    buildButton('2'),
                    buildButton('3'),
                    buildButton('-'),
                  ],
                ),
                Row(
                  children: [
                    buildButton('C'),
                    buildButton('0'),
                    buildButton('='),
                    buildButton('+'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

