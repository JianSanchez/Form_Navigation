import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage()
    );
  }
  
}

class FirstPage extends StatelessWidget{

  TextEditingController textAdd = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 205, 205, 205),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 118, 29, 56),
        title: Text("Navigation"),
        leading: Icon(Icons.code),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextFormField(            
            controller: textAdd,
            decoration: InputDecoration(
              labelText: "Input Something Here",
              border: OutlineInputBorder(borderRadius:BorderRadius.circular(20)),
              
            ),
          
          ),
          Padding(
            padding: EdgeInsets.all(10)
          ),
          ElevatedButton(           
            onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) => SecondPage(textAdd: textAdd.text)
                ),
              );     
            },
            style: ElevatedButton.styleFrom(
              primary: const Color.fromARGB(255, 117, 27, 27),
            ),
              child: Text("Go to second")
          ),         
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget{

  String? textAdd;
  SecondPage({this.textAdd});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 205, 205, 205),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 118, 29, 56),
        title: const Text("Navigation"),
        leading: const Icon(Icons.code),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [   
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.black,
              )    
            ),
            child:
              Text("Welcome $textAdd to Second Page",
              textAlign: TextAlign.center
              ),
            ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              primary: const Color.fromARGB(255, 117, 27, 27),
            ),
            child: const Text("Go back to the first page")
          ),
        ],
      ),
    );
  }
}