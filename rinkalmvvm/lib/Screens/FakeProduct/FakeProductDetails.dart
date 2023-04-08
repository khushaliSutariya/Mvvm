import 'package:flutter/material.dart';

import '../../Models/Product.dart';

class FakeProductDetails extends StatefulWidget {
  Product obj;

  FakeProductDetails({required this.obj});
  @override
  State<FakeProductDetails> createState() => _FakeProductDetailsState();
}

class _FakeProductDetailsState extends State<FakeProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    widget.obj.images![0].toString(),
                    width: 312.0,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    widget.obj.title.toString(),
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    widget.obj.price.toString(),
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    widget.obj.description.toString(),
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
