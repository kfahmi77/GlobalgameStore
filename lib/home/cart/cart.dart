import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:globalgamestore/navigation/navigation.dart';

class CartApp extends StatelessWidget {
  const CartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Cart();
  }
}

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final User? user = FirebaseAuth.instance.currentUser;
    Stream<QuerySnapshot> getData() {
      return firestore
          .collection('keranjang')
          .where('user_id', isEqualTo: user!.uid)
          .snapshots();
    }

    print('user $user');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Keranjang',
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.w400),
          ),
          backgroundColor: Colors.white,
          leading: InkWell(
            child: const Icon(
              Icons.arrow_back_outlined,
              size: 35,
              color: Color(0xFFEE4532),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const NavAppBar();
                  },
                ),
              );
            },
          ),
        ),
        body: Container(
          height: mediaQueryHeight,
          width: mediaQueryWidth,
          color: const Color.fromARGB(255, 223, 223, 223),
          //panggil fungsi stream data yaitu secara realtime
          child: StreamBuilder(
              stream: getData(),
              builder: (context, snapshot) {
                //jika data error disisi backend
                if (snapshot.hasError) {
                  return Text('Error ${snapshot.error}');
                }
                // data loading dulu
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView(
                  //mapping data
                  children: snapshot.data!.docs.map((data) {
                    return SizedBox(
                      width: mediaQueryWidth,
                      height: mediaQueryHeight * 0.2,
                      // color: Colors.red,
                      child: Row(
                        children: [
                          Container(
                            width: mediaQueryWidth * 0.4,
                            height: mediaQueryHeight * 0.2,
                            color: Colors.white,
                            child: Center(
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Image.network(data['image_url']),
                              ),
                            ),
                          ),
                          Container(
                            width: mediaQueryWidth * 0.6,
                            height: mediaQueryHeight * 0.2,
                            color: Colors.white,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: mediaQueryWidth * 0.6,
                                  height: mediaQueryHeight * 0.14,
                                  // color: Colors.red,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: mediaQueryWidth * 0.6,
                                        height: mediaQueryHeight * 0.07,
                                        // color: Colors.green,
                                        child: Center(
                                          child: Container(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            width: mediaQueryWidth * 0.6,
                                            height: mediaQueryHeight * 0.04,
                                            // color: Colors.red,
                                            child: Text(
                                              data['nama_produk'],
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: mediaQueryWidth * 0.6,
                                        height: mediaQueryHeight * 0.07,
                                        // color: Color.fromARGB(255, 76, 97, 175),
                                        child: Center(
                                          child: Container(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            width: mediaQueryWidth * 0.6,
                                            height: mediaQueryHeight * 0.04,
                                            // color: Colors.red,
                                            child: Text(
                                              'Rp ${data['harga_produk']}',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFFEE4532),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: mediaQueryWidth * 0.6,
                                  height: mediaQueryHeight * 0.06,
                                  // color: Color.fromARGB(255, 76, 97, 175),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: mediaQueryWidth * 0.3,
                                        height: mediaQueryHeight * 0.06,
                                        // color: Color.fromARGB(255, 20, 170, 43),
                                        child: Center(
                                          child: InkWell(
                                            onTap: () {
                                              //buat fungsi hapus data
                                              firestore
                                                  .collection('keranjang')
                                                  .doc(data.id)
                                                  .delete();
                                            },
                                            child: Container(
                                              width: mediaQueryWidth * 0.28,
                                              height: mediaQueryHeight * 0.05,
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFEE4532),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: const Center(
                                                child: Text(
                                                  'Hapus',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: mediaQueryWidth * 0.3,
                                        height: mediaQueryHeight * 0.06,
                                        // color: Color.fromARGB(255, 170, 123, 20),
                                        child: Center(
                                          child: Container(
                                            width: mediaQueryWidth * 0.28,
                                            height: mediaQueryHeight * 0.05,
                                            decoration: BoxDecoration(
                                                color: const Color(0xFFEE4532),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: const Center(
                                              child: Text(
                                                'Checkout',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                );
              }),
        ),
      ),
    );
  }
}
