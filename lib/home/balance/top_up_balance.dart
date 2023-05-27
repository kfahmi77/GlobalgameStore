// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:globalgamestore/home/home.dart';

class TopupScreen extends StatefulWidget {
  @override
  _TopupScreenState createState() => _TopupScreenState();
}

class _TopupScreenState extends State<TopupScreen> {
  final List<int> topupOptions = [10000, 20000, 50000, 100000, 200000];
  TextEditingController customAmountController = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void dispose() {
    customAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top-Up'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(16),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: topupOptions.map((amount) {
                return TopupOption(
                  amount: amount,
                  onTap: () {
                    topupMoney(user!.uid, amount);
                  },
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: customAmountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Custom Amount',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              String customAmountText = customAmountController.text.trim();
              if (customAmountText.isNotEmpty) {
                int customAmount = int.parse(customAmountText);
                topupMoney(user!.uid, customAmount);
              }
            },
            child: Text('Top-Up Custom Amount'),
          ),
        ],
      ),
    );
  }

  void topupMoney(String uid, int amount) async {
     final CollectionReference topupCollection =
      FirebaseFirestore.instance.collection('topup');

  QuerySnapshot querySnapshot = await topupCollection.get();
  bool isExistingData = false;
  String? existingDocumentId;

  for (QueryDocumentSnapshot doc in querySnapshot.docs) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    if (data.containsKey('uid') && data['uid'] == uid) {
      isExistingData = true;
      existingDocumentId = doc.id;
      break;
    }
  }

  if (isExistingData) {
    await topupCollection.doc(existingDocumentId).update({
      'amount': FieldValue.increment(amount),
    });
  } else {
    await topupCollection.add({
      'uid': uid,
      'amount': amount,
      'date': DateTime.now(),
    });
  }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Top-Up Berhasil'),
          content: Text('Top-Up sebesar Rp$amount berhasil.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => HomePage(),
                    ));
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class TopupOption extends StatelessWidget {
  final int amount;
  final Function onTap;

  TopupOption({required this.amount, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.monetization_on,
              size: 40,
              color: Colors.white,
            ),
            SizedBox(height: 8),
            Text(
              'Rp$amount',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
