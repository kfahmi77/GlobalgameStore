import 'package:flutter/material.dart';
import 'package:globalgamestore/navigation/navigation.dart';

class ProductsApp extends StatelessWidget {
  const ProductsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Products();
  }
}

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {

    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    final myAppBar = AppBar(
          title: Text(
            'Pubg',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w400
            ),
          ),
          // backgroundColor: Colors.white,
          backgroundColor: Color(0xFFEE4532),
          leading: Container(
            child: InkWell(
              child: Icon(
                Icons.arrow_back_outlined,
                size: 35,
                color: Colors.white,
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
          )
        );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: myAppBar,
        body: Container(
          width: mediaQueryHeight,
          height: mediaQueryHeight,
          color: Colors.amber,
          child: ListView(
            children: [
              Container(
                width: mediaQueryWidth,
                height: 305,
                color: Color.fromARGB(255, 223, 223, 223),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 5,),
                  Container(
                    width: mediaQueryWidth * 0.48,
                    height: 300,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 200,
                          // color: Colors.amber,
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset(
                                'assets/images/Pubg1.png'
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 50,
                          // color: Colors.red,
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            'Pubg Mobile',
                            style: TextStyle(
                              fontSize: 16
                            ),
                          ),
                        ),
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 50,
                          // color: Colors.red,
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            'Rp128.000',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 5,),
                  Container(
                    width: mediaQueryWidth * 0.48,
                    height: 300,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 200,
                          // color: Colors.amber,
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset(
                                'assets/images/Pubg1.png'
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 50,
                          // color: Colors.red,
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            'Pubg Mobile',
                            style: TextStyle(
                              fontSize: 16
                            ),
                          ),
                        ),
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 50,
                          // color: Colors.red,
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            'Rp128.000',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 5,),
                ],
                ),
              ),
              Container(
                width: mediaQueryWidth,
                height: 305,
                color: Color.fromARGB(255, 223, 223, 223),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 5,),
                  Container(
                    width: mediaQueryWidth * 0.48,
                    height: 300,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 200,
                          // color: Colors.amber,
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset(
                                'assets/images/Pubg1.png'
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 50,
                          // color: Colors.red,
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            'Pubg Mobile',
                            style: TextStyle(
                              fontSize: 16
                            ),
                          ),
                        ),
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 50,
                          // color: Colors.red,
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            'Rp128.000',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 5,),
                  Container(
                    width: mediaQueryWidth * 0.48,
                    height: 300,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 200,
                          // color: Colors.amber,
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset(
                                'assets/images/Pubg1.png'
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 50,
                          // color: Colors.red,
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            'Pubg Mobile',
                            style: TextStyle(
                              fontSize: 16
                            ),
                          ),
                        ),
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 50,
                          // color: Colors.red,
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            'Rp128.000',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 5,),
                ],
                ),
              ),
              Container(
                width: mediaQueryWidth,
                height: 305,
                color: Color.fromARGB(255, 223, 223, 223),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 5,),
                  Container(
                    width: mediaQueryWidth * 0.48,
                    height: 300,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 200,
                          // color: Colors.amber,
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset(
                                'assets/images/Pubg1.png'
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 50,
                          // color: Colors.red,
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            'Pubg Mobile',
                            style: TextStyle(
                              fontSize: 16
                            ),
                          ),
                        ),
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 50,
                          // color: Colors.red,
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            'Rp128.000',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 5,),
                  Container(
                    width: mediaQueryWidth * 0.48,
                    height: 300,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 200,
                          // color: Colors.amber,
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset(
                                'assets/images/Pubg1.png'
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 50,
                          // color: Colors.red,
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            'Pubg Mobile',
                            style: TextStyle(
                              fontSize: 16
                            ),
                          ),
                        ),
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 50,
                          // color: Colors.red,
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            'Rp128.000',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 5,),
                ],
                ),
              ),
              Container(
                width: mediaQueryWidth,
                height: 305,
                color: Color.fromARGB(255, 223, 223, 223),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 5,),
                  Container(
                    width: mediaQueryWidth * 0.48,
                    height: 300,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 200,
                          // color: Colors.amber,
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset(
                                'assets/images/Pubg1.png'
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 50,
                          // color: Colors.red,
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            'Pubg Mobile',
                            style: TextStyle(
                              fontSize: 16
                            ),
                          ),
                        ),
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 50,
                          // color: Colors.red,
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            'Rp128.000',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 5,),
                  Container(
                    width: mediaQueryWidth * 0.48,
                    height: 300,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 200,
                          // color: Colors.amber,
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset(
                                'assets/images/Pubg1.png'
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 50,
                          // color: Colors.red,
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            'Pubg Mobile',
                            style: TextStyle(
                              fontSize: 16
                            ),
                          ),
                        ),
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 50,
                          // color: Colors.red,
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            'Rp128.000',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 5,),
                ],
                ),
              ),
              Container(
                width: mediaQueryWidth,
                height: 305,
                color: Color.fromARGB(255, 223, 223, 223),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 5,),
                  Container(
                    width: mediaQueryWidth * 0.48,
                    height: 300,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 200,
                          // color: Colors.amber,
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset(
                                'assets/images/Pubg1.png'
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 50,
                          // color: Colors.red,
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            'Pubg Mobile',
                            style: TextStyle(
                              fontSize: 16
                            ),
                          ),
                        ),
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 50,
                          // color: Colors.red,
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            'Rp128.000',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 5,),
                  Container(
                    width: mediaQueryWidth * 0.48,
                    height: 300,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 200,
                          // color: Colors.amber,
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset(
                                'assets/images/Pubg1.png'
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 50,
                          // color: Colors.red,
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            'Pubg Mobile',
                            style: TextStyle(
                              fontSize: 16
                            ),
                          ),
                        ),
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 50,
                          // color: Colors.red,
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            'Rp128.000',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 5,),
                ],
                ),
              ),
              Container(
                width: mediaQueryWidth,
                height: 305,
                color: Color.fromARGB(255, 223, 223, 223),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 5,),
                  Container(
                    width: mediaQueryWidth * 0.48,
                    height: 300,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 200,
                          // color: Colors.amber,
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset(
                                'assets/images/Pubg1.png'
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 50,
                          // color: Colors.red,
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            'Pubg Mobile',
                            style: TextStyle(
                              fontSize: 16
                            ),
                          ),
                        ),
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 50,
                          // color: Colors.red,
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            'Rp128.000',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 5,),
                  Container(
                    width: mediaQueryWidth * 0.48,
                    height: 300,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 200,
                          // color: Colors.amber,
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset(
                                'assets/images/Pubg1.png'
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 50,
                          // color: Colors.red,
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            'Pubg Mobile',
                            style: TextStyle(
                              fontSize: 16
                            ),
                          ),
                        ),
                        Container(
                          width: mediaQueryWidth * 0.48,
                          height: 50,
                          // color: Colors.red,
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            'Rp128.000',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 5,),
                ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}