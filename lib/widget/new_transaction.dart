import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function newTx;

  NewTransaction(this.newTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enterTitle = titleController.text;
    final enterAmount = int.parse(amountController.text);
    if (enterTitle.isEmpty || enterAmount <= 0) {
      return;
    }
    widget.newTx(
      enterTitle,
      enterAmount,
    );
    Navigator.of(context).pop();
  }

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
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            RaisedButton(
                onPressed: () => submitData(),
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
