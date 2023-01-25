import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<Transaction> transactions = [
    Transaction(id: 't1', title: 'New Shows', amount: 120.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'Weekly Groceries', amount: 50.35, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
        Container(
          width: double.infinity,
          child: const Card(
            color: Colors.blue,
            child: Text('Chart'),
            elevation: 5,
          )
        ),
        Column(
          children: transactions.map((transaction) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  '\$ ${transaction.amount}'
                                ),
                              ],
                            )
                        ),
                        Expanded(
                          flex: 2,
                            child: Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                    transaction.title,
                                  ),
                                  Text(
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black26,
                                    ),
                                    DateFormat.yMMMd().format(transaction.date),
                                  ),
                                ],
                              ),
                            )
                          )
                      ],
                    ),
                  )
                ),
              );
            }).toList(),
        ),
      ],)
    );
  }
}
