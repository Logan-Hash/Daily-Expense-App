import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function newTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.newTx);

  void submitData() {
    final enterTitle = titleController.text;
    final enterAmount = int.parse(amountController.text);
    if (enterTitle.isEmpty || enterAmount <= 0) {
      return;
    }
    newTx(
      enterTitle,
      enterAmount,
    );
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
                onPressed: () => submitData,
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
