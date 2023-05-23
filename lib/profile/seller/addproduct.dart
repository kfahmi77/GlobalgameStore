import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:globalgamestore/profile/seller/store.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../home/home.dart';
import '../../navigation/navigation.dart';

const List<String> listDevice = <String>['Pc', 'Mobile'];
const List<String> listGameCategory = <String>[
  'Pubg Mobile',
  'Pubg Pc',
  'Dota',
  'Mobile Lagends'
];

class AddProductApp extends StatelessWidget {
  const AddProductApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddProduct();
  }
}

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _firestore = FirebaseFirestore.instance;
  final User? _user = FirebaseAuth.instance.currentUser;
  TextEditingController namaProduct = TextEditingController();
  TextEditingController hargaProduct = TextEditingController();
  TextEditingController deskripsiProduct = TextEditingController();
  String selectedValue = '';
  String selectedValue2 = '';
  File? image;

  Future<void> uploadImageAndSaveData() async {
    if (image != null) {
      // Create a unique filename for the image
      String fileName = '${DateTime.now().millisecondsSinceEpoch}$_user.jpg';

      // Reference to the Firebase Storage location
      firebase_storage.Reference storageReference = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('images')
          .child(fileName);

      // Upload the image to Firebase Storage
      await storageReference.putFile(image!);

      // Get the download URL of the uploaded image
      String downloadURL = await storageReference.getDownloadURL();

      // Save the download URL to Firestore
      await _firestore.collection('product').add({
        'nama_produk': namaProduct.text,
        'harga_produk': hargaProduct.text,
        'kategori_produk': selectedValue,
        'kategori_game': selectedValue2,
        'image_url': downloadURL,
        'deskripsi_produk': deskripsiProduct.text,
        'user_id': _user!.uid,
      });
      // ignore: use_build_context_synchronously
      showSuccessDialog(context);

      debugPrint("Data Added");
    } else {
      debugPrint("Image not selected");
    }
  }

  void showSuccessDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Sukses'),
          content: Text('Data berhasil ditambahkan.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pushReplacement(
                  dialogContext,
                  MaterialPageRoute(builder: (context) => NavAppBar()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> GetImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? ImagePicked =
        await picker.pickImage(source: ImageSource.gallery);
    if (ImagePicked != null) {
      setState(() {
        image = File(ImagePicked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: const Text(
              'Tambah Produk',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
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
                        return const StoreApp();
                      },
                    ),
                  );
                },
              ),
            )),
        body: SizedBox(
          width: mediaQueryWidth,
          height: mediaQueryHeight,
          // color: Color.fromARGB(255, 224, 224, 224),
          child: Center(
            child: SizedBox(
              width: mediaQueryWidth * 0.8,
              height: mediaQueryHeight * 0.8,
              // color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    width: mediaQueryWidth * 0.8,
                    height: mediaQueryHeight * 0.04,
                    // color: Colors.red,
                    child: Center(
                      child: SizedBox(
                        width: mediaQueryWidth * 0.8,
                        height: mediaQueryHeight * 0.02,
                        // color: Colors.amber,
                        child: const Text('Nama Produk :'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: mediaQueryWidth * 0.8,
                    height: mediaQueryHeight * 0.04,
                    // color: Colors.red,
                    child: Center(
                      child: SizedBox(
                        width: mediaQueryWidth * 0.8,
                        height: mediaQueryHeight * 0.035,
                        // color: Colors.amber,
                        child: TextField(
                          controller: namaProduct,
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration: const InputDecoration(
                            hintText: 'Nama Produk',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
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
                                  bottomRight: Radius.circular(5)),
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
                    width: mediaQueryWidth * 0.8,
                    height: mediaQueryHeight * 0.04,
                    // color: Colors.red,
                    child: Center(
                      child: SizedBox(
                        width: mediaQueryWidth * 0.8,
                        height: mediaQueryHeight * 0.02,
                        // color: Colors.amber,
                        child: const Text('Harga Produk :'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: mediaQueryWidth * 0.8,
                    height: mediaQueryHeight * 0.04,
                    // color: Colors.red,
                    child: Center(
                      child: SizedBox(
                        width: mediaQueryWidth * 0.8,
                        height: mediaQueryHeight * 0.035,
                        // color: Colors.amber,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,
                          controller: hargaProduct,
                          decoration: const InputDecoration(
                            hintText: 'Harga Produk',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
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
                                  bottomRight: Radius.circular(5)),
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
                    width: mediaQueryWidth * 0.8,
                    height: mediaQueryHeight * 0.04,
                    // color: Colors.red,
                    child: Center(
                      child: SizedBox(
                        width: mediaQueryWidth * 0.8,
                        height: mediaQueryHeight * 0.02,
                        // color: Colors.amber,
                        child: const Text('Tipe Produk :'),
                      ),
                    ),
                  ),
                  SizedBox(
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
                              color: const Color(0xFFEE4532),
                            )),
                        child: Row(
                          children: [
                            Container(
                              width: mediaQueryWidth * 0.7,
                              height: mediaQueryHeight * 0.04,
                              // color: Colors.red,
                              padding: const EdgeInsets.only(left: 10),
                              child: TypePrducts(
                                onSelectValue: (String _selectedValue) {
                                  setState(() {
                                    selectedValue = _selectedValue;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: mediaQueryWidth * 0.08,
                              height: mediaQueryHeight * 0.04,
                              // color: Colors.green,
                              child: const Center(
                                child: Icon(Icons.keyboard_arrow_down),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: mediaQueryWidth * 0.8,
                    height: mediaQueryHeight * 0.04,
                    // color: Colors.red,
                    child: Center(
                      child: SizedBox(
                        width: mediaQueryWidth * 0.8,
                        height: mediaQueryHeight * 0.02,
                        // color: Colors.amber,
                        child: const Text('Kategory Game :'),
                      ),
                    ),
                  ),
                  SizedBox(
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
                              color: const Color(0xFFEE4532),
                            )),
                        child: Row(
                          children: [
                            Container(
                              width: mediaQueryWidth * 0.7,
                              height: mediaQueryHeight * 0.04,
                              // color: Colors.red,
                              padding: const EdgeInsets.only(left: 10),
                              child: CategoryGames(
                                onSelectValue2: (String _selectedValue) {
                                  setState(() {
                                    selectedValue2 = _selectedValue;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: mediaQueryWidth * 0.08,
                              height: mediaQueryHeight * 0.04,
                              // color: Colors.green,
                              child: const Center(
                                child: Icon(Icons.keyboard_arrow_down),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: mediaQueryWidth * 0.8,
                    height: mediaQueryHeight * 0.04,
                    // color: Colors.red,
                    child: Center(
                      child: SizedBox(
                        width: mediaQueryWidth * 0.8,
                        height: mediaQueryHeight * 0.02,
                        // color: Colors.amber,
                        child: const Text('Deskripsi Produk :'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: mediaQueryWidth * 0.8,
                    height: mediaQueryHeight * 0.04,
                    // color: Colors.red,
                    child: Center(
                      child: SizedBox(
                        width: mediaQueryWidth * 0.8,
                        height: mediaQueryHeight * 0.035,
                        // color: Colors.amber,
                        child: const TextField(
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration: InputDecoration(
                            hintText: '....',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
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
                                  bottomRight: Radius.circular(5)),
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
                    width: mediaQueryWidth * 0.8,
                    height: mediaQueryHeight * 0.04,
                    // color: Colors.red,
                    child: Center(
                      child: SizedBox(
                        width: mediaQueryWidth * 0.8,
                        height: mediaQueryHeight * 0.02,
                        // color: Colors.amber,
                        child: const Text('Images :'),
                      ),
                    ),
                  ),
                  Container(
                    width: mediaQueryWidth * 0.8,
                    height: mediaQueryHeight * 0.04,
                    color: Colors.red,
                    child: image != null
                        ? SizedBox(
                            height: 10,
                            width: 10,
                            child: Image.file(
                              image!,
                              fit: BoxFit.cover,
                            ))
                        : Container(),
                  ),
                  TextButton(
                      onPressed: () async {
                        await GetImage();
                      },
                      child: const Text('Open')),
                  Container(
                    color: Colors.orange,
                    width: 80,
                    child: TextButton(
                        onPressed: () async {
                          await uploadImageAndSaveData();
                        },
                        child: const Text('Simpan')),
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
  const TypePrducts({Key? key, required this.onSelectValue}) : super(key: key);

  final Function(String) onSelectValue;

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
          widget.onSelectValue(dropdownValue);
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
  const CategoryGames({Key? key, required this.onSelectValue2})
      : super(key: key);

  final Function(String) onSelectValue2;

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
          widget.onSelectValue2(dropdownValue);
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
