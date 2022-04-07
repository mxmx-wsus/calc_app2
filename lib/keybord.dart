import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'textfield.dart';
//==============================================================================
// キーボード
class CalcKeyboard extends StatelessWidget {
  const CalcKeyboard({Key? key}) : super(key : key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: AspectRatio(
          aspectRatio:  1 / 1 ,
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),  //スクロール禁止
                crossAxisCount: 4,  //横に４列並べます
                children: [
                  '7', '8', '9', '÷',
                  '4', '5', '6', '×',
                  '1', '2', '3', '-',
                  'C', '0', '=', '+',
                ].map((keyWord) {
                  return GridTile(
                    child: CalcButton(keyWord),
                  );
                }).toList(),
              ),

        )
    );
  }
}
// キーボタン
class CalcButton extends StatelessWidget {
  final String _keyWord;
  const CalcButton(this._keyWord, {Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Center(
        child: Text(
          _keyWord,
          style:  TextStyle(fontSize: 46.0.sp),
        ),
      ),
      onPressed: (){
        //ボタンが押されたら「textfield.dart」のDisplauControllerに「_keyWord」を追加する。
        DisplayController.controller.sink.add(_keyWord);
      },
    );
  }
}
