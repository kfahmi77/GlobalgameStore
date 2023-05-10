import 'package:flutter/material.dart';

class NotifikasiApp extends StatelessWidget {
  const NotifikasiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Notifikasi();
  }
}

class Notifikasi extends StatelessWidget {
  const Notifikasi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Notifikasi',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 22
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
              ),
              title: Text('Pembelian'),
              subtitle: Text('Selamat Pembelian mu berhasil dilakukan.'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
              ),
              title: Text('Pembelian'),
              subtitle: Text('Selamat Pembelian mu berhasil dilakukan.'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
              ),
              title: Text('Pembelian'),
              subtitle: Text('Selamat Pembelian mu berhasil dilakukan.'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
              ),
              title: Text('Pembelian'),
              subtitle: Text('Selamat Pembelian mu berhasil dilakukan.'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
              ),
              title: Text('Pembelian'),
              subtitle: Text('Selamat Pembelian mu berhasil dilakukan.'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
              ),
              title: Text('Pembelian'),
              subtitle: Text('Selamat Pembelian mu berhasil dilakukan.'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
              ),
              title: Text('Pembelian'),
              subtitle: Text('Selamat Pembelian mu berhasil dilakukan.'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
              ),
              title: Text('Pembelian'),
              subtitle: Text('Selamat Pembelian mu berhasil dilakukan.'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
              ),
              title: Text('Pembelian'),
              subtitle: Text('Selamat Pembelian mu berhasil dilakukan.'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
              ),
              title: Text('Pembelian'),
              subtitle: Text('Selamat Pembelian mu berhasil dilakukan.'),
            ),
          ],
        ),
      ),
    );
  }
}