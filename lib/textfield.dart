import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';


//==============================================================================
// 表示
//MainDisplayというStatefulWidget（箱）を作ります。
class MainDisplay extends StatefulWidget {
  const MainDisplay({Key? key}) : super(key : key);
  //StatefulWidgetはbuildメソッドを持たず、createStateメソッドを持ち、これがStateクラスを返します。
  DisplayController createState() => DisplayController();
}
//DisplayControllerという表示を更新させるためのクラスを作り、上記のMainDisplayという箱に突っ込みます。
//_expressionというString(テキストデータ)出力用の箱を突っ込みます。
class DisplayController extends State<MainDisplay> {
  String _expression = '';
//updateTextというボタンが押された時の関数の箱を作る
  void updateText(String letter) {
    setState(() {
      if (letter == '=' || letter == 'C') {
        _expression = '';
      } else {
        _expression += letter;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        alignment: Alignment.centerRight,
        child: Text(
          _expression,
          style: TextStyle(
            fontSize: 64.0.sp,
          ),
        ),
      ),
    );
  }

  static final controller = StreamController<String>();

  @override
  void initState() {
    controller.stream.listen((event) => updateText(event));
  }
}

