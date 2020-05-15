import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './bodypage.dart';
import './methods/methods.dart';
import './models/datamodel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  List<Expances> expances = [
    // Expances(id: 'e1', title: 'Expance1', price: 80, date: DateTime.now()),
    // Expances(id: 'e2', title: 'Expance2', price: 1000, date: DateTime.now()),
  ];


  String id="";
  String title="";

  @override
  void initState(){
    super.initState();
    
  }



  final priceController = TextEditingController();
  final titleController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expances", style: TextStyle(color: Colors.black)),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: BodyPage(expances),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet(context);
        },
        child: Icon(Icons.add),
        elevation: 0,
      ),
    );
  }

  void showBottomSheet(context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        isScrollControlled: true,
        context: context,
        builder: (builder) {
          return SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.only(
                    top: 15,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 50),
                color: Colors.transparent,

                // decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: 'Title here',
                              icon: Icon(Icons.add_shopping_cart),
                              border: InputBorder.none),
                          controller: titleController,
                        ),
                        SizedBox(height: 20),
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: 'Price',
                              icon: Icon(Icons.attach_money),
                              border: InputBorder.none),
                          controller: priceController,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              onPressed: () {
                                datepicker(context);
                              },
                              child: Text(
                                "Date",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              onPressed: () {
                                save();
                              },
                              child: Text(
                                "Save",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Theme.of(context).primaryColor,
                            )
                          ],
                        )
                      ]),
                )),
          );
        });
  }

  void datepicker(context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((onValue) {
      if (onValue == null) {
        return;
      } else {
        setState(() {
          selectedDate = onValue;
        });
      }
    });
  }

  void save() {
    var date = selectedDate;
    var price = double.parse(priceController.text);
    var title = titleController.text;
    var index = '5';
    

    final newTx = Expances(
      date: date,title: title,price: price,id: index
    );
      titleController.clear();
      priceController.clear();
      Navigator.pop(context);

    setState(() {
      this.expances.add(newTx);
      // expances.toList();
      
    });

    // });
  }
}
