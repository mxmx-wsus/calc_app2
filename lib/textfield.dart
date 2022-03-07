import 'package:flutter/material.dart';


//==============================================================================
// 表示
class MainDisplay extends StatelessWidget {
  const MainDisplay({Key? key}) : super(key : key);

      final String _displayController = '1+1';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
          alignment: Alignment.centerRight,
          child: Text(
              _displayController,
              style: const TextStyle(
                fontSize: 64.0,
              ),
            ),
          ),
    );
  }
}