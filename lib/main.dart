import 'package:flutter/material.dart';
import 'package:expense_tracker/transactions.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(_MyApp());
}

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatelessWidget {
  convertDateTime(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }

  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  handleNewTransaction() {
    print('Button Clicked');
    print(titleController.text);
    print(amountController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter app'),
        ),
        body: Column(
          // vertical alignment
          mainAxisAlignment: MainAxisAlignment.start,
          // horizontal alignment
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: const Card(
                color: Colors.blue,
                child: Text("CHART"),
              ),
            ),
            Card(
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(10),
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
                )),
            Column(
              children: transactions.map((tx) {
                return Card(
                    child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2)),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          '\$${tx.amount}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple,
                          ),
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx.title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          convertDateTime(tx.date),
                          style: const TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ));
              }).toList(),
            )
          ],
        ));
  }
}
