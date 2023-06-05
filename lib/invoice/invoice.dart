import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:globalgamestore/common/rupiah_convert.dart';
import 'package:globalgamestore/navigation/navigation.dart';

class InvoiceApp extends StatelessWidget {
  final Map<String, dynamic> data;
  InvoiceApp({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Invoice(
      data: data,
    );
  }
}

class Invoice extends StatelessWidget {
  final Map<String, dynamic> data;
  Invoice({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    User? user = FirebaseAuth.instance.currentUser;
    final firestore = FirebaseFirestore.instance;
    void showInsufficientBalanceDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Saldo Tidak Cukup'),
            content: const Text(
                'Maaf, saldo Anda tidak mencukupi untuk melakukan pembelian.'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context); // Menutup dialog
                },
              ),
            ],
          );
        },
      );
    }

    //function delete product
    Future<void> deleteProduct(String productId) {
      return firestore
          .collection('product')
          .doc(productId)
          .delete()
          .then((value) => print("Product Deleted"))
          .catchError((error) => print("Failed to delete product: $error"));
    }

    Future<void> addRiwayat() async {
      CollectionReference produkRef =
          FirebaseFirestore.instance.collection('riwayat_produk');

      DocumentReference docRef = await produkRef.add({
        'nama_produk': data['nama_produk'],
        'harga_produk': data['harga_produk'],
        'kategori_produk': data['kategori_produk'],
        'kategori_game': data['kategori_game'],
        'image_url': data['image_url'],
        'deskripsi_produk': data['deskripsi_produk']
      });
    }

    void DialogSuccess(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Pembelian Berhasil'),
            content: const Text(
                'Terima kasih telah melakukan pembelian di Global Game Store :)'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () async {
                  await deleteProduct(data['doc_id']);
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
              DialogSuccess(context);
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
      title: const Text(
        'Faktur',
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
      ),
      backgroundColor: Colors.white,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: myAppBar,
        body: SizedBox(
          width: mediaQueryWidth,
          height: mediaQueryHeight,
          // color: Colors.amber,
          child: Column(
            children: [
              Container(
                width: mediaQueryWidth,
                height: mediaQueryHeight * 0.15,
                decoration: BoxDecoration(
                    // color: Color.fromARGB(255, 164, 23, 23),
                    border: Border.all(
                  color: const Color.fromARGB(255, 199, 199, 199),
                  // width: 1,
                )),
                child: Center(
                  child: SizedBox(
                    width: mediaQueryWidth * 0.85,
                    height: mediaQueryHeight * 0.15,
                    // color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          width: mediaQueryWidth * 0.85,
                          height: mediaQueryHeight * 0.04,
                          // color: Colors.red,
                          child: Center(
                            child: Container(
                              width: mediaQueryWidth * 0.85,
                              height: mediaQueryHeight * 0.02,
                              color: Colors.white,
                              child: const Text(
                                'No. Pesanan: 230408JPUKNBT8',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: mediaQueryWidth * 0.85,
                          height: mediaQueryHeight * 0.04,
                          // color: Colors.red,
                          child: Center(
                            child: Container(
                              width: mediaQueryWidth * 0.85,
                              height: mediaQueryHeight * 0.02,
                              color: Colors.white,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: mediaQueryWidth * 0.42,
                                    height: mediaQueryHeight * 0.02,
                                    // color: Color.fromARGB(255, 134, 41, 41),
                                    child: const Text(
                                      'Total Pembayaran :',
                                      style: TextStyle(
                                          // fontWeight: FontWeight.bold
                                          ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: mediaQueryWidth * 0.42,
                                    height: mediaQueryHeight * 0.02,
                                    // color: Color.fromARGB(255, 134, 41, 41),
                                    child: const Text(
                                      'Waktu Pembayaran :',
                                      style: TextStyle(
                                          // fontWeight: FontWeight.bold
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: mediaQueryWidth * 0.85,
                          height: mediaQueryHeight * 0.045,
                          // color: Colors.red,
                          child: Center(
                            child: Container(
                              width: mediaQueryWidth * 0.85,
                              height: mediaQueryHeight * 0.02,
                              color: Colors.white,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: mediaQueryWidth * 0.42,
                                    height: mediaQueryHeight * 0.02,
                                    // color: Color.fromARGB(255, 134, 41, 41),
                                    child: Text(
                                      formatRupiah(data['harga_produk']),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: mediaQueryWidth * 0.42,
                                    height: mediaQueryHeight * 0.02,
                                    // color: Color.fromARGB(255, 134, 41, 41),
                                    child: Text(
                                      DateTime.now().toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
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
                width: mediaQueryWidth,
                height: mediaQueryHeight * 0.15,
                decoration: BoxDecoration(
                    // color: Color.fromARGB(255, 164, 23, 23),
                    border: Border.all(
                  color: const Color.fromARGB(255, 199, 199, 199),
                  // width: 1,
                )),
                child: Center(
                  child: SizedBox(
                    width: mediaQueryWidth * 0.85,
                    height: mediaQueryHeight * 0.15,
                    // color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          width: mediaQueryWidth * 0.85,
                          height: mediaQueryHeight * 0.04,
                          // color: Colors.red,
                          child: Center(
                            child: Container(
                              width: mediaQueryWidth * 0.85,
                              height: mediaQueryHeight * 0.02,
                              color: Colors.white,
                              child: const Text(
                                'Metode Pembayaran : GGPay',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: mediaQueryWidth,
                height: mediaQueryHeight * 0.15,
                decoration: BoxDecoration(
                    // color: Color.fromARGB(255, 164, 23, 23),
                    border: Border.all(
                  color: const Color.fromARGB(255, 199, 199, 199),
                  // width: 1,
                )),
                child: Center(
                  child: SizedBox(
                    width: mediaQueryWidth * 0.85,
                    height: mediaQueryHeight * 0.15,
                    // color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          width: mediaQueryWidth * 0.85,
                          height: mediaQueryHeight * 0.04,
                          // color: Colors.red,
                          child: Center(
                            child: Container(
                              width: mediaQueryWidth * 0.85,
                              height: mediaQueryHeight * 0.02,
                              color: Colors.white,
                              child: const Text(
                                'Rincian Pesanan',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: mediaQueryWidth * 0.85,
                          height: mediaQueryHeight * 0.04,
                          // color: Colors.red,
                          child: Center(
                            child: Container(
                              width: mediaQueryWidth * 0.85,
                              height: mediaQueryHeight * 0.02,
                              color: Colors.white,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: mediaQueryWidth * 0.42,
                                    height: mediaQueryHeight * 0.02,
                                    // color: Color.fromARGB(255, 134, 41, 41),
                                    child: const Text(
                                      'Nama Produk :',
                                      style: TextStyle(
                                          // fontWeight: FontWeight.bold
                                          ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: mediaQueryWidth * 0.42,
                                    height: mediaQueryHeight * 0.02,
                                    // color: Color.fromARGB(255, 134, 41, 41),
                                    child: Text(
                                      data['nama_produk'],
                                      style: TextStyle(
                                          // fontWeight: FontWeight.bold
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: mediaQueryWidth * 0.85,
                          height: mediaQueryHeight * 0.045,
                          // color: Colors.red,
                          child: Center(
                            child: Container(
                              width: mediaQueryWidth * 0.85,
                              height: mediaQueryHeight * 0.02,
                              color: Colors.white,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: mediaQueryWidth * 0.42,
                                    height: mediaQueryHeight * 0.02,
                                    // color: Color.fromARGB(255, 134, 41, 41),
                                    child: const Text(
                                      'Categori :',
                                      style: TextStyle(
                                          // fontWeight: FontWeight.bold
                                          ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: mediaQueryWidth * 0.42,
                                    height: mediaQueryHeight * 0.02,
                                    // color: Color.fromARGB(255, 134, 41, 41),
                                    child: Text(
                                      data['kategori_produk'],
                                      style: TextStyle(
                                          // fontWeight: FontWeight.bold
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: mediaQueryWidth,
                height: mediaQueryHeight * 0.15,
                decoration: BoxDecoration(
                    // color: Color.fromARGB(255, 164, 23, 23),
                    border: Border.all(
                  color: const Color.fromARGB(255, 199, 199, 199),
                  // width: 1,
                )),
                child: Center(
                  child: SizedBox(
                    width: mediaQueryWidth * 0.85,
                    height: mediaQueryHeight * 0.15,
                    // color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          width: mediaQueryWidth * 0.85,
                          height: mediaQueryHeight * 0.04,
                          // color: Colors.red,
                          child: Center(
                            child: Container(
                              width: mediaQueryWidth * 0.85,
                              height: mediaQueryHeight * 0.02,
                              color: Colors.white,
                              child: const Text(
                                'Subtotal untuk Produk',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: mediaQueryWidth * 0.85,
                          height: mediaQueryHeight * 0.04,
                          // color: Colors.red,
                          child: Center(
                            child: Container(
                              width: mediaQueryWidth * 0.85,
                              height: mediaQueryHeight * 0.02,
                              color: Colors.white,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: mediaQueryWidth * 0.42,
                                    height: mediaQueryHeight * 0.02,
                                    // color: Color.fromARGB(255, 134, 41, 41),
                                    child: const Text(
                                      'Harga :',
                                      style: TextStyle(
                                          // fontWeight: FontWeight.bold
                                          ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: mediaQueryWidth * 0.42,
                                    height: mediaQueryHeight * 0.02,
                                    // color: Color.fromARGB(255, 134, 41, 41),
                                    child: Text(
                                      formatRupiah(data['harga_produk']),
                                      style: TextStyle(
                                          // fontWeight: FontWeight.bold
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: mediaQueryWidth * 0.85,
                          height: mediaQueryHeight * 0.045,
                          // color: Colors.red,
                          child: Center(
                            child: Container(
                              width: mediaQueryWidth * 0.85,
                              height: mediaQueryHeight * 0.02,
                              color: Colors.white,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: mediaQueryWidth * 0.42,
                                    height: mediaQueryHeight * 0.02,
                                    // color: Color.fromARGB(255, 134, 41, 41),
                                    child: const Text(
                                      'Total Pembayaran :',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: mediaQueryWidth * 0.42,
                                    height: mediaQueryHeight * 0.02,
                                    // color: Color.fromARGB(255, 134, 41, 41),
                                    child: Text(
                                      formatRupiah(data['harga_produk']),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                child: SizedBox(
                  width: mediaQueryWidth,
                  height: mediaQueryHeight * 0.1,
                  // color: Colors.amber,
                  child: Center(
                    child: Container(
                      width: mediaQueryWidth * 0.3,
                      height: mediaQueryHeight * 0.05,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          'Selesai',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                onTap: () async {
                  beliProduk(user!.uid, data['deskripsi_produk'],
                      data['harga_produk']);
                  await addRiwayat();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
