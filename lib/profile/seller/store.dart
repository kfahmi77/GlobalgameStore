import 'package:flutter/material.dart';
import 'package:globalgamestore/profile/profile.dart';
import 'package:globalgamestore/profile/seller/addproduct.dart';
import 'package:globalgamestore/profile/seller/listproductseller.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Store();
  }
}

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {

    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Toko Saya',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w400
            ),
          ),
          // backgroundColor: Colors.white,
          backgroundColor: const Color(0xFFEE4532),
          leading: Container(
            child: InkWell(
              child: const Icon(
                Icons.arrow_back_outlined,
                size: 28,
                color: Colors.white,
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
          )
        ),
        body: ListView(
          children: [
            InkWell(
              child: Container(
                width: mediaQueryWidth,
                height: mediaQueryHeight * 0.07,
                decoration: BoxDecoration(
                color: Colors.white,
                  border: Border.all(
                    color: const Color.fromARGB(255, 211, 211, 211)
                  )
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: mediaQueryWidth * 0.12,
                      height: mediaQueryHeight * 0.07,
                      // color: Colors.red,
                      child: const Center(
                        child: Icon(Icons.add_business_outlined),
                      ),
                    ),
                    SizedBox(
                      width: mediaQueryWidth * 0.79,
                      height: mediaQueryHeight * 0.07,
                      // color: Colors.green,
                      child: Center(
                        child: SizedBox(
                          width: mediaQueryWidth * 0.79,
                          height: mediaQueryHeight * 0.02,
                          // color: Color.fromARGB(255, 76, 76, 175),
                          child: Row(
                            children: [
                              SizedBox(
                                width: mediaQueryWidth * 0.3,
                                height: mediaQueryHeight * 0.02,
                                // color: Colors.amber,
                                child: const Text(
                                  'Tambah Produk'
                                ),
                              )
                            ],
                          ),
                        )
                      ),
                    ),
                    SizedBox(
                      width: mediaQueryWidth * 0.08,
                      height: mediaQueryHeight * 0.07,
                      // color: Colors.amber,
                      child: const Center(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
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
                        return const AddProductApp();
                      },
                    ),
                );
              },
            ),
            InkWell(
              child: Container(
                width: mediaQueryWidth,
                height: mediaQueryHeight * 0.07,
                decoration: BoxDecoration(
                color: Colors.white,
                  border: Border.all(
                    color: const Color.fromARGB(255, 211, 211, 211)
                  )
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: mediaQueryWidth * 0.12,
                      height: mediaQueryHeight * 0.07,
                      // color: Colors.red,
                      child: const Center(
                        child: Icon(Icons.folder_copy_outlined),
                      ),
                    ),
                    SizedBox(
                      width: mediaQueryWidth * 0.79,
                      height: mediaQueryHeight * 0.07,
                      // color: Colors.green,
                      child: Center(
                        child: SizedBox(
                          width: mediaQueryWidth * 0.79,
                          height: mediaQueryHeight * 0.02,
                          // color: Color.fromARGB(255, 76, 76, 175),
                          child: Row(
                            children: [
                              SizedBox(
                                width: mediaQueryWidth * 0.4,
                                height: mediaQueryHeight * 0.02,
                                // color: Colors.amber,
                                child: const Text(
                                  'Daftar Produk Penjualan'
                                ),
                              )
                            ],
                          ),
                        )
                      ),
                    ),
                    SizedBox(
                      width: mediaQueryWidth * 0.08,
                      height: mediaQueryHeight * 0.07,
                      // color: Colors.amber,
                      child: const Center(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
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
                        return const ListProductsSellerApp();
                      },
                    ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}