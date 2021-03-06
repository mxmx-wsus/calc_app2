import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import 'calculation.dart';
import 'text_data.dart';

//==============================================================================
// 表示
//MainDisplayというStatefulWidget（箱）を作ります。
class MainDisplay extends StatefulWidget {
  const MainDisplay({Key? key}) : super(key : key);
  //StatefulWidgetはbuildメソッドを持たず、createStateメソッドを持ち、これがStateクラスを返します。
  //MainDisplayの中に以下の部分で作成するDisplayControllerというクラスを突っ込みます。
  @override
  DisplayController createState() => DisplayController();
}
//DisplayControllerという表示を更新させるためのクラスを作り、上記のMainDisplayという箱に突っ込みます。
//_expressionというString(テキストデータ)出力用の箱を突っ込みます。
class DisplayController extends State<MainDisplay> {
  String _expression = '';
  static final controller = StreamController.broadcast();
//updateTextというボタンが押された時の関数の箱を作る
  void updateText(String letter) {
    setState(() {
      //もし「=」か「C」が押されたら空にする
      if (letter == TextData.clear) {
        _expression = '';
      }
      else if(letter == TextData.equal){
        _expression = '';
        final String ans = CalcSystem.execute();
        controller.sink.add(ans);
      }
      else {
        //上記以外だったら「letter」の値を追記する。
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



  @override
  void initState() {
    super.initState();
    //controllerが動作を確認（Listen）したら内容をみてupdateTextを実行する。
    controller.stream.listen((event) => updateText(event));
    controller.stream.listen((event) => CalcSystem.getKey(event));
  }
  @override
  void dispose() {
    super.dispose();
  }

}
