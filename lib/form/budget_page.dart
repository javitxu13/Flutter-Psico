import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BudgetPage extends StatefulWidget {
  final Function(double) onBudgetSelected;

  BudgetPage({Key? key, required this.onBudgetSelected}) : super(key: key);

  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  TextEditingController _budgetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter your Budget"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _budgetController,
                decoration: InputDecoration(labelText: "Budget"),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                ],
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _saveBudget,
                child: Text("Save Budget"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveBudget() {
    double budget = double.tryParse(_budgetController.text) ?? 0.0;
    widget.onBudgetSelected(budget);
  }
}
