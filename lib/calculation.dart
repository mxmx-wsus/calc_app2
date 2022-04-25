const List<String> _checkOperator = ['+','-','×','÷'];

class CalcSystem {
  static final List<double> _number = [];
  static final List<String>  _op = [];
  static String _numberBuffer = '';
  static double _result = 0.0;

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
      //1項目を「_result」とし、これに「_number」を計算していく
      _result = _number[0];
      for (int i = 0; i < _op.length; i + 1 ){
        if (_op[i] == '+'){
          _result += _number[i + 1];
        }
        else if (_op[i] == '-'){
          _result -= _number[i + 1];
        }
        else if (_op[i] == '×'){
          _result *= _number[i + 1];
        }
        else if (_op[i] == '÷'){
          _result /= _number[i + 1];
        }
      }
      return _result.toString();
  }
}

