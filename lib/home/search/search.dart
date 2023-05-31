import 'package:flutter/material.dart';
import 'package:globalgamestore/navigation/navigation.dart';

import '../products/products_services.dart';

class SearchApp extends StatefulWidget {
  const SearchApp({Key? key}) : super(key: key);

  @override
  createState() => _SearchAppState();
}

class _SearchAppState extends State<SearchApp> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> searchResults = [];

  void _performSearch() async {
    String keyword = _searchController.text;
    List<Map<String, dynamic>> results =
        await ProductService.searchProducts(keyword);
    setState(() {
      searchResults = results;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    final mediaContainerSearchHeight = (mediaQueryHeight * 0.15);

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: mediaQueryWidth,
            height: mediaQueryHeight * 0.17,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: const Color.fromARGB(255, 201, 201, 201),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: mediaQueryWidth,
                  height: MediaQuery.of(context).padding.top,
                ),
                SizedBox(
                  width: mediaQueryWidth,
                  height: mediaContainerSearchHeight * 0.50,
                  child: Row(
                    children: [
                      InkWell(
                        child: SizedBox(
                          width: mediaQueryWidth * 0.15,
                          height: mediaContainerSearchHeight * 0.50,
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
                                return const NavAppBar();
                              },
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        width: mediaQueryWidth * 0.68,
                        height: mediaContainerSearchHeight * 0.50,
                        child: Center(
                          child: SizedBox(
                            width: mediaQueryWidth * 0.68,
                            height: mediaContainerSearchHeight * 0.35,
                            child: TextField(
                              controller: _searchController,
                              showCursor: true,
                              cursorHeight: 20,
                              textAlignVertical: TextAlignVertical.bottom,
                              decoration: InputDecoration(
                                hintText: 'Gratis Ongkir 2023',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                  borderSide: BorderSide(
                                    color: Color(0xFFEE4532),
                                    width: 1.5,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                  borderSide: BorderSide(
                                    color: Color(0xFFEE4532),
                                    width: 1.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: mediaQueryWidth * 0.15,
                        height: mediaContainerSearchHeight * 0.50,
                        child: Center(
                          child: Container(
                            width: mediaQueryWidth * 0.15,
                            height: mediaContainerSearchHeight * 0.35,
                            decoration: BoxDecoration(
                              color: Color(0xFFEE4532),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              ),
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: _performSearch,
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
          if (searchResults.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        // color: Colors.green,
                        border: Border.all(
                          color: const Color(0xFFEE4532),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 70,
                          height: 55,
                          // color: Colors.red,
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.network(
                                  searchResults[index]['image_url']),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 70,
                          height: 22,
                          // color: Color.fromARGB(255, 99, 216, 22),
                          child: Center(
                            child: FittedBox(
                              child: Text(
                                searchResults[index]['nama_produk'],
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
