import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/ProductProvider.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController _name = TextEditingController();
  TextEditingController _price = TextEditingController();
  TextEditingController _quntity = TextEditingController();
  ProductProvider? provider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ProductProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ProductProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Product",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Product Name:",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5.0,
                ),
                TextField(
                  controller: _name,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Enter Product Name",
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.shade500, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue.shade500, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0))),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Product Price:",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5.0,
                ),
                TextField(
                  controller: _price,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Enter Product Price",
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.shade500, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue.shade500, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0))),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Product Quntity:",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5.0,
                ),
                TextField(
                  controller: _quntity,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Enter Product Price",
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.shade500, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue.shade500, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0))),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      var name = _name.text.toString();
                      var price = _price.text.toString();
                      var quntity = _quntity.text.toString();

                      var parameter = {
                        "pname": name,
                        "qty": quntity,
                        "price": price,
                      };

                      await provider!.addproduct(parameter);

                      if (provider!.isinserted) {
                        print("Insert Success");
                        //navigation
                      } else {
                        print("Insert Fail");
                      }
                    },
                    child: Text("Add"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
