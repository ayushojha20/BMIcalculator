import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtcontroller=TextEditingController();

  var htcontroller=TextEditingController();

  var result="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI Calculator')),
        backgroundColor: Colors.blue,
        
      ),
      body: Container(
        
        child: Center(
          child: Container(
            width: 300,
            color: Colors.grey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ Center(child: Text('BMI',style: TextStyle(fontSize: 20,fontWeight:FontWeight.w600),)),
            
              TextField(
                controller: wtcontroller,
                decoration: InputDecoration(
                  label: Text('Enter Weight in KG'),
                  prefixIcon: Icon(Icons.line_weight),
                ),
                keyboardType: TextInputType.number,
              ),
            
              SizedBox(height: 10),
            
              TextField(
                controller: htcontroller,
                decoration: InputDecoration(
                  label: Text('Enter Height in cm'),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
        
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(onPressed: () {
                
                  var wt=wtcontroller.text.toString();
                  var ht=htcontroller.text.toString();
                
                  if (wt!="" && ht!=""){
                    var iwt= int.parse(wt);
                    var iht= int.parse(ht)/100;
                
                    var bmi=iwt/(iht*iht);
                    var msg='';
                  
                 
                   
                 if (bmi>30){
                  msg='You are OverWeight';

                 }else if(bmi<18){
                     msg='You are OverWeight';
                 }
                 else{
                  msg='You are Healthy';
                 }


                  setState(() {
                     result='$msg \n Your BMI is ${bmi.toStringAsFixed(2)}';
                  });
                  
                    
                  }else{
                    setState((){
                      result ='Fill all field';
                    });
                  }
                
                }, child: Text('Calculate'),
                ),
              ),
              Text(result)
            
            ],),
          ),
        ),
      ),
        
      );

    
  }
}
