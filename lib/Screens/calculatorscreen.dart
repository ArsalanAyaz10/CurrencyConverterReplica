import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _currentInput = '';
  String _operator = '';
  num _firstOperand = 0;
  num _secondOperand = 0;
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildDisplay(),
          const Divider(height: 1, color: Colors.grey),
          _buildButtonGrid(),
        ],
      ),
    );
  }

  Widget _buildDisplay() {
    return Expanded(
      flex: 2,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.centerRight,
        color: Colors.white,
        child: Text(
          _currentInput.isEmpty ? _result : _currentInput,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }

  Widget _buildButtonGrid() {
    return Expanded(
      flex: 4,
      child: Container(
        color: const Color.fromARGB(255, 237, 252, 255),
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          itemCount: 20,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 8,
            crossAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            final buttonValue = _getButtonValue(index);
            return _buildButton(buttonValue);
          },
        ),
      ),
    );
  }

  dynamic _getButtonValue(int index) {
    const values = [
      'C', Icon(Mdi.percent), Icon(Icons.backspace_outlined), '÷',
      '7', '8', '9', '*',
      '4', '5', '6', '-',
      '1', '2', '3', '+',
      '00', '0', '.', '='
    ];
    return values[index];
  }

  Widget _buildButton(dynamic value) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onPressed: () => _handleInput(value),
      child: value is Icon ? value : Text(value.toString()),
    );
  }

  void _handleInput(dynamic input) {
    setState(() {
      if (input is String) {
        if (_isOperator(input)) {
          _operatorPress(input);
        } else if (input == 'C') {
          _clearScreen();
        } else if (input == '=') {
          _calculateResult();
        } else {
          _onDigitPress(input);
        }
      } else if (input is IconData) {
        if (input == Icons.backspace_outlined) {
          _handleBackspace();
        } else if (input == Mdi.percent) {
          _handlePercentage();
        } else if (input == Icons.access_alarm) {
          _handleReminder();
        }
      }
    });
  }

  bool _isOperator(String input) {
    return ['+', '-', '*', '÷'].contains(input);
  }

  void _onDigitPress(String digit) {
    _currentInput += digit;
  }

  void _clearScreen() {
    _currentInput = '';
    _operator = '';
    _firstOperand = 0;
    _secondOperand = 0;
    _result = '';
  }

  void _handleBackspace() {
    if (_currentInput.isNotEmpty) {
      _currentInput = _currentInput.substring(0, _currentInput.length - 1);
    }
  }

  void _operatorPress(String operator) {
    _firstOperand = double.parse(_currentInput);
    _operator = operator;
    _currentInput = '';
  }

  void _calculateResult() {
    _secondOperand = double.parse(_currentInput);

    switch (_operator) {
      case '+':
        _result = (_firstOperand + _secondOperand).toString();
        break;
      case '-':
        _result = (_firstOperand - _secondOperand).toString();
        break;
      case '*':
        _result = (_firstOperand * _secondOperand).toString();
        break;
      case '÷':
        _result = (_firstOperand / _secondOperand).toStringAsFixed(2);
        break;
      default:
        _result = 'Error';
    }

    _currentInput = _result;
    _operator = '';
  }

  void _handlePercentage() {
    if (_currentInput.isNotEmpty) {
      _currentInput = (double.parse(_currentInput) / 100).toString();
    }
  }

  void _handleReminder() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Reminder"),
          content: const Text("This is your reminder!"),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}