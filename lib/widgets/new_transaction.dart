import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction({Key? key, required this.addTx}) : super(key: key);

  validateTextFields() {
    if (titleController.text.isEmpty ||
        amountController.text.isEmpty ||
        double.parse(amountController.text) <= 0) {
      return false;
    }
    return true;
  }

  handleNewTransaction() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (validateTextFields() == false) return;
    addTx(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              TextField(
                decoration: const InputDecoration(labelText: "Title"),
                controller: titleController,
                onSubmitted: (_) => handleNewTransaction(),
              ),
              TextField(
                decoration: const InputDecoration(labelText: "Amount"),
                controller: amountController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => handleNewTransaction(),
              ),
              TextButton(
                  onPressed: handleNewTransaction,
                  child: const Text("Add Transaction"),
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(color: Colors.purple),
                  ))
            ],
          ),
        ));
  }
}
