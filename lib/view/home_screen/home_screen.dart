import 'package:flutter/material.dart';
import 'package:localstorage/controller/home_screen_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController desController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                title: Text("Name"),
                subtitle: Text("Designation"),
              ),
          separatorBuilder: (context, index) => Divider(),
          itemCount: 10),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Colors.white,
              context: context,
              builder: (context) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: desController,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  HomeScreenController.addEmployee();
                                },
                                child: Text("save")),
                            SizedBox(
                              width: 30,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Cancel")),
                          ],
                        ),
                      ],
                    ),
                  ));
        },
      ),
    );
  }
}
