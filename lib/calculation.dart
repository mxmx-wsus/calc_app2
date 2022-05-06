import 'text_data.dart';

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
    else if (letter == TextData.clear) {
      _op.clear();
      _number.clear();
      _numberBuffer = '';
    }
    else if (letter == TextData.equal) {
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
      for (int i = 0; i < _op.length; i++ ){
        if (_op[i] ==  TextData.plus){
          _result += _number[ i++ ];
        }
        else if (_op[i] == TextData.minus){
          _result -= _number[ i++ ];
        }
        else if (_op[i] == TextData.mult){
          _result *= _number[ i++ ];
        }
        else if (_op[i] == TextData.div){
          _result /= _number[ i++ ];
        }
      }
      _number.clear();
      _op.clear();
      _numberBuffer = '';

      var resultStr = _result.toString().split('.');
      return resultStr[1] == '0' ? resultStr[0] : _result.toString();
  }
}

