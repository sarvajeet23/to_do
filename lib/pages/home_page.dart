import 'package:flutter/material.dart';
import 'package:to_do/pages/add_user_page.dart';
import 'package:to_do/models/user_model.dart';
import 'package:to_do/utility/kdesign.dart';
import 'package:to_do/utility/size_box.dart';
import 'package:to_do/widget/dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UserModel> userList = <UserModel>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          "Welcome",
          style: KDesign.kcolour,
        ),
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          final UserModel model = userList[index];

          return Card(
            color: Color.fromARGB(255, 64, 252, 255),
            child: ListTile(
              onTap: () async {
                var newModel = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddUserPage(model: model)));
                setState(() {
                  userList[index] = newModel;
                });
              },
              title: Row(
                children: [
                  Icon(Icons.person, color: Colors.blue),
                  wsize3,
                  Text(model.name ?? ''),
                ],
              ),
              trailing: IconButton(
                  onPressed: () => userList.isNotEmpty
                      ? ShibooDialog.kDialogBox(
                          context: context,
                          title: Center(child: Text("Alert")),
                          backgroundColor: Colors.cyanAccent[200],
                          actionsAlignment: MainAxisAlignment.spaceBetween,
                          actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  setState(() => userList.removeAt(index));
                                },
                                child: Text("Delete"),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Cancel"),
                              ),
                            ])
                      : setState(() => userList.removeAt(index)),
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
              subtitle: Column(
                children: [
                  Row(
                    children: [
                      wsize2,
                      Icon(
                        Icons.email,
                        size: 20,
                        color: Colors.blue,
                      ),
                      wsize4,
                      Text(model.email ?? ''),
                      wsize10,
                      Icon(
                        Icons.phone,
                        color: Colors.blue,
                      ),
                      wsize5,
                      Text(model.phone ?? ''),
                    ],
                  ),
                  model.message != null && model.message!.isNotEmpty
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            wsize2,
                            Icon(
                              Icons.mark_as_unread_sharp,
                              color: Colors.blue,
                              size: 20,
                            ),
                            wsize4,
                            Expanded(child: Text(model.message ?? ""))
                          ],
                        )
                      : SizedBox(),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigoAccent,
        onPressed: () async {
          var newModel = await Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddUserPage()));

          setState(() => userList.add(newModel));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
