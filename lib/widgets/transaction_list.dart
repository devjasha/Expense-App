import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
        child: ListView(
          children: transactions.map((transaction) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
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
                                    '\$ ${transaction.amount}'),
                              ],
                            )),
                        Expanded(
                            flex: 2,
                            child: Container(
                              margin: const EdgeInsets.only(left: 20),
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
                            ))
                      ],
                    ),
                  )),
            );
          }).toList(),
        ),
    );
  }
}
