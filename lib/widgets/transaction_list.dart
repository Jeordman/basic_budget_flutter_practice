import 'package:flutter/material.dart';
import '../models/transactions.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList(this.transactions, {Key? key}) : super(key: key);

  convertDateTime(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      //! EXTREMELY PERFORMANT
      // LIST ONLY LOADS WHAT IS VISIBLE (GREAT FOR LARGE DATA SETS)
      child: ListView.builder(
        itemBuilder: (context, index) => Card(
            child: Row(
          children: [
            Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2)),
                padding: const EdgeInsets.all(10),
                child: Text(
                  '\$${transactions[index].amount.toStringAsFixed(2)}',
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
                  transactions[index].title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  convertDateTime(transactions[index].date),
                  style: const TextStyle(color: Colors.grey),
                )
              ],
            )
          ],
        )),
        itemCount: transactions.length,
      ),
    );
  }
}
