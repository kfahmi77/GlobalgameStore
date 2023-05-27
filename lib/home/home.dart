import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:globalgamestore/home/balance/balance.dart';
import 'package:globalgamestore/home/cart/cart.dart';
import 'package:globalgamestore/home/products/products.dart';
import 'package:globalgamestore/home/search/search.dart';
import 'package:globalgamestore/home/slider/slider.dart';
import 'package:globalgamestore/home/viewproduct/viewdetailproduct.dart';

class HomePageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    Stream<QuerySnapshot> getData() {
      return firestore.collection('product').snapshots();
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 70,
          title: InkWell(
            child: Container(
              height: 40,
              width: mediaQueryWidth * 0.8,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 232, 232, 232),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: mediaQueryWidth * 0.15,
                    height: 40,
                    // color: Colors.red,
                    child: Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 25,
                    ),
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchApp();
                  },
                ),
              );
            },
          ),
          actions: [
            InkWell(
              child: Container(
                height: 40,
                width: mediaQueryWidth * 0.2,
                // color: Colors.green,
                child: Center(
                  child: Icon(
                    Icons.shopping_cart,
                    color: Color(0xFFEE4532),
                    size: 35.0,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CartApp();
                    },
                  ),
                );
              },
            )
          ],
        ),
        // body: StreamBuilder<QuerySnapshot>(
        //   stream: getData(),
        //   builder:
        //       (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //     if (snapshot.hasError) {
        //       return Text('Error: ${snapshot.error}');
        //     }

        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return Text('Loading...');
        //     }

        //     return ListView(
        //       children: snapshot.data!.docs.map((DocumentSnapshot document) {
        //         Map<String, dynamic> data =
        //             document.data() as Map<String, dynamic>;
        //         return ListTile(
        //           title: Text(data['nama_produk']),
        //           subtitle: Text(data['nama_produk']),
        //         );
        //       }).toList(),
        //     );
        //   },
        // ),
        body: Container(
          width: mediaQueryWidth,
          height: mediaQueryHeight,
          // color: Color.fromARGB(255, 44, 7, 255),
          child: ListView(
            padding: EdgeInsets.only(top: 0.0),
            children: [
              Container(
                width: mediaQueryWidth,
                height: 196.5,
                // color: Colors.amber,
                child: SliderScreen(),
              ),
              Container(
                width: mediaQueryWidth,
                height: 100,
                // child: BalanceApp(),
                // color: Colors.amber,
                child: Center(
                  child: Container(
                    width: mediaQueryWidth * 0.9,
                    height: 65,
                    child: Row(
                      children: [
                        Container(
                          width: mediaQueryWidth * 0.45,
                          height: 65,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                            border: Border.all(
                              color: Color.fromARGB(255, 183, 183, 183),
                              width: 1,
                            ),
                          ),
                          child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('topup')
                                .where('uid',
                                    isEqualTo:
                                        FirebaseAuth.instance.currentUser!.uid)
                                .snapshots(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
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
                                child: Row(
                                  children: [
                                    Container(
                                      width: mediaQueryWidth * 0.13,
                                      height: 50,
                                      // color: Colors.red,
                                      child: Center(
                                        child: Icon(
                                          Icons.account_balance_wallet_outlined,
                                          size: 30,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: mediaQueryWidth * 0.25,
                                      height: 50,
                                      // color: Colors.red,
                                      child: Center(
                                        child: FittedBox(
                                          child: Text(
                                            'Rp $totalAmount',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                            width: mediaQueryWidth * 0.45,
                            height: 65,
                            // color: Colors.white,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              border: Border.all(
                                color: Color.fromARGB(255, 183, 183, 183),
                                width: 1,
                              ),
                            ),
                            child: InkWell(
                              child: Center(
                                child: Row(
                                  children: [
                                    Container(
                                      width: mediaQueryWidth * 0.13,
                                      height: 50,
                                      // color: Colors.red,
                                      child: Center(
                                        child: Icon(
                                          Icons.add_card,
                                          size: 30,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: mediaQueryWidth * 0.25,
                                      height: 50,
                                      // color: Colors.red,
                                      child: Center(
                                        child: Text(
                                          'Isi Saldo',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return HomeBalanceApp();
                                    },
                                  ),
                                );
                              },
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: mediaQueryWidth,
                height: 100,
                // color: Color.fromARGB(255, 174, 141, 141),
                // child: MenuApp(),
                child: Center(
                  child: Container(
                    width: mediaQueryWidth,
                    height: 80,
                    // color: Color.fromARGB(255, 148, 131, 130),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      // padding: EdgeInsets.only(left: 20),
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              // color: Colors.green,
                              border: Border.all(
                                color: Color(0xFFEE4532),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: InkWell(
                            child: Column(
                              children: [
                                Container(
                                  width: 70,
                                  height: 55,
                                  // color: Colors.red,
                                  child: Center(
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child:
                                          Image.asset('assets/images/Pubg.png'),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 70,
                                  height: 22,
                                  // color: Color.fromARGB(255, 99, 216, 22),
                                  child: Center(
                                    child: FittedBox(
                                      child: Text(
                                        'Pubg Mobile',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ProductsApp();
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              // color: Colors.green,
                              border: Border.all(
                                color: Color(0xFFEE4532),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Container(
                                width: 70,
                                height: 55,
                                // color: Colors.red,
                                child: Center(
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child:
                                        Image.asset('assets/images/Pubg.png'),
                                  ),
                                ),
                              ),
                              Container(
                                width: 70,
                                height: 22,
                                // color: Color.fromARGB(255, 99, 216, 22),
                                child: Center(
                                  child: FittedBox(
                                    child: Text(
                                      'Pubg Mobile',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              // color: Colors.green,
                              border: Border.all(
                                color: Color(0xFFEE4532),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Container(
                                width: 70,
                                height: 55,
                                // color: Colors.red,
                                child: Center(
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child:
                                        Image.asset('assets/images/Pubg.png'),
                                  ),
                                ),
                              ),
                              Container(
                                width: 70,
                                height: 22,
                                // color: Color.fromARGB(255, 99, 216, 22),
                                child: Center(
                                  child: FittedBox(
                                    child: Text(
                                      'Pubg Mobile',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              // color: Colors.green,
                              border: Border.all(
                                color: Color(0xFFEE4532),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Container(
                                width: 70,
                                height: 55,
                                // color: Colors.red,
                                child: Center(
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child:
                                        Image.asset('assets/images/Pubg.png'),
                                  ),
                                ),
                              ),
                              Container(
                                width: 70,
                                height: 22,
                                // color: Color.fromARGB(255, 99, 216, 22),
                                child: Center(
                                  child: FittedBox(
                                    child: Text(
                                      'Pubg Mobile',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              // color: Colors.green,
                              border: Border.all(
                                color: Color(0xFFEE4532),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Container(
                                width: 70,
                                height: 55,
                                // color: Colors.red,
                                child: Center(
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child:
                                        Image.asset('assets/images/Pubg.png'),
                                  ),
                                ),
                              ),
                              Container(
                                width: 70,
                                height: 22,
                                // color: Color.fromARGB(255, 99, 216, 22),
                                child: Center(
                                  child: FittedBox(
                                    child: Text(
                                      'Pubg Mobile',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              // color: Colors.green,
                              border: Border.all(
                                color: Color(0xFFEE4532),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Container(
                                width: 70,
                                height: 55,
                                // color: Colors.red,
                                child: Center(
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child:
                                        Image.asset('assets/images/Pubg.png'),
                                  ),
                                ),
                              ),
                              Container(
                                width: 70,
                                height: 22,
                                // color: Color.fromARGB(255, 99, 216, 22),
                                child: Center(
                                  child: FittedBox(
                                    child: Text(
                                      'Pubg Mobile',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              // color: Colors.green,
                              border: Border.all(
                                color: Color(0xFFEE4532),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Container(
                                width: 70,
                                height: 55,
                                // color: Colors.red,
                                child: Center(
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child:
                                        Image.asset('assets/images/Pubg.png'),
                                  ),
                                ),
                              ),
                              Container(
                                width: 70,
                                height: 22,
                                // color: Color.fromARGB(255, 99, 216, 22),
                                child: Center(
                                  child: FittedBox(
                                    child: Text(
                                      'Pubg Mobile',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: mediaQueryWidth,
                height: 10,
                color: Color.fromARGB(255, 223, 223, 223),
              ),
              Container(
                  width: mediaQueryWidth,
                  height: 50,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Container(
                        width: mediaQueryWidth * 0.4,
                        height: 50,
                        // color: Colors.red,
                        child: Center(
                          child: Text(
                            'REKOMENDASI',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                  )),
              StreamBuilder(
                stream: getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error ${snapshot.error}');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return SingleChildScrollView(
                    child: Container(
                        width: mediaQueryWidth,
                        height: 305,
                        color: Color.fromARGB(255, 223, 223, 223),
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          padding: EdgeInsets.only(left: 10, top: 10),
                          mainAxisSpacing: 10,
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot documentSnapshot) {
                            Map<String, dynamic> data =
                                documentSnapshot.data() as Map<String, dynamic>;
                            return InkWell(
                              child: Container(
                                width: mediaQueryWidth * 0.48,
                                height: 300,
                                color: const Color.fromARGB(255, 62, 52, 52),
                                child: Column(
                                  children: [
                                    Container(
                                      width: mediaQueryWidth * 0.48,
                                      height: 60,
                                      // color: Colors.amber,
                                      child: Center(
                                        child: FittedBox(
                                          fit: BoxFit.cover,
                                          child:
                                              Image.network(data['image_url']),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: mediaQueryWidth * 0.48,
                                      height: 50,
                                      // color: Colors.red,
                                      padding: EdgeInsets.only(left: 12),
                                      child: Text(
                                        data['nama_produk'],
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    Container(
                                      width: mediaQueryWidth * 0.48,
                                      height: 50,
                                      // color: Colors.red,
                                      padding: EdgeInsets.only(left: 12),
                                      child: Text(
                                        data['harga_produk'].toString(),
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.red),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return ViewDetailProductApp(
                                        data: data,
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        )),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
