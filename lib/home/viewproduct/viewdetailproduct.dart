import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:globalgamestore/home/cart/cart.dart';
import 'package:globalgamestore/home/viewproduct/viewdetailsliderscreen.dart';
import 'package:globalgamestore/invoice/invoice.dart';
import 'package:globalgamestore/navigation/navigation.dart';
import 'package:path/path.dart';

class ViewDetailProductApp extends StatelessWidget {
  final Map<String, dynamic> data;

  const ViewDetailProductApp({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewDetailProduct(data: data);
  }
}

class ViewDetailProduct extends StatelessWidget {
  final Map<String, dynamic> data;

  const ViewDetailProduct({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final _firestore = FirebaseFirestore.instance;
    final User? _user = FirebaseAuth.instance.currentUser;
    final mediaContainerSearchHeight = (mediaQueryHeight * 0.15);

    Future addCart() async {
      await _firestore.collection('keranjang').add({
        'nama_produk': data['nama_produk'],
        'harga_produk': data['harga_produk'],
        'image_url': data['image_url'],
        'user_id': _user!.uid,
      });
    }

    void showInsufficientBalanceDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Saldo Tidak Cukup'),
            content: Text(
                'Maaf, saldo Anda tidak mencukupi untuk melakukan pembelian.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context); // Menutup dialog
                },
              ),
            ],
          );
        },
      );
    }

    Future<void> beliProduk(
        String userId, String productId, num hargaProduk) async {
      // Mendapatkan referensi koleksi topup
      CollectionReference topupRef =
          FirebaseFirestore.instance.collection('topup');

      try {
        // Memulai transaksi batch
        WriteBatch batch = FirebaseFirestore.instance.batch();

        // Mengambil data topup saat ini berdasarkan ID pengguna
        QuerySnapshot topupQuerySnapshot =
            await topupRef.where('uid', isEqualTo: userId).get();
        if (topupQuerySnapshot.size == 1) {
          DocumentSnapshot topupSnapshot = topupQuerySnapshot.docs[0];
          Map<String, dynamic>? topupData =
              topupSnapshot.data() as Map<String, dynamic>?;
          if (topupData != null) {
            num saldo = topupData['amount'] ?? 0.0;

            // Memeriksa apakah saldo cukup untuk membeli produk
            if (saldo >= hargaProduk) {
              // Mengurangi saldo dengan harga produk
              num saldoBaru = saldo - hargaProduk;

              // Memperbarui saldo di koleksi topup
              batch.update(topupSnapshot.reference, {'amount': saldoBaru});

              // Menandai produk sebagai sudah dibeli di koleksi produk

              // Menyimpan perubahan menggunakan transaksi batch
              await batch.commit();

              print('Pembelian produk berhasil');
            } else {
              showInsufficientBalanceDialog(context);
              print('Saldo tidak cukup');
            }
          }
        } else {
          print('Data topup tidak ditemukan');
        }
      } catch (e) {
        print('Terjadi kesalahan: $e');
      }
    }

    final myAppBar = AppBar(
        title: SizedBox(
            width: mediaQueryWidth * 0.68,
            height: mediaContainerSearchHeight * 0.50,
            child: Center(
              child: SizedBox(
                width: mediaQueryWidth * 0.68,
                height: mediaContainerSearchHeight * 0.35,
                child: const TextField(
                  showCursor: true,
                  cursorHeight: 20,
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                    hintText: 'Pubg Mobile 2023',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      borderSide: BorderSide(
                        color: Color(0xFFEE4532),
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5)),
                      borderSide: BorderSide(
                        color: Color(0xFFEE4532),
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
            )),
        backgroundColor: Colors.white,
        leading: Container(
          child: InkWell(
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
                    return NavAppBar();
                  },
                ),
              );
            },
          ),
        ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: myAppBar,
        body: ListView(
          children: [
            Container(
              width: mediaQueryWidth,
              height: mediaQueryHeight * 0.4,
              color: Colors.grey,
              child: Center(
                child: Image.network(
                  data['image_url'],
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: mediaQueryWidth,
              height: mediaQueryHeight * 0.2,
              color: const Color.fromARGB(255, 214, 214, 214),
              child: Column(
                children: [
                  Container(
                    width: mediaQueryWidth,
                    height: mediaQueryHeight * 0.01,
                    color: const Color.fromARGB(255, 214, 214, 214),
                  ),
                  Container(
                    width: mediaQueryWidth,
                    height: mediaQueryHeight * 0.11,
                    color: Colors.white,
                    child: Center(
                      child: SizedBox(
                        width: mediaQueryWidth * 0.9,
                        height: mediaQueryHeight * 0.08,
                        // color: Color.fromARGB(255, 214, 22, 22),
                        child: Text(
                          data['nama_produk'],
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: mediaQueryWidth,
                    height: mediaQueryHeight * 0.07,
                    color: Colors.white,
                    child: Center(
                      child: SizedBox(
                        width: mediaQueryWidth * 0.9,
                        height: mediaQueryHeight * 0.08,
                        // color: Color.fromARGB(255, 214, 22, 22),
                        child: Text(
                          data['harga_produk'].toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            color: Color(0xFFEE4532),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: mediaQueryWidth,
              height: mediaQueryHeight * 0.1,
              // color: Colors.amber,
              child: const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xFFEE4532),
                  radius: 40,
                ),
                title: Text('Seller1'),
                subtitle: Text('Kota Bandung'),
                trailing: Text(
                  'Kunjungi Toko',
                  style: TextStyle(
                    color: Color(0xFFEE4532),
                  ),
                ),
              ),
            ),
            Container(
              width: mediaQueryWidth,
              height: mediaQueryHeight * 0.01,
              color: const Color.fromARGB(255, 214, 214, 214),
            ),
            Container(
                width: mediaQueryWidth,
                height: 50,
                color: Colors.white,
                child: Row(
                  children: [
                    SizedBox(
                      width: mediaQueryWidth * 0.4,
                      height: 50,
                      // color: Colors.red,
                      child: const Center(
                        child: Text(
                          'Deskripsi',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              width: mediaQueryWidth,
              height: mediaQueryHeight * 0.2,
              // color: Color.fromARGB(255, 232, 42, 42),
              child: Center(
                  child: Container(
                width: mediaQueryWidth * 0.9,
                height: mediaQueryHeight * 0.2,
                color: Colors.white,
                child: Text(
                  data['deskripsi_produk'],
                ),
              )),
            ),
            Container(
              width: mediaQueryWidth,
              height: mediaQueryHeight * 0.07,
              color: Colors.red,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      addCart();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const CartApp();
                          },
                        ),
                      );
                    },
                    child: Container(
                      width: mediaQueryWidth * 0.5,
                      height: mediaQueryHeight * 0.07,
                      color: const Color.fromARGB(255, 12, 150, 56),
                      child: const Center(
                        child: Icon(
                          Icons.add_shopping_cart,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      width: mediaQueryWidth * 0.5,
                      height: mediaQueryHeight * 0.07,
                      color: const Color(0xFFEE4532),
                      child: const Center(
                        child: Text(
                          'Beli',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    onTap: () {
                      beliProduk(data['user_id'], data['deskripsi_produk'],
                          data['harga_produk']);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) {
                      //       return const InvoiceApp();
                      //     },
                      //   ),
                      // );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
