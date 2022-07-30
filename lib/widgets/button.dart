import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text ;
  final int color;
  final Function? callBack;
  const Button({this.text: '', this.color: 0, this.callBack });
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 24, color: Colors.blueAccent),
        onPrimary: Colors.black, primary: Color(color)  );
    return Container(
      child: SizedBox(height: 70, width: 70,
              child: ElevatedButton(
              style: style,
              onPressed: () => callBack!(text),
              child: Text('$text'),
            ),
              ),
    );
  }
}