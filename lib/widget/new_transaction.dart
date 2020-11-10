import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function newTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.newTx);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            RaisedButton(
                onPressed: () {
                  newTx(
                    titleController.text,
                    int.parse(amountController.text),
                  );
                },
                textColor: Colors.blue,
                child: Text(
                  'Add Transaction',
                ))
          ],
        ),
      ),
    );
  }
}
