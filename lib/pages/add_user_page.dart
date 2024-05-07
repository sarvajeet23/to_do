import 'package:flutter/material.dart';
import 'package:to_do/auth/form_validators.dart';

import 'package:to_do/models/user_model.dart';
import 'package:to_do/utility/kdesign.dart';
import 'package:to_do/utility/size_box.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({
    super.key,
    this.model,
  });

  final UserModel? model;
  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController message = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.model != null) {
      name.text = widget.model?.name ?? "";
      email.text = widget.model?.email ?? "";
      phone.text = widget.model?.phone ?? '';
      message.text = widget.model?.message ?? '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent[100],
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        backgroundColor: Colors.indigo,
        title: Text(
          widget.model == null ? "Add User" : "Update User",
          style: KDesign.kcolour,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 8, right: 8),
        child: Form(
          key: formkey,
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            TextFormField(
              keyboardType: TextInputType.name,
              controller: name,
              validator: FormValidators.validateName,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  label: const Text("Name")),
            ),
            hsize16,
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: email,
              validator: FormValidators.validateEmail,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  label: const Text("Email")),
            ),
            hsize16,
            TextFormField(
              keyboardType: TextInputType.name,
              controller: phone,
              validator: FormValidators.validatePhone,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  label: const Text("Phone")),
            ),
            hsize16,
            TextFormField(
              keyboardType: TextInputType.text,
              controller: message,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  label: const Text("Message")),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.lightBlue)),
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  String userName = name.text;
                  String userEmail = email.text;
                  String userPhone = phone.text;
                  String userMessage = message.text;

                  var model = UserModel(
                    name: userName,
                    email: userEmail,
                    phone: userPhone,
                    message: userMessage,
                  );

                  Navigator.pop(context, model);
                }
              },
              child: Text(
                widget.model == null ? "Submit" : "Update",
                style: KDesign.kcolour.copyWith(fontSize: 22),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
