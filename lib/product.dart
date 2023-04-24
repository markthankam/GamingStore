import 'package:flutter/material.dart';
import 'product_1.dart';
import 'productview.dart';
import 'productview2.dart';
import 'widgets/footer.dart';
import 'package:firebase_core/firebase_core.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.grey,
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>ProductView()),
                            );
                          },
                          child: Image.asset(
                            'assets/item/model-o.jpg',
                            height: 160,
                            width: 300,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Model O',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ProductView_2()),
                            );
                          },
                          child: Image.asset(
                            'assets/item/g-pro.jpg',
                            height: 160,
                            width: 300,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                         Text(
                          'G-Pro Superlight',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ProductView()),
                            );
                          },
                          child: Image.asset(
                            'assets/item/zowie.jpg',
                            height: 160,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Zowie EC1-B DIVINA',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>ProductView()),
                            );
                          },
                          child: Image.asset(
                            'assets/item/zowie-240.jpg',
                            height: 160,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Zowie XL2746K 27"',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Footer(),
    );
  }
}

