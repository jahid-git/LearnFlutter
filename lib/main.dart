import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(){
  runApp(
    MaterialApp(
      title: "First App",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text("Hello World!"),
        ),
      ),
    )
  );
}