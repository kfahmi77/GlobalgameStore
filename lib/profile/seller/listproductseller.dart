import 'package:flutter/material.dart';
import 'package:globalgamestore/profile/profile.dart';
import 'package:globalgamestore/profile/seller/viewdetailproductseller.dart';

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
  @override
  Widget build(BuildContext context) {
  List<Tab> myTab = [
    const Tab(text: 'Daftar Produk',),
    const Tab(text: 'Dalam Proses',),
    const Tab(text: 'Selesai',),
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
                fontWeight: FontWeight.w400
              ),
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
            )
          ),
          body: TabBarView(
            children: [
              // Center(
              //   child: Text('Tidak Ada'),
              // ),
              Container(
                height: mediaQueryHeight,
                width: mediaQueryWidth,
                color: const Color.fromARGB(255, 223, 223, 223),
                child: ListView(
                  children: [
                    InkWell(
                      child: Container(
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
                                  child: Image.asset(
                                    'assets/images/Pubg1.png'
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: mediaQueryWidth * 0.6,
                              height: mediaQueryHeight * 0.2,
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Container(
                                    width: mediaQueryWidth * 0.6,
                                    height: mediaQueryHeight * 0.14,
                                    // color: Colors.red,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: mediaQueryWidth * 0.6,
                                          height: mediaQueryHeight * 0.07,
                                          // color: Colors.green,
                                          child: Center(
                                            child: Container(
                                              padding: const EdgeInsets.only(left: 15),
                                              width: mediaQueryWidth * 0.6,
                                              height: mediaQueryHeight * 0.04,
                                              // color: Colors.red,
                                              child: const Text(
                                                'Pubg Mobile',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w300
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: mediaQueryWidth * 0.6,
                                          height: mediaQueryHeight * 0.07,
                                          // color: Color.fromARGB(255, 76, 97, 175),
                                          child: Center(
                                            child: Container(
                                              padding: const EdgeInsets.only(left: 15),
                                              width: mediaQueryWidth * 0.6,
                                              height: mediaQueryHeight * 0.04,
                                              // color: Colors.red,
                                              child: const Text(
                                                'Rp128.000',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
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
                                  Container(
                                    width: mediaQueryWidth * 0.6,
                                    height: mediaQueryHeight * 0.06,
                                    // color: Color.fromARGB(255, 76, 97, 175),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: mediaQueryWidth * 0.3,
                                          height: mediaQueryHeight * 0.06,
                                          // color: Color.fromARGB(255, 20, 170, 43),
                                          child: Center(
                                            child: Container(
                                              width: mediaQueryWidth * 0.28,
                                              height: mediaQueryHeight * 0.05,
                                              decoration: BoxDecoration(
                                              color: const Color(0xFFEE4532),
                                                borderRadius: BorderRadius.circular(5)
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  'Hapus',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: mediaQueryWidth * 0.3,
                                          height: mediaQueryHeight * 0.06,
                                          // color: Color.fromARGB(255, 170, 123, 20),
                                          child: Center(
                                            child: Container(
                                              width: mediaQueryWidth * 0.28,
                                              height: mediaQueryHeight * 0.05,
                                              decoration: BoxDecoration(
                                              color: const Color(0xFFEE4532),
                                                borderRadius: BorderRadius.circular(5)
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  'Edit',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white
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
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const ViewDetailProductSellerApp();
                              },
                            ),
                        );
                      },
                    ),
                    const SizedBox(height: 10,),
                    Container(
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
                                child: Image.asset(
                                  'assets/images/Pubg1.png'
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: mediaQueryWidth * 0.6,
                            height: mediaQueryHeight * 0.2,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Container(
                                  width: mediaQueryWidth * 0.6,
                                  height: mediaQueryHeight * 0.14,
                                  // color: Colors.red,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: mediaQueryWidth * 0.6,
                                        height: mediaQueryHeight * 0.07,
                                        // color: Colors.green,
                                        child: Center(
                                          child: Container(
                                            padding: const EdgeInsets.only(left: 15),
                                            width: mediaQueryWidth * 0.6,
                                            height: mediaQueryHeight * 0.04,
                                            // color: Colors.red,
                                            child: const Text(
                                              'Pubg Mobile',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: mediaQueryWidth * 0.6,
                                        height: mediaQueryHeight * 0.07,
                                        // color: Color.fromARGB(255, 76, 97, 175),
                                        child: Center(
                                          child: Container(
                                            padding: const EdgeInsets.only(left: 15),
                                            width: mediaQueryWidth * 0.6,
                                            height: mediaQueryHeight * 0.04,
                                            // color: Colors.red,
                                            child: const Text(
                                              'Rp128.000',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
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
                                Container(
                                  width: mediaQueryWidth * 0.6,
                                  height: mediaQueryHeight * 0.06,
                                  // color: Color.fromARGB(255, 76, 97, 175),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: mediaQueryWidth * 0.3,
                                        height: mediaQueryHeight * 0.06,
                                        // color: Color.fromARGB(255, 20, 170, 43),
                                        child: Center(
                                          child: Container(
                                            width: mediaQueryWidth * 0.28,
                                            height: mediaQueryHeight * 0.05,
                                            decoration: BoxDecoration(
                                            color: const Color(0xFFEE4532),
                                              borderRadius: BorderRadius.circular(5)
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'Hapus',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: mediaQueryWidth * 0.3,
                                        height: mediaQueryHeight * 0.06,
                                        // color: Color.fromARGB(255, 170, 123, 20),
                                        child: Center(
                                          child: Container(
                                            width: mediaQueryWidth * 0.28,
                                            height: mediaQueryHeight * 0.05,
                                            decoration: BoxDecoration(
                                            color: const Color(0xFFEE4532),
                                              borderRadius: BorderRadius.circular(5)
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'Edit',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white
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
                    ),
                    const SizedBox(height: 10,),
                    Container(
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
                                child: Image.asset(
                                  'assets/images/Pubg1.png'
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: mediaQueryWidth * 0.6,
                            height: mediaQueryHeight * 0.2,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Container(
                                  width: mediaQueryWidth * 0.6,
                                  height: mediaQueryHeight * 0.14,
                                  // color: Colors.red,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: mediaQueryWidth * 0.6,
                                        height: mediaQueryHeight * 0.07,
                                        // color: Colors.green,
                                        child: Center(
                                          child: Container(
                                            padding: const EdgeInsets.only(left: 15),
                                            width: mediaQueryWidth * 0.6,
                                            height: mediaQueryHeight * 0.04,
                                            // color: Colors.red,
                                            child: const Text(
                                              'Pubg Mobile',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: mediaQueryWidth * 0.6,
                                        height: mediaQueryHeight * 0.07,
                                        // color: Color.fromARGB(255, 76, 97, 175),
                                        child: Center(
                                          child: Container(
                                            padding: const EdgeInsets.only(left: 15),
                                            width: mediaQueryWidth * 0.6,
                                            height: mediaQueryHeight * 0.04,
                                            // color: Colors.red,
                                            child: const Text(
                                              'Rp128.000',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
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
                                Container(
                                  width: mediaQueryWidth * 0.6,
                                  height: mediaQueryHeight * 0.06,
                                  // color: Color.fromARGB(255, 76, 97, 175),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: mediaQueryWidth * 0.3,
                                        height: mediaQueryHeight * 0.06,
                                        // color: Color.fromARGB(255, 20, 170, 43),
                                        child: Center(
                                          child: Container(
                                            width: mediaQueryWidth * 0.28,
                                            height: mediaQueryHeight * 0.05,
                                            decoration: BoxDecoration(
                                            color: const Color(0xFFEE4532),
                                              borderRadius: BorderRadius.circular(5)
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'Hapus',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: mediaQueryWidth * 0.3,
                                        height: mediaQueryHeight * 0.06,
                                        // color: Color.fromARGB(255, 170, 123, 20),
                                        child: Center(
                                          child: Container(
                                            width: mediaQueryWidth * 0.28,
                                            height: mediaQueryHeight * 0.05,
                                            decoration: BoxDecoration(
                                            color: const Color(0xFFEE4532),
                                              borderRadius: BorderRadius.circular(5)
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'Edit',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white
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
                    ),
                    const SizedBox(height: 10,),
                    Container(
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
                                child: Image.asset(
                                  'assets/images/Pubg1.png'
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: mediaQueryWidth * 0.6,
                            height: mediaQueryHeight * 0.2,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Container(
                                  width: mediaQueryWidth * 0.6,
                                  height: mediaQueryHeight * 0.14,
                                  // color: Colors.red,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: mediaQueryWidth * 0.6,
                                        height: mediaQueryHeight * 0.07,
                                        // color: Colors.green,
                                        child: Center(
                                          child: Container(
                                            padding: const EdgeInsets.only(left: 15),
                                            width: mediaQueryWidth * 0.6,
                                            height: mediaQueryHeight * 0.04,
                                            // color: Colors.red,
                                            child: const Text(
                                              'Pubg Mobile',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: mediaQueryWidth * 0.6,
                                        height: mediaQueryHeight * 0.07,
                                        // color: Color.fromARGB(255, 76, 97, 175),
                                        child: Center(
                                          child: Container(
                                            padding: const EdgeInsets.only(left: 15),
                                            width: mediaQueryWidth * 0.6,
                                            height: mediaQueryHeight * 0.04,
                                            // color: Colors.red,
                                            child: const Text(
                                              'Rp128.000',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
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
                                Container(
                                  width: mediaQueryWidth * 0.6,
                                  height: mediaQueryHeight * 0.06,
                                  // color: Color.fromARGB(255, 76, 97, 175),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: mediaQueryWidth * 0.3,
                                        height: mediaQueryHeight * 0.06,
                                        // color: Color.fromARGB(255, 20, 170, 43),
                                        child: Center(
                                          child: Container(
                                            width: mediaQueryWidth * 0.28,
                                            height: mediaQueryHeight * 0.05,
                                            decoration: BoxDecoration(
                                            color: const Color(0xFFEE4532),
                                              borderRadius: BorderRadius.circular(5)
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'Hapus',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: mediaQueryWidth * 0.3,
                                        height: mediaQueryHeight * 0.06,
                                        // color: Color.fromARGB(255, 170, 123, 20),
                                        child: Center(
                                          child: Container(
                                            width: mediaQueryWidth * 0.28,
                                            height: mediaQueryHeight * 0.05,
                                            decoration: BoxDecoration(
                                            color: const Color(0xFFEE4532),
                                              borderRadius: BorderRadius.circular(5)
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'Edit',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white
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
                    ),
                    const SizedBox(height: 10,),
                    Container(
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
                                child: Image.asset(
                                  'assets/images/Pubg1.png'
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: mediaQueryWidth * 0.6,
                            height: mediaQueryHeight * 0.2,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Container(
                                  width: mediaQueryWidth * 0.6,
                                  height: mediaQueryHeight * 0.14,
                                  // color: Colors.red,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: mediaQueryWidth * 0.6,
                                        height: mediaQueryHeight * 0.07,
                                        // color: Colors.green,
                                        child: Center(
                                          child: Container(
                                            padding: const EdgeInsets.only(left: 15),
                                            width: mediaQueryWidth * 0.6,
                                            height: mediaQueryHeight * 0.04,
                                            // color: Colors.red,
                                            child: const Text(
                                              'Pubg Mobile',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: mediaQueryWidth * 0.6,
                                        height: mediaQueryHeight * 0.07,
                                        // color: Color.fromARGB(255, 76, 97, 175),
                                        child: Center(
                                          child: Container(
                                            padding: const EdgeInsets.only(left: 15),
                                            width: mediaQueryWidth * 0.6,
                                            height: mediaQueryHeight * 0.04,
                                            // color: Colors.red,
                                            child: const Text(
                                              'Rp128.000',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
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
                                Container(
                                  width: mediaQueryWidth * 0.6,
                                  height: mediaQueryHeight * 0.06,
                                  // color: Color.fromARGB(255, 76, 97, 175),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: mediaQueryWidth * 0.3,
                                        height: mediaQueryHeight * 0.06,
                                        // color: Color.fromARGB(255, 20, 170, 43),
                                        child: Center(
                                          child: Container(
                                            width: mediaQueryWidth * 0.28,
                                            height: mediaQueryHeight * 0.05,
                                            decoration: BoxDecoration(
                                            color: const Color(0xFFEE4532),
                                              borderRadius: BorderRadius.circular(5)
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'Hapus',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: mediaQueryWidth * 0.3,
                                        height: mediaQueryHeight * 0.06,
                                        // color: Color.fromARGB(255, 170, 123, 20),
                                        child: Center(
                                          child: Container(
                                            width: mediaQueryWidth * 0.28,
                                            height: mediaQueryHeight * 0.05,
                                            decoration: BoxDecoration(
                                            color: const Color(0xFFEE4532),
                                              borderRadius: BorderRadius.circular(5)
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'Edit',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white
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
                    )
                  ],
                ),
              ),
              //Dalam Proses
              Container(
                height: mediaQueryHeight,
                width: mediaQueryWidth,
                color: const Color.fromARGB(255, 223, 223, 223),
                child: ListView(
                  children: [
                    Container(
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
                                child: Image.asset(
                                  'assets/images/Pubg1.png'
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: mediaQueryWidth * 0.6,
                            height: mediaQueryHeight * 0.2,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Container(
                                  width: mediaQueryWidth * 0.6,
                                  height: mediaQueryHeight * 0.14,
                                  // color: Colors.red,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: mediaQueryWidth * 0.6,
                                        height: mediaQueryHeight * 0.07,
                                        // color: Colors.green,
                                        child: Center(
                                          child: Container(
                                            padding: const EdgeInsets.only(left: 15),
                                            width: mediaQueryWidth * 0.6,
                                            height: mediaQueryHeight * 0.04,
                                            // color: Colors.red,
                                            child: const Text(
                                              'Pubg Mobile',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: mediaQueryWidth * 0.6,
                                        height: mediaQueryHeight * 0.07,
                                        // color: Color.fromARGB(255, 76, 97, 175),
                                        child: Center(
                                          child: Container(
                                            padding: const EdgeInsets.only(left: 15),
                                            width: mediaQueryWidth * 0.6,
                                            height: mediaQueryHeight * 0.04,
                                            // color: Colors.red,
                                            child: const Text(
                                              'Rp128.000',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
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
                                Container(
                                  width: mediaQueryWidth * 0.6,
                                  height: mediaQueryHeight * 0.06,
                                  // color: Color.fromARGB(255, 76, 97, 175),
                                  child: Center(
                                    child: Container(
                                        width: mediaQueryWidth * 0.4,
                                        height: mediaQueryHeight * 0.06,
                                        // color: Color.fromARGB(255, 170, 123, 20),
                                        child: Center(
                                          child: Container(
                                            width: mediaQueryWidth * 0.4,
                                            height: mediaQueryHeight * 0.05,
                                            decoration: BoxDecoration(
                                            color: const Color(0xFFEE4532),
                                              borderRadius: BorderRadius.circular(5)
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'Verifikasi Penjualan',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ),
                                  )
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                  ],
                ),
              ),
              //selesai
              const Center(
                child: Text('Selesai'),
              ),
            ]
          ),
        ),
      ),
    );
  }
}