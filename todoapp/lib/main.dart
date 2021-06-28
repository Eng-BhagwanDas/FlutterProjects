import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TODOScreen(),
    );
  }
}

class TODOScreen extends StatefulWidget {
  @override
  _TODOScreenState createState() => _TODOScreenState();
}

class _TODOScreenState extends State<TODOScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // For the AppBar we will have a title property and also in action
      // we will have IconButton for logout

      appBar: AppBar(
        title: Text("My TODO app"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),

      //In the body, we have Column which contains TextButton and ListView.builder

      body: Column(
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
            "dd/MM/YYYY")
          ),
          ListView.builder(
            padding: EdgeInsets.all(10),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Dismissible(
                  background: Container(
                    alignment: Alignment.centerLeft,
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.delete),
                    ),
                  ),
                  key: ValueKey(index),
                  child: Card(
                    margin: EdgeInsets.all(0),
                    child: ListTile(
                      leading: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.check_circle_outline_rounded),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_ios),
                      ),
                      title: Text("Title"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Desc"),
                          Text("data"),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
