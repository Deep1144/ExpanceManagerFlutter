import 'package:first/models/datamodel.dart';
import 'package:flutter/material.dart';
import './HomePage.dart';
import './main.dart';
import 'package:intl/intl.dart';

class BodyPage extends StatelessWidget {
  final List expanceList;

  BodyPage(this.expanceList);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 0,
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  leading: CircleAvatar(
                    child: Text('$index'),
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  title: Text(expanceList[index].title),
                  subtitle: Container(
                    padding: EdgeInsets.only(top:4) , 
                    // child: Text('${expanceList[index].date}')
                    child: Text(DateFormat.yMMMd().format(expanceList[index].date)),
                  ),
                  trailing: Container(
                    child: Text('\$${expanceList[index].price}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    
                  ),
                  dense: false,
                ),
              );
            },
            itemCount: expanceList.length,
          ),
        ),
      ]),
    );
  }
}
