// 他ファイルとの紐付け
//「material.dart」は、マテリアルデザインのUIがまとめられたパッケージです
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'keybord.dart';
import 'text_data.dart';
import 'textfield.dart';

// main関数とはアプリの1番初めに呼び出される関数で、main関数で書いたコードが順に実行されます。
// runApp関数でWidgetツリーの始まり（root）となるWidgetを指定できます。
// このコードではMyAppをWidgetツリーの始まりとしています。
// Arrow関数を使えば、main関数とrunApp関数のコードを1行にまとめることができます。
// 例：void main() => runApp(MyApp());
void main() {
  runApp(const MyApp());
}

// ここのMyAppがアプリ本体となるが「StatelessWidget」はbuild関数が必要。
// StatelessWidgetに必要なbuild関数をオーバーライドし、
// MaterialAppインスタンスをreturnします。
// MaterialAppに用意されている、「home」に実際にアプリ内に表示するWidgetを設定します。
// 今回はScaffoldという、一般的なデザインの土台となるWidgetを使用しています。
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () => MaterialApp(
      home: Scaffold(
        // Scaffold内にappBarやbodyなどの箱を作成する。
          appBar: AppBar(
            title: const Text(TextData.appTitle),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              MainDisplay(),
              CalcKeyboard(),
            ],
          ),
      ),
    )
    );
  }
  }

