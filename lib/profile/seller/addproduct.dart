import 'dart:io';

import 'package:flutter/material.dart';
import 'package:globalgamestore/profile/seller/store.dart';
import 'package:image_picker/image_picker.dart';

const List<String> listDevice = <String>['Pc', 'Mobile'];
const List<String> listGameCategory = <String>['Pubg Mobile', 'Pubg Pc', 'Dota', 'Mobile Lagends'];

class AddProductApp extends StatelessWidget {
  const AddProductApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AddProduct();
  }
}

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  File? image;

  Future GetImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? ImagePicked = await picker.pickImage(source: ImageSource.gallery);
    image = File(ImagePicked!.path);
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {

    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Tambah Produk',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w400
            ),
          ),
          // backgroundColor: Colors.white,
          backgroundColor: Color(0xFFEE4532),
          leading: Container(
            child: InkWell(
              child: Icon(
                Icons.arrow_back_outlined,
                size: 28,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.push(
                  context,
                    MaterialPageRoute(
                      builder: (context) {
                        return StoreApp();
                      },
                    ),
                );
              },
            ),
          )
        ),
        body: Container(
          width: mediaQueryWidth,
          height: mediaQueryHeight,
          // color: Color.fromARGB(255, 224, 224, 224),
          child: Center(
            child: Container(
              width: mediaQueryWidth * 0.8,
              height: mediaQueryHeight * 0.8,
              // color: Colors.white,
              child: Column(
                children: [
                  Container(
                    width: mediaQueryWidth * 0.8,
                    height: mediaQueryHeight * 0.04,
                    // color: Colors.red,
                    child: Center(
                      child: Container(
                        width: mediaQueryWidth * 0.8,
                        height: mediaQueryHeight * 0.02,
                        // color: Colors.amber,
                        child: Text('Nama Produk :'),
                      ),
                    ),
                  ),
                  Container(
                    width: mediaQueryWidth * 0.8,
                    height: mediaQueryHeight * 0.04,
                    // color: Colors.red,
                    child: Center(
                      child: Container(
                        width: mediaQueryWidth * 0.8,
                        height: mediaQueryHeight * 0.035,
                        // color: Colors.amber,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration: InputDecoration(
                              hintText: 'Nama Produk',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)
                                ),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1.5,
                                ),
                              ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5)
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
                  Container(
                    width: mediaQueryWidth * 0.8,
                    height: mediaQueryHeight * 0.04,
                    // color: Colors.red,
                    child: Center(
                      child: Container(
                        width: mediaQueryWidth * 0.8,
                        height: mediaQueryHeight * 0.02,
                        // color: Colors.amber,
                        child: Text('Harga Produk :'),
                      ),
                    ),
                  ),
                  Container(
                    width: mediaQueryWidth * 0.8,
                    height: mediaQueryHeight * 0.04,
                    // color: Colors.red,
                    child: Center(
                      child: Container(
                        width: mediaQueryWidth * 0.8,
                        height: mediaQueryHeight * 0.035,
                        // color: Colors.amber,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration: InputDecoration(
                              hintText: 'Harga Produk',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)
                                ),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1.5,
                                ),
                              ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5)
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
                  Container(
                    width: mediaQueryWidth * 0.8,
                    height: mediaQueryHeight * 0.04,
                    // color: Colors.red,
                    child: Center(
                      child: Container(
                        width: mediaQueryWidth * 0.8,
                        height: mediaQueryHeight * 0.02,
                        // color: Colors.amber,
                        child: Text('Tipe Produk :'),
                      ),
                    ),
                  ),
                  Container(
                    width: mediaQueryWidth * 0.8,
                    height: mediaQueryHeight * 0.04,
                    // color: Colors.red,
                    child: Center(
                      child: Container(
                        width: mediaQueryWidth * 0.8,
                        height: mediaQueryHeight * 0.04,
                        decoration: BoxDecoration(
                        // color: Colors.amber,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xFFEE4532),
                          )
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: mediaQueryWidth * 0.7,
                              height: mediaQueryHeight * 0.04,
                              // color: Colors.red,
                              padding: EdgeInsets.only(
                                left: 10
                              ),
                              child: TypePrducts(),
                            ),
                            Container(
                              width: mediaQueryWidth * 0.08,
                              height: mediaQueryHeight * 0.04,
                              // color: Colors.green,
                              child: Center(
                                child: Icon(Icons.keyboard_arrow_down),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: mediaQueryWidth * 0.8,
                    height: mediaQueryHeight * 0.04,
                    // color: Colors.red,
                    child: Center(
                      child: Container(
                        width: mediaQueryWidth * 0.8,
                        height: mediaQueryHeight * 0.02,
                        // color: Colors.amber,
                        child: Text('Kategory Game :'),
                      ),
                    ),
                  ),
                  Container(
                    width: mediaQueryWidth * 0.8,
                    height: mediaQueryHeight * 0.04,
                    // color: Colors.red,
                    child: Center(
                      child: Container(
                        width: mediaQueryWidth * 0.8,
                        height: mediaQueryHeight * 0.04,
                        decoration: BoxDecoration(
                        // color: Colors.amber,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xFFEE4532),
                          )
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: mediaQueryWidth * 0.7,
                              height: mediaQueryHeight * 0.04,
                              // color: Colors.red,
                              padding: EdgeInsets.only(
                                left: 10
                              ),
                              child: CategoryGames(),
                            ),
                            Container(
                              width: mediaQueryWidth * 0.08,
                              height: mediaQueryHeight * 0.04,
                              // color: Colors.green,
                              child: Center(
                                child: Icon(Icons.keyboard_arrow_down),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: mediaQueryWidth * 0.8,
                    height: mediaQueryHeight * 0.04,
                    // color: Colors.red,
                    child: Center(
                      child: Container(
                        width: mediaQueryWidth * 0.8,
                        height: mediaQueryHeight * 0.02,
                        // color: Colors.amber,
                        child: Text('Deskripsi Produk :'),
                      ),
                    ),
                  ),
                  Container(
                    width: mediaQueryWidth * 0.8,
                    height: mediaQueryHeight * 0.04,
                    // color: Colors.red,
                    child: Center(
                      child: Container(
                        width: mediaQueryWidth * 0.8,
                        height: mediaQueryHeight * 0.035,
                        // color: Colors.amber,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration: InputDecoration(
                              hintText: '....',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)
                                ),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1.5,
                                ),
                              ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5)
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
                  Container(
                    width: mediaQueryWidth * 0.8,
                    height: mediaQueryHeight * 0.04,
                    // color: Colors.red,
                    child: Center(
                      child: Container(
                        width: mediaQueryWidth * 0.8,
                        height: mediaQueryHeight * 0.02,
                        // color: Colors.amber,
                        child: Text('Images :'),
                      ),
                    ),
                  ),
                  Container(
                    width: mediaQueryWidth * 0.8,
                    height: mediaQueryHeight * 0.04,
                    color: Colors.red,
                    child: image != null ? Container(height: 10, width: 10, child: Image.file(image!, fit: BoxFit.cover,)) : Container(),
                  ),
                  TextButton(
                    onPressed: () async {
                      await GetImage();
                    },
                    child: Text('Open')
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TypePrducts extends StatefulWidget {
  const TypePrducts({super.key});

  @override
  State<TypePrducts> createState() => _TypePrductsState();
}

class _TypePrductsState extends State<TypePrducts> {
  String dropdownValue = listDevice.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      iconSize: 0.0,
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      items: listDevice.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class CategoryGames extends StatefulWidget {
  const CategoryGames({super.key});

  @override
  State<CategoryGames> createState() => _CategoryGamesState();
}

class _CategoryGamesState extends State<CategoryGames> {
  String dropdownValue = listGameCategory.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      iconSize: 0.0,
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      items: listGameCategory.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

