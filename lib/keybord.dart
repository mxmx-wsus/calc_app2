import 'package:flutter/material.dart';

//==============================================================================
// キーボード
class CalcKeyboard extends StatelessWidget {
  const CalcKeyboard({Key? key}) : super(key : key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Center(
            child: Container(
              color: const Color(0xff87cefa),
              child: GridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: 3.0,
                crossAxisSpacing: 3.0,
                children: [
                  '7', '8', '9', '÷',
                  '4', '5', '6', '×',
                  '1', '2', '3', '-',
                  'C', '0', '=', '+',
                ].map((key) {
                  return GridTile(
                    child: Button(key),
                  );
                }).toList(),
              ),
            )
        )
    );
  }
}

// キーボタン
class Button extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final _key;
  // ignore: use_key_in_widget_constructors
  const Button(this._key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Center(
        child: Text(
          _key,
          style: const TextStyle(fontSize: 46.0),
        ),
      ),
      onPressed: (){
      },
    );
  }
}
