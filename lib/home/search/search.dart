import 'package:flutter/material.dart';
import 'package:globalgamestore/home/home.dart';
import 'package:globalgamestore/navigation/navigation.dart';

class SearchApp extends StatelessWidget {
  const SearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchMenu(),
    );
  }
}

class SearchMenu extends StatelessWidget {
  const SearchMenu({super.key});

  @override
  Widget build(BuildContext context) {

    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    final mediaContainerSearchHeight = (mediaQueryHeight * 0.15 );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Container(
              width: mediaQueryWidth,
              height: mediaQueryHeight * 0.17,
              decoration: BoxDecoration(
              color: Colors.white,
                border: Border.all(
                  color: const Color.fromARGB(255, 201, 201, 201),
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: mediaQueryWidth,
                    height: MediaQuery.of(context).padding.top,
                    // color: Colors.red,
                  ),
                  Container(
                    width: mediaQueryWidth,
                    height: mediaContainerSearchHeight * 0.50,
                    // color: Colors.red,
                    child: Row(
                      children: [
                        InkWell(
                          child: Container(
                          width: mediaQueryWidth * 0.15,
                          height: mediaContainerSearchHeight * 0.50,
                          // color: Color.fromARGB(255, 73, 54, 244),
                          child: const Icon(
                            Icons.arrow_back_outlined,
                            size: 35,
                            color: Color(0xFFEE4532),
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
                        ),
                        Container(
                          width: mediaQueryWidth * 0.68,
                          height: mediaContainerSearchHeight * 0.50,
                          // color: Colors.amber,
                          child: Center(
                            child: Container(
                              width: mediaQueryWidth * 0.68,
                              height: mediaContainerSearchHeight * 0.35,
                              // color: Colors.red,
                              child: const TextField(
                                showCursor: true,
                                cursorHeight: 20,
                                textAlignVertical: TextAlignVertical.bottom,
                                decoration: InputDecoration(
                                  hintText: 'Gratis Ongkir 2023',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)
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
                        Container(
                          width: mediaQueryWidth * 0.15,
                          height: mediaContainerSearchHeight * 0.50,
                          // color: Colors.green,
                          child: Center(
                            child: Container(
                              width: mediaQueryWidth * 0.15,
                              height: mediaContainerSearchHeight * 0.35,
                              decoration: const BoxDecoration(
                                color: Color(0xFFEE4532),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5)
                                  ),
                              ),
                              child: const Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ), 
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}