import 'package:flutter/material.dart';
import 'package:globalgamestore/Screens/Welcome/welcome_screen.dart';
import 'package:globalgamestore/home/balance/balance.dart';
import 'package:globalgamestore/navigation/navigation.dart';
import 'package:globalgamestore/profile/Pesanan/pesanan.dart';
import 'package:globalgamestore/profile/seller/store.dart';

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Profile();
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {

    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    final myAppBar = AppBar(
          toolbarHeight: 120,
          title: Text(
            'fachrurfatanillah',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w400
            ),
          ),
          backgroundColor: Color(0xFFEE4532),
          leading: CircleAvatar(
            child: Icon(
              Icons.person,
              color: Color(0xFFEE4532),
              size: 40,
            ),
            backgroundColor: Color.fromARGB(255, 230, 230, 230),
          ),
          actions: [
            Container(
              width: 50,
              // color: Colors.amber,
              child: InkWell(
                child: Center(
                  child: Icon(Icons.logout),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return WelcomeScreen();
                      },
                    ),
                  );
                },
              )
            )
          ],
        );
          
    final bodyHeight = mediaQueryHeight - myAppBar.preferredSize.height - MediaQuery.of(context).padding.top;


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: myAppBar,
        body: Container(
          width: mediaQueryWidth,
          height: mediaQueryHeight,
          child: ListView(
            children: [
              InkWell(
                child: Container(
                  width: mediaQueryWidth,
                  height: mediaQueryHeight * 0.07,
                  // color: Colors.red,
                  child: Row(
                    children: [
                      Container(
                        width: mediaQueryWidth * 0.15,
                        height: mediaQueryHeight * 0.07,
                        // color: Colors.black,
                        child: Center(
                          child: Icon(
                            Icons.edit_note,
                            size: 35,  
                          ),
                        ),
                      ),
                      Container(
                        width: mediaQueryWidth * 0.40,
                        height: mediaQueryHeight * 0.07,
                        // color: Color.fromARGB(255, 100, 82, 215),
                        child: Center(
                          child: Container(
                            width: mediaQueryWidth * 0.45,
                            height: mediaQueryHeight * 0.02,
                            // color: Colors.red,
                            child: Text(
                              'Pesanan Saya'
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: mediaQueryWidth * 0.42,
                        height: mediaQueryHeight * 0.07,
                        // color: Color.fromARGB(255, 82, 215, 102),
                        child: Row(
                          children: [
                            Container(
                              width: mediaQueryWidth * 0.37,
                              height: mediaQueryHeight * 0.07,
                              // color: Color.fromARGB(255, 82, 160, 215),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: mediaQueryWidth * 0.30,
                                    height: mediaQueryHeight * 0.02,
                                    // color: Colors.red,
                                    child: Text(
                                      'Riwayat Pesanan',
                                    ),
                                  ),
                                ],
                              )
                            ),
                            Container(
                              width: mediaQueryWidth * 0.05,
                              height: mediaQueryHeight * 0.07,
                              // color: Color.fromARGB(255, 215, 148, 82),
                              child: Center(
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 18,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 211, 211, 211)
                    )
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PesananApp();
                      },
                    ),
                  );
                },
              ),
              Container(
                width: mediaQueryWidth,
                height: mediaQueryHeight * 0.12,
                // color: Colors.white,
                child: Center(
                  child: Container(
                    width: mediaQueryWidth * 0.8,
                    height: mediaQueryHeight * 0.12,
                    // color: Color.fromARGB(255, 7, 127, 255),
                    child: Row(
                      children: [
                        InkWell(
                          child: Container(
                            width: mediaQueryWidth * 0.4,
                            height: mediaQueryHeight * 0.12,
                            // color: Colors.green,
                            child: Column(
                              children: [
                                Container(
                                  width: mediaQueryWidth * 0.4,
                                  height: mediaQueryHeight * 0.08,
                                  // color: Colors.amber,
                                  child: Icon(
                                    Icons.access_time,
                                    size: 35,
                                  ),
                                ),
                                Container(
                                  width: mediaQueryWidth * 0.4,
                                  height: mediaQueryHeight * 0.02,
                                  // color: Color.fromARGB(255, 7, 255, 36),
                                  child: Center(
                                    child: Text(
                                      'Menunggu Verifikasi',
                                      style: TextStyle(
                                        fontSize: 10
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return PesananApp();
                                },
                              ),
                            );
                          },
                        ),
                        InkWell(
                          child: Container(
                            width: mediaQueryWidth * 0.4,
                            height: mediaQueryHeight * 0.12,
                            // color: Colors.grey,
                            child: Column(
                              children: [
                                Container(
                                  width: mediaQueryWidth * 0.4,
                                  height: mediaQueryHeight * 0.08,
                                  // color: Colors.amber,
                                  child: Icon(
                                    Icons.published_with_changes,
                                    size: 35,
                                  ),
                                ),
                                Container(
                                  width: mediaQueryWidth * 0.4,
                                  height: mediaQueryHeight * 0.02,
                                  // color: Color.fromARGB(255, 7, 255, 36),
                                  child: Center(
                                    child: Text(
                                      'Selesai',
                                      style: TextStyle(
                                        fontSize: 10
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return PesananApp();
                                },
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 211, 211, 211)
                  )
                ),
              ),
              InkWell(
                child: Container(
                  width: mediaQueryWidth,
                  height: mediaQueryHeight * 0.07,
                  // color: Colors.red,
                  child: Row(
                    children: [
                      Container(
                        width: mediaQueryWidth * 0.15,
                        height: mediaQueryHeight * 0.07,
                        // color: Colors.black,
                        child: Center(
                          child: Icon(
                            Icons.account_balance_wallet_outlined,
                            size: 35,  
                          ),
                        ),
                      ),
                      Container(
                        width: mediaQueryWidth * 0.40,
                        height: mediaQueryHeight * 0.07,
                        // color: Color.fromARGB(255, 100, 82, 215),
                        child: Center(
                          child: Container(
                            width: mediaQueryWidth * 0.45,
                            height: mediaQueryHeight * 0.02,
                            // color: Colors.red,
                            child: Text(
                              'Dompet Saya'
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: mediaQueryWidth * 0.42,
                        height: mediaQueryHeight * 0.07,
                        // color: Color.fromARGB(255, 82, 215, 102),
                        child: Row(
                          children: [
                            Container(
                              width: mediaQueryWidth * 0.37,
                              height: mediaQueryHeight * 0.07,
                              // color: Color.fromARGB(255, 82, 160, 215),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: mediaQueryWidth * 0.30,
                                    height: mediaQueryHeight * 0.02,
                                    // color: Colors.red,
                                    // child: Text(
                                    //   'Riwayat Pesanan',
                                    // ),
                                  ),
                                ],
                              )
                            ),
                            Container(
                              width: mediaQueryWidth * 0.05,
                              height: mediaQueryHeight * 0.07,
                              // color: Color.fromARGB(255, 215, 148, 82),
                              child: Center(
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 18,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 211, 211, 211)
                    )
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomeBalanceApp();
                      },
                    ),
                  );
                },
              ),
              InkWell(
                child: Container(
                  width: mediaQueryWidth,
                  height: mediaQueryHeight * 0.07,
                  // color: Colors.red,
                  child: Row(
                    children: [
                      Container(
                        width: mediaQueryWidth * 0.15,
                        height: mediaQueryHeight * 0.07,
                        // color: Colors.black,
                        child: Center(
                          child: Icon(
                            Icons.storefront,
                            size: 35,  
                          ),
                        ),
                      ),
                      Container(
                        width: mediaQueryWidth * 0.40,
                        height: mediaQueryHeight * 0.07,
                        // color: Color.fromARGB(255, 100, 82, 215),
                        child: Center(
                          child: Container(
                            width: mediaQueryWidth * 0.45,
                            height: mediaQueryHeight * 0.02,
                            // color: Colors.red,
                            child: Text(
                              'Mulai Jual'
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: mediaQueryWidth * 0.42,
                        height: mediaQueryHeight * 0.07,
                        // color: Color.fromARGB(255, 82, 215, 102),
                        child: Row(
                          children: [
                            Container(
                              width: mediaQueryWidth * 0.37,
                              height: mediaQueryHeight * 0.07,
                              // color: Color.fromARGB(255, 82, 160, 215),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: mediaQueryWidth * 0.30,
                                    height: mediaQueryHeight * 0.02,
                                    // color: Colors.red,
                                    // child: Text(
                                    //   'Gratis',
                                    // ),
                                  ),
                                ],
                              )
                            ),
                            Container(
                              width: mediaQueryWidth * 0.05,
                              height: mediaQueryHeight * 0.07,
                              // color: Color.fromARGB(255, 215, 148, 82),
                              child: Center(
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 18,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 211, 211, 211)
                    )
                  ),
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
              Container(
                width: mediaQueryWidth,
                height: mediaQueryHeight * 0.07,
                // color: Colors.red,
                child: Row(
                  children: [
                    Container(
                      width: mediaQueryWidth * 0.15,
                      height: mediaQueryHeight * 0.07,
                      // color: Colors.black,
                      child: Center(
                        child: Icon(
                          Icons.settings,
                          size: 35,  
                        ),
                      ),
                    ),
                    Container(
                      width: mediaQueryWidth * 0.40,
                      height: mediaQueryHeight * 0.07,
                      // color: Color.fromARGB(255, 100, 82, 215),
                      child: Center(
                        child: Container(
                          width: mediaQueryWidth * 0.45,
                          height: mediaQueryHeight * 0.02,
                          // color: Colors.red,
                          child: Text(
                            'Pengaturan'
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: mediaQueryWidth * 0.42,
                      height: mediaQueryHeight * 0.07,
                      // color: Color.fromARGB(255, 82, 215, 102),
                      child: Row(
                        children: [
                          Container(
                            width: mediaQueryWidth * 0.37,
                            height: mediaQueryHeight * 0.07,
                            // color: Color.fromARGB(255, 82, 160, 215),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: mediaQueryWidth * 0.30,
                                  height: mediaQueryHeight * 0.02,
                                  // color: Colors.red,
                                  // child: Text(
                                  //   'Gratis',
                                  // ),
                                ),
                              ],
                            )
                          ),
                          Container(
                            width: mediaQueryWidth * 0.05,
                            height: mediaQueryHeight * 0.07,
                            // color: Color.fromARGB(255, 215, 148, 82),
                            child: Center(
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 18,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 211, 211, 211)
                  )
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}