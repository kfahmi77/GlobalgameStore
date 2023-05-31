import 'package:flutter/material.dart';
import 'package:globalgamestore/profile/profile.dart';

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


  Pesanan({super.key});
  @override
  Widget build(BuildContext context) {
      List<Tab> myTab = [
    const Tab(text: 'Menunggu Verifikasi',),
    const Tab(text: 'Selesai',),
  ];
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
          body: const TabBarView(
            children: [
              Center(
                child: Text('Tidak Ada'),
              ),
              Center(
                child: Text('Tidak Ada Pesanan Selesai'),
              ),
            ]
          ),
        ),
      ),
    );
  }
}