import 'package:flutter/material.dart';

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CalculatorScreenState();
}

class CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();

  double result = 0;

  double get firstValue => double.tryParse(firstController.text) ?? 0;
  double get secondValue => double.tryParse(secondController.text) ?? 0;

  void resetCalculator() {
    setState(() {
      firstController.clear();
      secondController.clear();
      result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF14141F),
      appBar: AppBar(
        title: Text('Calc'),
        backgroundColor: Color(0xFF1E1E2E),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: firstController,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Введите первое число',
                labelStyle: TextStyle(color: Color(0xFF9D8CFF)),
                filled: true,
                fillColor: Color(0xFF1E1E2E),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFF3A3A55)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFF7C5CFF)),
                ),

                // border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            TextField(
              controller: secondController,
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Введите второе число',
                labelStyle: TextStyle(color: Color(0xFF9D8CFF)),
                filled: true,
                fillColor: Color(0xFF1E1E2E),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFF3A3A55)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFF7C5CFF)),
                ),
                //border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = firstValue + secondValue;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2A2A3E),
                    foregroundColor: Color(0xFFB4A5FF),
                    elevation: 0,
                    padding: EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text('+', style: TextStyle(fontSize: 24)),
                ),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = firstValue - secondValue;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2A2A3E),
                    foregroundColor: Color(0xFFB4A5FF),
                    elevation: 0,
                    padding: EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text('-', style: TextStyle(fontSize: 24)),
                ),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = firstValue * secondValue;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2A2A3E),
                    foregroundColor: Color(0xFFB4A5FF),
                    elevation: 0,
                    padding: EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text('×', style: TextStyle(fontSize: 24)),
                ),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = secondValue == 0 ? 0 : firstValue / secondValue;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2A2A3E),
                    foregroundColor: Color(0xFFB4A5FF),
                    elevation: 0,
                    padding: EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text('÷', style: TextStyle(fontSize: 24)),
                ),
              ],
            ),

            SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: resetCalculator,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2A2A3E),
                  foregroundColor: Color(0xFFF09595),
                  elevation: 0,
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text('Сброс', style: TextStyle(fontSize: 18)),
              ),
            ),
            SizedBox(height: 30),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF1E1E2E),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xFF7C5CFF), width: 1.5),
              ),
              child: Text(
                'Результат: $result',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFC9BEFF),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
