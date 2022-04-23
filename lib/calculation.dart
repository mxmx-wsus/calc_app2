const List<String> _checkOperator = ['+','-','×','÷'];

class CalcSystem {
  static final List<double> _number = [];
  static final List<String>  _op = [];
  static String _numberBuffer = '';
  static const double _result = 0.0;

  static void getKey(String letter) {
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
      //最後に入力された数字を「_number」に格納する。
      _number.add(double.parse(_numberBuffer));
      //もし「_number」が空っぽだったら「0」を返す。
      if (_number.isEmpty){
        return '0';
      }
      //TODO for文とif文を使用し、計算処理をきさいする。
      return _result.toString();
  }
}

