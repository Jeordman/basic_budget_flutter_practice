import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction({Key? key, required this.addTx}) : super(key: key);

  handleNewTransaction() {
    addTx(titleController.text, double.parse(amountController.text));
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
              ),
              TextField(
                decoration: const InputDecoration(labelText: "Amount"),
                controller: amountController,
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
