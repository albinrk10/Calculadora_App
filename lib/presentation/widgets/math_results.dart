import 'package:calculadora/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/controlles.dart';

class MathResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final calculatorCtrl = Get.find<CalculatorController>();

    return Obx(() => Column(
          children: [
            SubResult(text: '${calculatorCtrl.firstNumber}'),
            SubResult(text: '${calculatorCtrl.operation}'),
            SubResult(text: '${calculatorCtrl.secondNumber}'),
            LineSeparator(),
            MainResultText(text: '${calculatorCtrl.mathResult}'),
          ],
        ));
  }
}
