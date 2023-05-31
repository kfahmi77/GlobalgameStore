import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:globalgamestore/profile/profile.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController _displayNameController = TextEditingController();

  File? _imageFile;
  String? _displayName;
  @override
  void initState() {
    super.initState();
    User? user = _firebaseAuth.currentUser;
    _displayNameController.text = user?.displayName ?? '';
  }

  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _imageFile = File(pickedImage.path);
      }
    });
  }

  Future<void> _updateProfile() async {
    User? user = _firebaseAuth.currentUser;

    if (_imageFile != null || _displayName != null) {
      await _updateProfileImage(_imageFile, user);
      await _updateDisplayName(_displayName, user);

      Navigator.pushReplacement(
        // Navigasi dengan mengganti rute
        context,
        MaterialPageRoute(
            builder: (context) =>
                const ProfileApp()), // Ganti dengan halaman profil yang baru
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully')),
      );
    }
  }

  Future<void> _updateProfileImage(File? imageFile, User? user) async {
    if (imageFile != null) {
      firebase_storage.Reference storageReference = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child('${user!.uid}.jpg');

      firebase_storage.UploadTask uploadTask =
          storageReference.putFile(imageFile);
      await uploadTask.whenComplete(() => null);

      String imageUrl = await storageReference.getDownloadURL();

      await user.updatePhotoURL(imageUrl);
    }
  }

  Future<void> _updateDisplayName(String? displayName, User? user) async {
    if (displayName != null && displayName.isNotEmpty) {
      await user!.updateDisplayName(displayName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage:
                    _imageFile != null ? FileImage(_imageFile!) : null,
                child: _imageFile == null
                    ? CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          _firebaseAuth.currentUser?.photoURL ??
                              'https://www.nicepng.com/maxp/u2y3a9e6t4o0a9w7/',
                        ),
                      )
                    : null,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _selectImage,
                child: const Text('Choose Image'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _displayNameController,
                decoration: const InputDecoration(
                  labelText: 'Display Name',
                ),
                onChanged: (value) {
                  setState(() {
                    _displayName = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _updateProfile,
                child: const Text('Update Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
