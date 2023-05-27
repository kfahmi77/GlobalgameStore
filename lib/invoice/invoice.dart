import 'package:flutter/material.dart';
import 'package:globalgamestore/navigation/navigation.dart';

class InvoiceApp extends StatelessWidget {
  const InvoiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Invoice();
  }
}

class Invoice extends StatelessWidget {
  const Invoice({super.key});

  @override
  Widget build(BuildContext context) {

    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    final myAppBar = AppBar(
          title: const Text(
            'Faktur',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w400
            ),
          ),
          backgroundColor: Colors.white,
        );
          
    final bodyHeight = mediaQueryHeight - myAppBar.preferredSize.height - MediaQuery.of(context).padding.top;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: myAppBar,
        body: Container(
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
                  )
                ),
                child: Center(
                  child: Container(
                    width: mediaQueryWidth * 0.85,
                    height: mediaQueryHeight * 0.15,
                    // color: Colors.white,
                    child: Column(
                      children: [
                        Container(
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
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
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
                                  Container(
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
                                  Container(
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
                        Container(
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
                                  Container(
                                    width: mediaQueryWidth * 0.42,
                                    height: mediaQueryHeight * 0.02,
                                    // color: Color.fromARGB(255, 134, 41, 41),
                                    child: const Text(
                                      'Rp214.000',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: mediaQueryWidth * 0.42,
                                    height: mediaQueryHeight * 0.02,
                                    // color: Color.fromARGB(255, 134, 41, 41),
                                    child: const Text(
                                      '08/04/2023',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold
                                      ),
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
                  )
                ),
                child: Center(
                  child: Container(
                    width: mediaQueryWidth * 0.85,
                    height: mediaQueryHeight * 0.15,
                    // color: Colors.white,
                    child: Column(
                      children: [
                        Container(
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
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
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
                  )
                ),
                child: Center(
                  child: Container(
                    width: mediaQueryWidth * 0.85,
                    height: mediaQueryHeight * 0.15,
                    // color: Colors.white,
                    child: Column(
                      children: [
                        Container(
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
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
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
                                  Container(
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
                                  Container(
                                    width: mediaQueryWidth * 0.42,
                                    height: mediaQueryHeight * 0.02,
                                    // color: Color.fromARGB(255, 134, 41, 41),
                                    child: const Text(
                                      'Pubg Mobile',
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
                        Container(
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
                                  Container(
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
                                  Container(
                                    width: mediaQueryWidth * 0.42,
                                    height: mediaQueryHeight * 0.02,
                                    // color: Color.fromARGB(255, 134, 41, 41),
                                    child: const Text(
                                      'Mobile',
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
                  )
                ),
                child: Center(
                  child: Container(
                    width: mediaQueryWidth * 0.85,
                    height: mediaQueryHeight * 0.15,
                    // color: Colors.white,
                    child: Column(
                      children: [
                        Container(
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
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
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
                                  Container(
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
                                  Container(
                                    width: mediaQueryWidth * 0.42,
                                    height: mediaQueryHeight * 0.02,
                                    // color: Color.fromARGB(255, 134, 41, 41),
                                    child: const Text(
                                      '214.000',
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
                        Container(
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
                                  Container(
                                    width: mediaQueryWidth * 0.42,
                                    height: mediaQueryHeight * 0.02,
                                    // color: Color.fromARGB(255, 134, 41, 41),
                                    child: const Text(
                                      'Total Pembayaran :',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: mediaQueryWidth * 0.42,
                                    height: mediaQueryHeight * 0.02,
                                    // color: Color.fromARGB(255, 134, 41, 41),
                                    child: const Text(
                                      'Rp214.000',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold
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
              InkWell(
                child: Container(
                  width: mediaQueryWidth,
                  height: mediaQueryHeight * 0.1,
                  // color: Colors.amber,
                  child: Center(
                    child: Container(
                      width: mediaQueryWidth * 0.3,
                      height: mediaQueryHeight * 0.05,
                      decoration: BoxDecoration(
                      color: Colors.red,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Center(
                        child: Text(
                          'Selesai',
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}