import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              color: const Color(0x71717187),
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
                    child: CalcButton(key),
                  );
                }).toList(),
              ),
            )
        )
    );
  }
}

// キーボタン
class CalcButton extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final _key;
  // ignore: use_key_in_widget_constructors
  const CalcButton(this._key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Center(
        child: Text(
          _key,
          style:  TextStyle(fontSize: 46.0.sp),
        ),
      ),
      onPressed: (){
      },
    );
  }
}
