import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:globalgamestore/profile/profile.dart';

import '../../common/rupiah_convert.dart';
import '../seller/listproductseller.dart';

class PesananApp extends StatelessWidget {
  const PesananApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Pesanan(),
    );
  }
}

class Pesanan extends StatelessWidget {
  // const Pesanan({super.key});
  // DefaultTabController myController = DefaultTabController(length: 2, child: null);
  final firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot> getData() {
    return firestore.collection('riwayat_produk').snapshots();
  }

  Pesanan({super.key});
  @override
  Widget build(BuildContext context) {
    List<Tab> myTab = [
      const Tab(
        text: 'Menunggu Verifikasi',
      ),
      const Tab(
        text: 'Selesai',
      ),
    ];
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: myTab.length,
        child: Scaffold(
          appBar: AppBar(
              title: const Text(
                'Pesanan Saya',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w400),
              ),
              bottom: TabBar(
                tabs: myTab,
                indicatorColor: const Color(0xFFEE4532),
                unselectedLabelColor: Colors.black,
                labelColor: const Color(0xFFEE4532),
              ),
              backgroundColor: Colors.white,
              leading: Container(
                child: InkWell(
                  child: const Icon(
                    Icons.arrow_back_outlined,
                    size: 32,
                    color: Color(0xFFEE4532),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const ProfileApp();
                        },
                      ),
                    );
                  },
                ),
              )),
          body: TabBarView(children: [
            Center(
              child: Text('Tidak Ada'),
            ),
            StreamBuilder(
                stream: getData(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: Text('tidak ada data'));
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text("Loading");
                  }
                  return ListView(
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
                                  child: Image.network(data['image_url'] ??
                                      'https://picsum.photos/id/237/200/300')),
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
                                              formatRupiah(
                                                  data['harga_produk']),
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList());
                }),
          ]),
        ),
      ),
    );
  }
}
