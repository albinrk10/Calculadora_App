import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState()) {
    //borrar todo
    on<ResetAC>((event, emit) {
      emit(CalculatorState(
        firstNumber: '0',
        mathResult: '0',
        secondNumber: '0',
        operation: '+',
      ));
    });
    //agregar numero
    on<AddNumber>((event, emit) {
      emit(state.copyWith(
        mathResult: state.mathResult == '0'
            ? event.number
            : state.mathResult + event.number,
      ));
      
    });
    //cambiar signi  de + a -
    on<ChangeNegativePositive>((event, emit) {
      emit(state.copyWith(
        mathResult: state.mathResult.contains('-')
            ? state.mathResult.replaceFirst('-', '')
            : '-${state.mathResult}',
      ));
    });
    //borrar ultimo numero
    on<DeleteLastEntry>((event, emit) {
      if (state.mathResult.length > 1) {
        emit(state.copyWith(
          mathResult: state.mathResult.substring(0, state.mathResult.length - 1),
        ));
      } else {
        emit(state.copyWith(
          mathResult: '0',
        ));
      }
    });
    //agregar operacion
    on<OperationEntry>((event, emit) {
      emit(state.copyWith(
        firstNumber: state.mathResult,
        mathResult: '0',
        operation: event.operation,
        secondNumber: '0',
      ));
    });
    //calcular resultado
    on<CalculateResult>((event, emit) {
      final num firstNumber = num.parse(state.firstNumber);
      final num secondNumber = num.parse(state.mathResult);
      switch (state.operation) {
        case '+':
          emit(state.copyWith(
            secondNumber: state.mathResult,
            mathResult: '${firstNumber + secondNumber}',
          ));
          break;
        case '-':
          emit(state.copyWith(
            secondNumber: state.mathResult,
            mathResult: '${firstNumber - secondNumber}',
          ));
          break;
        case 'X':
          emit(state.copyWith(
            secondNumber: state.mathResult,
            mathResult: '${firstNumber * secondNumber}',
          ));
          break;
        case '/':
          emit(state.copyWith(
            secondNumber: state.mathResult,
            mathResult: '${firstNumber / secondNumber}',
          ));
          break;
      }
    });
  }
}
