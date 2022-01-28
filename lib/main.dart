import 'package:expense_tracker/widgets/user_transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(_MyApp());
}

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Flutter app'),
            ),
            body: SingleChildScrollView(
                child: Column(
              // vertical alignment
              mainAxisAlignment: MainAxisAlignment.start,
              // horizontal alignment
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: Colors.blue,
                    child: Text("CHART"),
                  ),
                ),
                UserTransactions(),
              ],
            ))));
  }
}
