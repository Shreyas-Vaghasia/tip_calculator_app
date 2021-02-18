import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = TextEditingController();
  List<bool> _selection = [true, false, false];
  String tip;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (tip != null)
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(tip, style: TextStyle(fontSize: 30)),
                ),
              Text('Total Amount'),
              SizedBox(
                width: 60,
                child: TextField(
                  controller: controller,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(hintText: "Rs 100"),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ToggleButtons(
                children: [Text('10%'), Text('15%'), Text('20%')],
                isSelected: _selection,
                borderColor: Colors.green,
                onPressed: updateSelection,
              ),
              SizedBox(height: 10),
              FlatButton(
                padding: EdgeInsets.all(20),
                textColor: Colors.white,
                onPressed: calculateTip,
                child: Text(
                  'Calculate Tip',
                ),
                color: Colors.green,
              )
            ],
          ),
        ),
      ),
    );
  }

  void updateSelection(int index) {
    setState(() {
      for (int i = 0; i < _selection.length; i++) {
        _selection[i] = index == i;
      }
    });
  }

  void calculateTip() {
    final totalAmount = double.parse(controller.text);
    final selectedIndex = _selection.indexWhere((element) => element);
    final tipPercentage = [0.1, 0.15, 0.2][selectedIndex];
    final tipTotal = (totalAmount * tipPercentage).toStringAsFixed(2);
    setState(() {
      tip = 'Rs $tipTotal';
    });
  }
}
