import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:globalgamestore/profile/profile.dart';
import 'package:globalgamestore/profile/seller/edit_product_seller.dart';

import '../../common/rupiah_convert.dart';

class ListProductsSellerApp extends StatelessWidget {
  const ListProductsSellerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListProdutsSeller(),
    );
  }
}

class ListProdutsSeller extends StatelessWidget {
  // const Pesanan({super.key});
  // DefaultTabController myController = DefaultTabController(length: 2, child: null);

  ListProdutsSeller({super.key});
  final firestore = FirebaseFirestore.instance;
  final User? user = FirebaseAuth.instance.currentUser;
  Stream<QuerySnapshot> getData() {
    return firestore
        .collection('product')
        .where('user_id', isEqualTo: user!.uid)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    List<Tab> myTab = [
      const Tab(
        text: 'Daftar Produk',
      ),
      const Tab(
        text: 'Dalam Proses',
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
                'Daftar Produk Saya',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
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
            // Center(
            //   child: Text('Tidak Ada'),
            // ),
            Container(
              height: mediaQueryHeight,
              width: mediaQueryWidth,
              color: const Color.fromARGB(255, 223, 223, 223),
              child: StreamBuilder(
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
                                    child: Image.network(data['image_url'])),
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
                                              padding: const EdgeInsets.only(
                                                  left: 15),
                                              width: mediaQueryWidth * 0.6,
                                              height: mediaQueryHeight * 0.04,
                                              // color: Colors.red,
                                              child: Text(
                                                data['nama_produk'],
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w300),
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
                                              padding: const EdgeInsets.only(
                                                  left: 15),
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
                                            child: Container(
                                              width: mediaQueryWidth * 0.28,
                                              height: mediaQueryHeight * 0.05,
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFEE4532),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: GestureDetector(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return const ConfirmationDialogWidget();
                                                    },
                                                  ).then((value) {
                                                    if (value != null &&
                                                        value) {
                                                      firestore
                                                          .collection('product')
                                                          .doc(data.id)
                                                          .delete();
                                                      // Tindakan yang diambil saat konfirmasi "Hapus" diklik
                                                      // Misalnya, hapus data
                                                    } else {
                                                      // Tindakan yang diambil saat konfirmasi "Batal" diklik
                                                    }
                                                  });
                                                },
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
                                          child: SizedBox(
                                            width: mediaQueryWidth * 0.3,
                                            height: mediaQueryHeight * 0.06,
                                            // color: Color.fromARGB(255, 20, 170, 43),
                                            child: Center(
                                              child: Container(
                                                width: mediaQueryWidth * 0.28,
                                                height: mediaQueryHeight * 0.05,
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFFEE4532),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              EditProductScreen(
                                                                productId:
                                                                    data.id,
                                                              )),
                                                    );
                                                  },
                                                  child: const Center(
                                                    child: Text(
                                                      'Edit',
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
                    }).toList());
                  }),
            ),
            //selesai
            const Center(
              child: Text('Selesai'),
            ),
          ]),
        ),
      ),
    );
  }
}

class ConfirmationDialogWidget extends StatelessWidget {
  const ConfirmationDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Konfirmasi'),
      content: const Text('Apakah Anda yakin ingin menghapus data?'),
      actions: <Widget>[
        ElevatedButton(
          child: const Text('Batal'),
          onPressed: () {
            Navigator.of(context)
                .pop(false); // Kembali ke halaman sebelumnya dengan nilai false
          },
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          ),
          child: const Text('Hapus'),
          onPressed: () {
            Navigator.of(context)
                .pop(true); // Kembali ke halaman sebelumnya dengan nilai true
          },
        ),
      ],
    );
  }
}
