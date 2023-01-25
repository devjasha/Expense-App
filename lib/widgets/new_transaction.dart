import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  
  final Function addTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleController,
              onChanged: (value) {
                // titleInput = value;
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              // onChanged: (value) {
              //   amountInput = value;
              // },
              controller: amountController,
            ),
            ElevatedButton(
                onPressed: () {
                  addTransaction(titleController.text, double.parse(amountController.text));
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                    foregroundColor: MaterialStatePropertyAll(Colors.purple)),
                child: const Text('Add transaction'))
          ],
        ),
      ),
    );
  }
}
