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

//main()関数があって、MyAppをスクリーンに表示するように書かれています。MyAppはクラスで名前は何でもいいです。
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  //コンストラクタ に key が渡されています。
  // MyApp の stateless ウィジェットで title を渡していますが、key はデフォルトでユニークなものが渡されます。
  //「: super(key: key)」について
  // Redirecting constructors と呼ばれる手法で、別のコンストラクタの処理を追加で行なっています。親クラスにもキーを渡しているんですね。
  @override
  Widget build(BuildContext context) {
    //引数に context が呼ばれています。
    // この context の中にどこでどういう風に作成されたかの情報を含んでいます。
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

