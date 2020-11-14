import 'package:flutter/material.dart';

import './widget/new_transaction.dart';
import './widget/transaction_list.dart';
import './widget/chart.dart';
import './model/transaction.dart';

void main() => {runApp(MyApp())};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Expense',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.cyanAccent,
        fontFamily: 'Raleway',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> userTransactions = [
    // Transaction(
    //   id: '1',
    //   title: 'New phone',
    //   amount: 20000,
    //   currency: 'Ks',
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: '1',
    //   title: 'New Headphone',
    //   amount: 6000,
    //   currency: 'Ks',
    //   date: DateTime.now(),
    // )
  ];

  List<Transaction> get _recentTransaction {
    return userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

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

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daily Expense',
          style: TextStyle(fontFamily: 'Raleway'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => startAddNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Chart(_recentTransaction),
            TransactionList(userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startAddNewTransaction(context),
      ),
    );
  }
}
