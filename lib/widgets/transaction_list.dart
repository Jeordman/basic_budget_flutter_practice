import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions, {Key? key}) : super(key: key);

  convertDateTime(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
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
        ),
      ),
    );
  }
}
