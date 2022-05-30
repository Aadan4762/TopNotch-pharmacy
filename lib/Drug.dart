import 'package:flutter/material.dart';
import 'package:pharmacy/drugs/About.dart';
import 'package:pharmacy/drugs/Add.dart';
class Drug extends StatefulWidget {
  @override
  _DrugState createState() => _DrugState();
}

class _DrugState extends State<Drug> {

    int index = 0;
    List<Widget> list = [
         Add(),
         About()


    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("DRUGS"),
          backgroundColor: Colors.amber,
        ),
      body: list[index],
      drawer: MyDrawer(onTap: (ctx, i){
           setState(() {
             index=i;
             Navigator.pop(ctx);          });
    },),
    );
  }
}

class MyDrawer extends StatelessWidget {
  final Function onTap;

   MyDrawer({
    this.onTap
});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
       width: MediaQuery.of(context).size.width*0.8,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.amber), child: null,
            ),
            ListTile(
               leading: Icon(Icons.add_circle_outline),
               title: Text('ADD NEW DRUG'),
               onTap: ()=>onTap(context,0),
            ),
            ListTile(
              leading: Icon(Icons.add_circle_outline),
              title: Text('DRUGS IN STOCKS'),
              onTap: ()=>onTap(context,1),
            ),
          ],
        ),
      ),

    );
  }
}
