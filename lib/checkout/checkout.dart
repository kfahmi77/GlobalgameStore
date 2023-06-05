import 'package:flutter/material.dart';

import '../common/rupiah_convert.dart';
import '../invoice/invoice.dart';

class CheckOutPage extends StatelessWidget {
  final Map<String, dynamic> data;
  CheckOutPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final myAppBar = AppBar(
      leading: Icon(Icons.arrow_back),
      title: Text('CheckOut Product'),
      backgroundColor: Colors.red,
    );
    final bodyHeight = mediaQueryHeight -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: myAppBar,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    width: mediaQueryWidth,
                    height: bodyHeight * 0.85,
                    color: Color.fromARGB(255, 234, 234, 234),
                    child: Column(
                      children: [
                        Container(
                          width: mediaQueryWidth * 0.9,
                          height: mediaQueryHeight * 0.07,
                          child: Center(
                            child: Text(
                              'Items',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                        ),
                        Container(
                          width: mediaQueryWidth * 0.9,
                          height: mediaQueryHeight * 0.15,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.red)),
                          child: Row(
                            children: [
                              Container(
                                width: mediaQueryWidth * 0.3,
                                height: mediaQueryHeight * 0.14,
                                child: Image.network(
                                  data['image_url'],
                                  width: mediaQueryWidth * 0.4,
                                ),
                              ),
                              Container(
                                width: mediaQueryWidth * 0.02,
                                height: mediaQueryHeight * 0.14,
                                color: Colors.white,
                              ),
                              Container(
                                width: mediaQueryWidth * 0.55,
                                height: mediaQueryHeight * 0.14,
                                child: Column(
                                  children: [
                                    Container(
                                      width: mediaQueryWidth * 0.55,
                                      height: mediaQueryHeight * 0.04,
                                      child: Center(
                                        child: Container(
                                          width: mediaQueryWidth * 0.55,
                                          height: mediaQueryHeight * 0.03,
                                          child: Text(
                                            data['nama_produk'],
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            bottom: mediaQueryHeight * 0.007)),
                                    Container(
                                      width: mediaQueryWidth * 0.55,
                                      height: mediaQueryHeight * 0.04,
                                      child: Center(
                                        child: Container(
                                          width: mediaQueryWidth * 0.55,
                                          height: mediaQueryHeight * 0.03,
                                          child: Text(
                                            data['kategori_produk'],
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            bottom: mediaQueryHeight * 0.007)),
                                    Container(
                                      width: mediaQueryWidth * 0.55,
                                      height: mediaQueryHeight * 0.04,
                                      child: Center(
                                        child: Container(
                                          width: mediaQueryWidth * 0.55,
                                          height: mediaQueryHeight * 0.03,
                                          child: Text(
                                            formatRupiah(data['harga_produk']),
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                bottom: mediaQueryHeight * 0.02)),
                        Container(
                          width: mediaQueryWidth * 0.9,
                          height: mediaQueryHeight * 0.1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: mediaQueryWidth * 0.8,
                                height: mediaQueryHeight * 0.05,
                                // color: Colors.red,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Total Pembayaran',
                                      style: TextStyle(fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: mediaQueryWidth * 0.8,
                                height: mediaQueryHeight * 0.05,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      formatRupiah(data['harga_produk']),
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.red),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return InvoiceApp(
                            data: data,
                          );
                        },
                      ),
                    );
                  },
                  child: Container(
                    width: mediaQueryWidth,
                    height: bodyHeight * 0.1,
                    color: Color.fromARGB(255, 234, 234, 234),
                    child: Center(
                      child: Container(
                        width: mediaQueryWidth * 0.8,
                        height: mediaQueryHeight * 0.06,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Text(
                            'Beli',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
