const List<String> _checkOperator = ['+','-','×','÷'];

class CalcSystem {
  static final List<double> _number = [];
  static final List<String>  _op = [];
  static String _numberBuffer = '';

  static void getKey(String letter) {
    //TODO ボタンが入力されたらCalcSystem配列に格納するという内容を記載する。
    if (_checkOperator.contains(letter)) {
      //四則演算子が入力された場合
      _op.add(letter);
      _number.add(double.parse(_numberBuffer));
      _numberBuffer = '';
    }
    else if (letter == 'C') {
      _op.clear();
      _number.clear();
      _numberBuffer = '';
    }
    else if (letter == '=') {
      //returnして以下の計算処理に進む。
      return;
    }
    else {
      //数字が入力された時
      _numberBuffer += letter;
    }
  }
    //計算処理
    static String execute() {
      int result = 0;
      return result.toString();
  }
}

