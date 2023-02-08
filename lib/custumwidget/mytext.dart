import 'package:flutter/cupertino.dart';

class NormalTextWidget extends StatelessWidget{
  final String textName;
  final Color? textColor;
  final double textFontSize;


  const NormalTextWidget({super.key, required this.textName,  this.textColor, required this.textFontSize});
  @override
  Widget build(BuildContext context) {

    return Text(
        textName,
        style: TextStyle(color: textColor,fontSize: textFontSize,fontWeight: FontWeight.bold)


    );
  }

}