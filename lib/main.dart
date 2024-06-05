import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

main(){
  runApp(
    const MaterialApp(
      title: "First App",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyApp(),
      ),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton("Btn 1"),
        SizedBox(height: 10,),
        CustomButton("Btn 2"),
        SizedBox(height: 10,),
        CustomButton("Btn 3"),
        SizedBox(height: 10,),
        CustomButton("Btn 4"),
        SizedBox(height: 10,),
        CustomButton("Btn 5"),
        SizedBox(height: 10,),
        MyStateFullWidget()
      ],
    ),);
  }
}

class MyStateFullWidget extends StatefulWidget {
  const MyStateFullWidget({super.key});

  @override
  State<MyStateFullWidget> createState() => _MyStateFullWidgetState();
}

class _MyStateFullWidgetState extends State<MyStateFullWidget> {
  String txt = "";
  int count = 0;

  @override
  void initState() {
    txt = "Click here!";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            if (kDebugMode) {
              setState(() {
                txt = "Clicked: ${++count}";
              });
            }
          },
          child: Text(txt),
        )
      ],
    );
  }
}


class CustomButton extends StatelessWidget {
  final String text;

  const CustomButton(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if (kDebugMode) {
          print("$text Clicked!");
        }
      },
      child: Container(
        height: 50,
        width: 100,
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.blue
        ),
        child: Center(child: Text(text)),
      ),
    );
  }

}