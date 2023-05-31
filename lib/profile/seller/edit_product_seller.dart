import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProductScreen extends StatefulWidget {
  final String productId;

  const EditProductScreen({super.key, required this.productId});

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _detailController = TextEditingController();
  File? _pickedImage;
  String? _imageUrl;
  final List<String> _categoryGameList = [
    'Pubg Mobile',
    'Pubg Pc',
    'Dota',
    'Mobile Lagends'
  ];
  final List<String> _listProducts = <String>['Pc', 'Mobile'];
  int _categoryGameIndex = 0;
  int _categoryProductIndex = 0;

  Future<void> _fetchProductDetails() async {
    try {
      final productSnapshot = await FirebaseFirestore.instance
          .collection('product')
          .doc(widget.productId)
          .get();
      final productData = productSnapshot.data() as Map<String, dynamic>;
      _nameController.text = productData['nama_produk'] ?? '';
      _priceController.text = productData['harga_produk']?.toString() ?? '';
      _detailController.text = productData['deskripsi_produk'] ?? '';
      _imageUrl = productData['image_url'] ?? '';
      final categoryGame = productData['kategori_game'] ?? '';
      final categoryProduct = productData['kategori_produk'] ?? '';

      if (_categoryGameList.contains(categoryGame)) {
        _categoryGameIndex = _categoryGameList.indexOf(categoryGame);
      } else {
        _categoryGameIndex = 0;
      }
      if (_listProducts.contains(categoryProduct)) {
        _categoryProductIndex = _listProducts.indexOf(categoryProduct);
      } else {
        _categoryProductIndex = 0;
      }
    } catch (error) {
      print('Error fetching product details: $error');
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _pickedImage = File(pickedImage.path);
      }
    });
  }

  Future<void> _uploadImage() async {
    if (_pickedImage == null) {
      return;
    }

    final fileName = DateTime.now().toString();
    final storageRef = FirebaseStorage.instance.ref().child(fileName);
    await storageRef.putFile(_pickedImage!);

    final imageUrl = await storageRef.getDownloadURL();

    setState(() {
      _imageUrl = imageUrl;
    });
  }

  Future<void> _updateProduct() async {
    try {
      final productRef = FirebaseFirestore.instance
          .collection('product')
          .doc(widget.productId);

      await productRef.update({
        'nama_produk': _nameController.text,
        'harga_produk': double.parse(_priceController.text),
        'deskripsi_produk': _detailController.text,
        'image_url': _imageUrl,
        'kategori_game': _categoryGameList[_categoryGameIndex],
        'kategori_produk': _listProducts[_categoryProductIndex],
      });

      print('Product successfully updated in Firebase');
    } catch (error) {
      print('Error updating product in Firebase: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _priceController = TextEditingController();
    _detailController = TextEditingController();
    _fetchProductDetails();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _detailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              ElevatedButton(
                onPressed: _pickImage,
                child: const Text('Pilih Gambar'),
              ),
              const SizedBox(height: 20.0),
              _pickedImage != null
                  ? Image.file(
                      _pickedImage!,
                      height: 200.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : _imageUrl != null
                      ? Image.network(
                          _imageUrl!,
                          height: 200.0,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )
                      : Container(),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a harga_produk';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid harga_produk';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _detailController,
                decoration: const InputDecoration(labelText: 'Detail'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a deskripsi_produk';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<int>(
                value: _categoryGameIndex,
                items: _categoryGameList.asMap().entries.map((entry) {
                  final index = entry.key;
                  final category = entry.value;
                  return DropdownMenuItem<int>(
                    value: index,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _categoryGameIndex = value!;
                  });
                },
                decoration: const InputDecoration(labelText: 'Kategori Game'),
                validator: (value) {
                  if (value == null) {
                    return 'pilih kategori game';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<int>(
                value: _categoryProductIndex,
                items: _listProducts.asMap().entries.map((entry) {
                  final index = entry.key;
                  final category = entry.value;
                  return DropdownMenuItem<int>(
                    value: index,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _categoryGameIndex = value!;
                  });
                },
                decoration: const InputDecoration(labelText: 'Katagori Produk'),
                validator: (value) {
                  if (value == null) {
                    return 'Pilih kategori produk';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                child: const Text('Save'),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await _uploadImage();
                    await _updateProduct();
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
