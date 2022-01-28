// ignore: import_of_legacy_library_into_null_safe
import 'package:expense_tracker/widgets/chart_bar.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:intl/intl.dart';

import 'package:expense_tracker/models/transactions.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  const Chart({Key? key, required this.recentTransactions}) : super(key: key);

  didEventHappenAtTheSameTime(int i, DateTime weekDay) {
    return (recentTransactions[i].date.day == weekDay.day &&
        recentTransactions[i].date.month == weekDay.month &&
        recentTransactions[i].date.year == weekDay.year);
  }

  List<Map<String, dynamic>> get _groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (didEventHappenAtTheSameTime(i, weekDay)) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    });
  }

  double get totalSpending {
    return _groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        children: _groupedTransactionValues.map((e) {
          return ChartBar(
              label: e['day'],
              spendingAmount: e['amount'],
              spendingPercentageOfTotal: totalSpending == 0.0
                  ? 0.0
                  : (e['amount'] as double) / totalSpending);
        }).toList(),
      ),
    );
  }
}
