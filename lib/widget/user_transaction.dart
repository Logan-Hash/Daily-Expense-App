import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../model/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> userTransactions = [
    Transaction(
      id: '1',
      title: 'New phone',
      amount: 20000,
      currency: 'Ks',
      date: DateTime.now(),
    ),
    Transaction(
      id: '1',
      title: 'New Headphone',
      amount: 6000,
      currency: 'Ks',
      date: DateTime.now(),
    )
  ];
  void addNewTransaction(String txTitle, int txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
      currency: 'ks',
    );
    setState(() {
      userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(addNewTransaction),
        TransactionList(userTransactions),
      ],
    );
  }
}
