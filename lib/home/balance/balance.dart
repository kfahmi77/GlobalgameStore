import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:globalgamestore/home/balance/top_up_balance.dart';
import 'package:globalgamestore/navigation/navigation.dart';

class HomeBalanceApp extends StatelessWidget {
  const HomeBalanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeBalance();
  }
}

class HomeBalance extends StatelessWidget {
  const HomeBalance({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    final myAppBar = AppBar(
        title: Text(
          'SaldoKu',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w400),
        ),
        // backgroundColor: Colors.white,
        backgroundColor: Color(0xFFEE4532),
        leading: Container(
          child: InkWell(
            child: Icon(
              Icons.arrow_back_outlined,
              size: 35,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return NavAppBar();
                  },
                ),
              );
            },
          ),
        ));

    final bodyHeight = mediaQueryHeight -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: myAppBar,
          body: Column(
            children: [
              Container(
                width: mediaQueryWidth,
                height: bodyHeight * 0.32,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      width: mediaQueryWidth,
                      height: mediaQueryHeight * 0.12,
                      color: Color(0xFFEE4532),
                      child: Center(
                        child: Container(
                          width: mediaQueryWidth,
                          height: mediaQueryHeight * 0.05,
                          // color: Colors.white,
                          child: StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('topup')
                                  .where('uid',
                                      isEqualTo: FirebaseAuth
                                          .instance.currentUser!.uid)
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                }

                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                }

                                List<DocumentSnapshot> documents =
                                    snapshot.data!.docs;
                                int totalAmount = 0;
                                for (DocumentSnapshot doc in documents) {
                                  Map<String, dynamic> data =
                                      doc.data() as Map<String, dynamic>;
                                  if (data.containsKey('amount')) {
                                    totalAmount += data['amount'] as int;
                                  }
                                }
                                return Center(
                                  child: Container(
                                    width: mediaQueryWidth * 0.5,
                                    height: mediaQueryHeight * 0.05,
                                    // color: Colors.white,
                                    child: Center(
                                      child: FittedBox(
                                        child: Text(
                                          'Rp $totalAmount',
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ),
                    Container(
                      width: mediaQueryWidth,
                      height: mediaQueryHeight * 0.15,
                      color: Color(0xFFEE4532),
                      child: Center(
                        child: Container(
                          width: mediaQueryWidth * 0.8,
                          height: mediaQueryHeight * 0.12,
                          // color: Colors.white,
                          child: Center(
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return TopupScreen();
                                        },
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: mediaQueryWidth * 0.4,
                                    height: mediaQueryHeight * 0.12,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            bottomLeft: Radius.circular(20))),
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Container(
                                            width: mediaQueryWidth * 0.25,
                                            height: mediaQueryHeight * 0.075,
                                            // color: Colors.black,
                                            child: Center(
                                              child: Icon(
                                                Icons.add_card,
                                                size: 45,
                                                color: Color(0xFFEE4532),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: mediaQueryWidth * 0.25,
                                            height: mediaQueryHeight * 0.04,
                                            // color: Color.fromARGB(255, 11, 34, 184),
                                            child: Center(
                                              child: Text(
                                                'Isi Saldo',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xFFEE4532),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: mediaQueryWidth * 0.4,
                                  height: mediaQueryHeight * 0.12,
                                  // color: Color.fromARGB(255, 7, 85, 255),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20))),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Container(
                                          width: mediaQueryWidth * 0.25,
                                          height: mediaQueryHeight * 0.075,
                                          // color: Colors.black,
                                          child: Center(
                                            child: Icon(
                                              Icons.assured_workload_outlined,
                                              size: 45,
                                              color: Color(0xFFEE4532),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: mediaQueryWidth * 0.25,
                                          height: mediaQueryHeight * 0.04,
                                          // color: Color.fromARGB(255, 11, 34, 184),
                                          child: Center(
                                            child: Text(
                                              'Tarik saldo',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xFFEE4532),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: bodyHeight * 0.07,
                width: mediaQueryWidth,
                child: Row(
                  children: [
                    Container(
                      width: mediaQueryWidth * 0.5,
                      height: bodyHeight * 0.07,
                      // color: Colors.green,
                      child: Center(
                        child: Text(
                          'Transaksi Terakhir',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  // color: Colors.green,
                  border: Border.all(
                    color: Color.fromARGB(255, 199, 199, 199),
                    // width: 1,
                  ),
                ),
              ),
              // Divider(color: Colors.black,),
              Container(
                height: bodyHeight * 0.6,
                color: Colors.white,
                child: ListView.builder(
                    itemCount: 25,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 230, 230, 230),
                        ),
                        title: Text('Pembayaran'),
                        subtitle: Text('Pubg - 30 Maret 2023'),
                        trailing: Text('Rp128.000'),
                      );
                    }),
              ),
            ],
          )),
    );
  }
}
