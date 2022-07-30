import 'package:calculator/widgets/button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double fNum = 0;
  double sNum = 0;
  String history = '';
  String textToDisplay = '';
  String res = '';
  String textRes = '';
  String operations = '';
  bool flag = false;

  void btnOnClick(String btnValue) {
    double a = 2;
    int b = 2;
    double d = ( a * b ).toDouble();
    print(d);
    if (btnValue != '+' &&
        btnValue != "-" &&
        btnValue != "*" &&
        btnValue != "-/+" &&
        btnValue != "/" &&
        btnValue != "<" &&
        btnValue != "=" &&
        btnValue != "X") {
      setState(() {
        textToDisplay += btnValue;
        textRes += btnValue;
       });
    } else if (btnValue == '-' || btnValue == 'X' || btnValue == '/' || btnValue == '+'){
      setState(() {
      textRes += btnValue;
      });
    }

    if (btnValue == 'C') {
      textToDisplay = '';
      textRes = '';
      fNum = 0;
      sNum = 0;
      res = '';
    } else if (btnValue == '-/+') {
      if (textToDisplay != '') {
        if (textToDisplay[0] != '-') {
          textToDisplay = '-' + textToDisplay;
        } else {
          textToDisplay = textToDisplay.substring(1);
        }
        setState(() {
          textToDisplay = textToDisplay;
        });
      }
    }else if (btnValue == '<') {
      setState(() {
        if (textToDisplay != '' && history != '') {
            textToDisplay = textToDisplay.substring(0, textToDisplay.length - 1);
            res = res.substring(0, res.length - 1);
        }
      });
    
    }else if (btnValue == 'AC') {
      textRes = '';
      textToDisplay = '';
      fNum = 0;
      sNum = 0;
      res = '';
      history = '';
    }else if (btnValue == '+' ||
        btnValue == '-' ||
        btnValue == 'X' ||
        btnValue == '/') {
      fNum = double.parse(textToDisplay);
      textToDisplay = '';
      res = '';
      operations = btnValue;
    } else if (btnValue == '=') {
      sNum = double.parse(textToDisplay);
      if (operations == '+') {
        res = (fNum + sNum).toString();
        textToDisplay = res;
        history = fNum.toString() + operations.toString() + sNum.toString() + btnValue.toString() + res.toString();
      } else if (operations == '-') {
        res = (fNum - sNum).toString();
        textToDisplay = res;
        history = fNum.toString() + operations.toString() + sNum.toString() + btnValue.toString() + res.toString();
      } else if (operations == 'X') {
        res = (fNum * sNum).toString();
        textToDisplay = res;
        history = fNum.toString() + operations.toString() + sNum.toString() + btnValue.toString() + res.toString();
      } else if (operations == '/') {
        res = (fNum / sNum).toString();
        textToDisplay = res;
        history = fNum.toString() + operations.toString() + sNum.toString() + btnValue.toString() + res.toString();
      }
      setState(() {
        textToDisplay = res;
        if (btnValue != '='){
        textRes += btnValue;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.blueGrey,
          // appBar: AppBar(backgroundColor: Colors.orange[50]),

          body: Padding(
            padding:
                const EdgeInsets.only(top: 50.0, left: 5, bottom: 5, right: 5),
            child: Container(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(history,
                          style: const TextStyle(
                              fontSize: 24, color: Color(0x66FFFFFF))),
                    ),
                    
                    alignment: const Alignment(1.0, -1.0)),
                    Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(textRes,
                          style: const TextStyle(
                              fontSize: 24, color: Color(0x66FFFFFF))),
                    ),
                    
                    alignment: const Alignment(1.0, 1.0)),
                Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Text(textToDisplay, style: const TextStyle(fontSize: 48)),
                    ),
                    alignment: const Alignment(1.0, 1.0)),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  thickness: 1.25,
                  color: Colors.black87,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button(text: 'AC', color: 0xFFf4d160, callBack: btnOnClick),
                    Button(
                      text: 'C',
                      color: 0xFFf4d160,
                      callBack: btnOnClick,
                    ),
                    Button(text: '<', color: 0xFFf4d160, callBack: btnOnClick),
                    Button(text: '/', color: 0xFFf4d160, callBack: btnOnClick)
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button(
                      text: '9',
                      color: 0xFF8ac4d0,
                      callBack: btnOnClick,
                    ),
                    Button(text: '8', color: 0xFF8ac4d0, callBack: btnOnClick),
                    Button(text: '7', color: 0xFF8ac4d0, callBack: btnOnClick),
                    Button(text: 'X', color: 0xFFf4d160, callBack: btnOnClick)
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button(text: '6', color: 0xFF8ac4d0, callBack: btnOnClick),
                    Button(text: '5', color: 0xFF8ac4d0, callBack: btnOnClick),
                    Button(text: '4', color: 0xFF8ac4d0, callBack: btnOnClick),
                    Button(text: '-', color: 0xFFf4d160, callBack: btnOnClick)
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button(text: '1', color: 0xFF8ac4d0, callBack: btnOnClick),
                    Button(text: '2', color: 0xFF8ac4d0, callBack: btnOnClick),
                    Button(text: '3', color: 0xFF8ac4d0, callBack: btnOnClick),
                    Button(text: '+', color: 0xFFf4d160, callBack: btnOnClick)
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button(
                        text: '-/+', color: 0xFFf4d160, callBack:  btnOnClick),
                    Button(text: '0', color: 0xFFf4d160, callBack: btnOnClick),
                    Button(text: '.', color: 0xFFf4d160, callBack: btnOnClick),
                    Button(text: '=', color: 0xFFf4d160, callBack: btnOnClick)
                  ],
                ),
              ]),
            ),
          ),
        ));
  }
}
