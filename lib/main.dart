import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List notes = [];
  String input = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        elevation: 0.0,
        title: Text("My Notes",
          style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            showDialog(
                context: context,
                builder: (BuildContext context)
                {
                  return AlertDialog(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                    ),
                    title: Text("Add Notes"),
                    content: TextField(
                      onChanged: (String value){
                        input = value;
                      },
                    ),
                    actions: <Widget>[
                      // ignore: deprecated_member_use
                      TextButton(
                          onPressed: (){
                            setState(() {
                              notes.add(input);
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text("Add "))
                    ],
                  );
                }
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          )
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (BuildContext context,int index){
              return Dismissible(
                key: Key(notes[index]),
                child: Card(
                  elevation:  4,
                  margin: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: ListTile(
                    title: Text(notes[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete,
                          color: Colors.blueAccent),
                      onPressed: (){
                        setState(() {
                          notes.removeAt(index);
                        });
                      },
                    ),
                  ),
                ),);
            }),
      ),
    );
  }
}
