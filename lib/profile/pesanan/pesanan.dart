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
  List<Tab> myTab = [
    Tab(text: 'Menunggu Verifikasi',),
    Tab(text: 'Selesai',),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: myTab.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Pesanan Saya',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w400
              ),
            ),
            bottom: TabBar(
              tabs: myTab,
              indicatorColor: Color(0xFFEE4532),
              unselectedLabelColor: Colors.black,
              labelColor: Color(0xFFEE4532),
            ),
            backgroundColor: Colors.white,
            leading: Container(
              child: InkWell(
                child: Icon(
                  Icons.arrow_back_outlined,
                  size: 32,
                  color: Color(0xFFEE4532),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ProfileApp();
                        },
                      ),
                  );
                },
              ),
            )
          ),
          body: TabBarView(
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