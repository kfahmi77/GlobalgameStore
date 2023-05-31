import 'package:flutter/material.dart';
import 'package:globalgamestore/navigation/navigation.dart';
import 'package:globalgamestore/profile/seller/viewdetailsellersliderscreen.dart';

class ViewDetailProductSellerApp extends StatelessWidget {
  const ViewDetailProductSellerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ViewDetailProductSeller();
  }
}

class ViewDetailProductSeller extends StatelessWidget {
  const ViewDetailProductSeller({super.key});

  @override
  Widget build(BuildContext context) {

    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    final mediaContainerSearchHeight = (mediaQueryHeight * 0.15 );

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
                          bottomLeft: Radius.circular(5)
                        ),
                        borderSide: BorderSide(
                          color: Color(0xFFEE4532),
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ),
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
                          return const NavAppBar();
                        },
                      ),
                  );
                },
              ),
            )
          );

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
              child: const Center(
                child: ViewDetailSliderScreenApp(),
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
                        child: const Text(
                          'Pubg Mobile Murah',
                          style: TextStyle(
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
                        child: const Text(
                          'Rp128.000',
                          style: TextStyle(
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
                title: Text(
                  'Seller1'
                ),
                subtitle: Text(
                  'Kota Bandung'
                ),
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
                            color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ),
            SizedBox(
              width: mediaQueryWidth,
              height: mediaQueryHeight * 0.2,
              // color: Color.fromARGB(255, 232, 42, 42),
              child: Center(
                child: Container(
                  width: mediaQueryWidth * 0.9,
                  height: mediaQueryHeight * 0.2,
                  color: Colors.white,
                  child: const Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
                  ),
                ),
              ),
            ),
            Container(
              width: mediaQueryWidth,
              height: mediaQueryHeight * 0.07,
              color: Colors.red,
              child: Row(
                children: [
                  Container(
                    width: mediaQueryWidth * 0.5,
                    height: mediaQueryHeight * 0.07,
                    color: const Color.fromARGB(255, 12, 150, 56),
                    child: const Center(
                      child: Text('Hapus'),
                    ),
                  ),
                  Container(
                    width: mediaQueryWidth * 0.5,
                    height: mediaQueryHeight * 0.07,
                    color: const Color(0xFFEE4532),
                    child: const Center(
                      child: Text(
                        'Edit',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white
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
    );
  }
}