import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorUI(),
    );
  }
}

class CalculatorUI extends StatefulWidget {
  @override
  _CalculatorUIState createState() => _CalculatorUIState();
}

class _CalculatorUIState extends State<CalculatorUI> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100], // Background color
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          width: 300,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Display Section using TextField
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                margin: const EdgeInsets.only(bottom: 20),
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: _controller,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '0',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  keyboardType: TextInputType.number, // Accept only numbers
                  onChanged: (value) {
                    // Ensure only valid numbers are entered
                    if (double.tryParse(value) == null) {
                      _controller.text = '';
                    }
                  },
                ),
              ),
              // Buttons Section
              GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  _buildButton('c'),
                  _buildButton('m'),
                  _buildButton('%'),
                  _buildButton('÷'),
                  _buildButton('7'),
                  _buildButton('8'),
                  _buildButton('9'),
                  _buildButton('×'),
                  _buildButton('4'),
                  _buildButton('5'),
                  _buildButton('6'),
                  _buildButton('-'),
                  _buildButton('1'),
                  _buildButton('2'),
                  _buildButton('3'),
                  _buildButton('+'),
                  _buildButton('0'),
                  _buildButton(','),
                  _buildButton('+-'),
                  _buildButton('='),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method for creating buttons
  Widget _buildButton(String text) {
    // Check if the button should have green text
    final isSpecialButton = ['c', 'm', '%', '÷', '×', '-', '+', '='].contains(text);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black, // Button color set to black
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
        side: BorderSide.none, // Removes any outline or border
        elevation: 0, // Flat button style with no shadow
      ),
      onPressed: () {
        setState(() {
          if (text == 'C') {
            _controller.clear(); // Clear input
          } else if (text == '=') {
            // Add logic to evaluate expression
            _controller.text = "Result"; // Placeholder for now
          } else {
            _controller.text += text; // Append text to the display
          }
        });
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: isSpecialButton ? Colors.green : Colors.white, 
        ),
      ),
    );
  }
}
