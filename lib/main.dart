import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SelectionListScreen(),
    );
  }
}

class SelectionListScreen extends StatefulWidget {
  @override
  _SelectionListScreenState createState() => _SelectionListScreenState();
}

class _SelectionListScreenState extends State<SelectionListScreen> {
  List<String> myList = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"];
  List<bool> isSelected = List.generate(5, (index) => false);

  void toggleSelection(int index) {
    setState(() {
      isSelected[index] = !isSelected[index];
    });
  }

  int getSelectedCount() {
    return isSelected.where((item) => item).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selection List'),
      ),
      body: ListView.builder(
        itemCount: myList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(myList[index]),
            tileColor: isSelected[index] ? Colors.blue : null,
            onTap: () {
              toggleSelection(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Selected Items'),
                content: Text('You have selected ${getSelectedCount()} items.'),
                actions: [
                  TextButton(
                    child: Text('Close'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
