import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mock_api_todo/custom_widgets.dart/app_textfield.dart';
import 'package:http/http.dart' as http;
import 'package:mock_api_todo/network/api.dart';

class FormView extends StatefulWidget {
  final String? title;
  final String? descrip;
  final bool? isEdit;

  const FormView({super.key, this.title, this.descrip, this.isEdit});

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  TextEditingController userNameEditingController = TextEditingController();
  TextEditingController userEmailEditingController = TextEditingController();
  bool edit = false;
  @override
  void initState() {
    super.initState();
    if (widget.title != null && widget.descrip != null) {
      userNameEditingController.text = widget.title!;
      userEmailEditingController.text = widget.descrip!;
      edit = widget.isEdit!;
    }
  }

  void login(String userName, String userEmail) async {
    try {
      Response response = await http.post(
          Uri.parse(BaseConfig.baseUrl + BaseConfig.postUsers),
          body: {"name": userName, "email": userEmail});
      if (context.mounted) Navigator.of(context).pop();
    } catch (e) {
      e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add To Do',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   padding: const EdgeInsets.all(5),
            //   decoration: BoxDecoration(
            //       border: Border.all(color: Colors.black, width: 2.0),
            //       borderRadius: BorderRadius.circular(15),
            //       color: Colors.grey),
            //   child: TextFormField(
            //     controller: titleEditingController,
            //     style: const TextStyle(color: Colors.black, fontSize: 15.0),
            //     decoration: const InputDecoration(
            //         hintText: "Enter Title",
            //         hintStyle: TextStyle(color: Colors.black),
            //         border: InputBorder.none),
            //   ),
            // ),
            UserTextField(
                placeholder: "Enter Name",
                textEditingController: userNameEditingController),
            UserTextField(
                placeholder: "Enter password",
                textEditingController: userEmailEditingController),

            GestureDetector(
              onTap: () {
                login(userNameEditingController.text,
                    userEmailEditingController.text);
                // onSave(context, titleEditingController.text,
                //     descriptionEditingController.text);
              },
              child: Container(
                width: 200.0,
                margin: const EdgeInsets.only(top: 15.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey),
                child: Center(
                  child: Text(edit ? "Update Record" : "Submit",
                      style:
                          const TextStyle(color: Colors.black, fontSize: 20.0)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // onSave(BuildContext context, String title, String descrip) {
  //   Navigator.pop(context, JobPost(title: title, description: descrip));
  //   // print(title);
  // }
}
