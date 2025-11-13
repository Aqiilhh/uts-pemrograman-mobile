import 'package:flutter/material.dart';
import 'dart:math'; // Untuk fungsi akar (sqrt)
import 'package:uts/widgets/kalkulator_tombol.dart'; // Sesuaikan 'uts' dengan nama projectmu

class KalkulatorScreen extends StatefulWidget {
  const KalkulatorScreen({super.key});

  @override
  State<KalkulatorScreen> createState() => _KalkulatorScreenState();
}

class _KalkulatorScreenState extends State<KalkulatorScreen> {
  String _output = "0"; // Teks yang tampil di layar
  String _currentNumber = "";
  double _num1 = 0.0;
  double _num2 = 0.0;
  String _operator = "";

  // Fungsi utama yang dipanggil saat tombol ditekan
  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        // (Soal e) Tombol hapus
        _output = "0";
        _currentNumber = "";
        _num1 = 0.0;
        _num2 = 0.0;
        _operator = "";
      } else if (buttonText == "+" ||
          buttonText == "-" ||
          buttonText == "x" ||
          buttonText == "/") {
        // (Soal e) Operasi tambah, kurang, kali, bagi
        _num1 = double.parse(_output);
        _operator = buttonText;
        _currentNumber = "";
        _output = buttonText; // Tampilkan operator di layar
      } else if (buttonText == "x²") {
        // (Soal e) Operasi kuadrat
        _num1 = double.parse(_output);
        _output = (_num1 * _num1).toString();
        _currentNumber = _output;
      } else if (buttonText == "√") {
        // (Soal e) Operasi akar kuadrat
        _num1 = double.parse(_output);
        _output = sqrt(_num1).toString();
        _currentNumber = _output;
      } else if (buttonText == "=") {
        if (_operator.isNotEmpty && _currentNumber.isNotEmpty) {
          _num2 = double.parse(_currentNumber);
          switch (_operator) {
            case "+":
              _output = (_num1 + _num2).toString();
              break;
            case "-":
              _output = (_num1 - _num2).toString();
              break;
            case "x":
              _output = (_num1 * _num2).toString();
              break;
            case "/":
              _output = (_num1 / _num2).toString();
              break;
          }
          _num1 = 0.0;
          _num2 = 0.0;
          _operator = "";
          _currentNumber = _output; // Simpan hasil untuk operasi selanjutnya
        }
      } else {
        // Ini adalah angka (0-9) atau titik (.)
        if (_operator.isNotEmpty && _currentNumber == "") {
          // Jika ini angka pertama setelah operator
          _currentNumber = buttonText;
          _output = _currentNumber;
        } else {
          // Melanjutkan angka yang ada
          if (_output == "0" || _output == "+" || _output == "-" || _output == "x" || _output == "/") {
            _currentNumber = buttonText;
            _output = _currentNumber;
          } else {
            _currentNumber += buttonText;
            _output = _currentNumber;
          }
        }
      }
    });
  }

  // Helper function untuk membuat satu baris tombol
  Widget _buildButtonRow(List<String> buttons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttons
          .map((btn) => KalkulatorTombol(
                teks: btn,
                onPress: () => _buttonPressed(btn),
                warnaTombol: (btn == "C" || btn == "x²" || btn == "√")
                    ? Colors.grey[300]
                    : (btn == "+" || btn == "-" || btn == "x" || btn == "/" || btn == "=")
                        ? Colors.purple[100]
                        : Colors.white,
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator'),
      ),
      body: Column(
        children: <Widget>[
          // 1. Layar Display Hasil
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 12,
              ),
              child: Text(
                _output,
                style: const TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Divider(),
          // 2. Area Tombol
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _buildButtonRow(["C", "x²", "√", "/"]),
                _buildButtonRow(["7", "8", "9", "x"]),
                _buildButtonRow(["4", "5", "6", "-"]),
                _buildButtonRow(["1", "2", "3", "+"]),
                _buildButtonRow(["00", "0", ".", "="]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}