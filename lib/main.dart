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
    return const ListViewPage();
    // return const Center(child: Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     CustomButton("Btn 1"),
    //     SizedBox(height: 10,),
    //     CustomButton("Btn 2"),
    //     SizedBox(height: 10,),
    //     CustomButton("Btn 3"),
    //     SizedBox(height: 10,),
    //     CustomButton("Btn 4"),
    //     SizedBox(height: 10,),
    //     CustomButton("Btn 5"),
    //     SizedBox(height: 10,),
    //     MyStateFullWidget(),
    //     SizedBox(height: 10,),
    //     MyContainer(),
    //   ],
    // ),);
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

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(30),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        shape: BoxShape.rectangle,
        border: Border.all(
            color: Colors.red,
            width: 1
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
        ),
      ),
      transform: Matrix4.rotationZ(0.5),
      child: const Text("Container"),
    );
  }
}




class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  int index = 0;
  final items = List.generate(100, (counter) => 'Item ${counter + 1}');

  @override
  void initState() {
    index = 0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ListViewPage"),
        ),
        body: buildAppBody(index),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.view_list),
              label: 'Basic',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_rounded),
              label: 'Vertical',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted),
              label: 'Horizontal',
            ),
          ],
          onTap: (index){
            setState(() {
              this.index = index;
            });
          },
        )
    );
  }

  Widget buildAppBody(index){
    switch(index){
      case 0:
        return buildBasicListView();
      case 1:
        return buildVerticalListView();
      case 2:
        return buildHorizontalListView();
      default:
        return Container();
    }
  }

  Widget buildBasicListView() {
    return ListView(
      children: [
        InkWell(
          onTap: (){

          },
          child: const ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.cyan,
              child: Text("JH"),
            ),
            title: Text("Jahid Hasan"),
            trailing: Icon(Icons.star, color: Colors.orange,),
          ),
        ),
        InkWell(
          onTap: (){

          },
          child: const ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.cyan,
              child: Text("AR"),
            ),
            title: Text("Abdur Rahim"),
            trailing: Icon(Icons.star, color: Colors.orange,),
          ),
        ),
        InkWell(
          onTap: (){

          },
          child: const ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.cyan,
              child: Text("AK"),
            ),
            title: Text("Abdur Kader"),
            trailing: Icon(Icons.star, color: Colors.orange,),
          ),
        ),
        InkWell(
          onTap: (){

          },
          child: const ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.cyan,
              child: Text("AS"),
            ),
            title: Text("Abdur Satter"),
            trailing: Icon(Icons.star, color: Colors.orange,),
          ),
        )
      ],
    );
  }

  Widget buildVerticalListView() {
    return ListView.separated(
        itemCount: items.length,
        separatorBuilder: (ctx, index) => const Divider(color: Colors.blue,height: 1,),
        padding: const EdgeInsets.all(0),
        itemBuilder: (ctx, index){
          return InkWell(
            onTap: (){

            },
            child: ListTile(
              title: Text(items.elementAtOrNull(index) ?? 'Item not found'),
            ),
          );
        }
    );
  }

  Widget buildHorizontalListView() {
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (ctx, index) => const Divider(color: Colors.blue,),
      padding: const EdgeInsets.all(16),
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx, index){
        return Container(
          height: 50,
          width: 150,
          margin: const EdgeInsets.all(16),
          child: ListTile(
            title: Text(items.elementAtOrNull(index) ?? 'Item not found!'),
          ),
        );
      },

    );
  }
}
