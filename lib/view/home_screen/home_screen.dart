import 'package:flutter/material.dart';
import 'package:localstorage/controller/home_screen_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await HomeScreenController.getAllEmployee();
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _customeBottomSheet(context);
          },
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  onTap: () async {
                    await HomeScreenController.updateEmployee(
                        "anandhu",
                        "puttady",
                        HomeScreenController.employeeDataList[index]["id"]);
                    setState(() {});
                  },
                  title: Text(
                      HomeScreenController.employeeDataList[index]["name"]),
                  subtitle: Text(HomeScreenController.employeeDataList[index]
                      ["designation"]),
                  trailing: IconButton(
                      onPressed: () async {
                        await HomeScreenController.removeEmployee(
                            HomeScreenController.employeeDataList[index]["id"]);
                        setState(() {});
                      },
                      icon: const Icon(Icons.delete)),
                ),
            separatorBuilder: (context, index) => Divider(),
            itemCount: HomeScreenController.employeeDataList.length));
  }

  Future<dynamic> _customeBottomSheet(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController designationController = TextEditingController();

    return showModalBottomSheet(
      backgroundColor: Colors.black,
      context: context,
      builder: (context) => SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 25),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  hintText: "Name",
                  hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color(0xff1a75d2),
                      )),
                ),
              ),
              const SizedBox(height: 25),
              TextFormField(
                controller: designationController,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  hintText: "designation",
                  hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color(0xff1a75d2),
                      )),
                ),
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () async {
                            await HomeScreenController.addEmployee(
                                name: nameController.text,
                                designation: designationController.text);
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: const Text("Save"))),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel"))),
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
