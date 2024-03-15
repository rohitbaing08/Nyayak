import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nyayak/res/colors.dart';
import 'package:nyayak/res/routes_constant.dart';
import 'package:nyayak/view/components/button.dart';
import 'package:nyayak/view/components/textfield.dart';
import 'package:nyayak/model/community_post_model.dart';

class AddCommunityPost extends StatelessWidget {
  const AddCommunityPost({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController categoryController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            router.pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: LightAppColors().backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Similar issue?\nShare with us and help others!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              CustomTextfield(
                label: 'Subject',
                hintText: 'Enter subject',
                controller: titleController,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextfield(
                label: 'Category',
                hintText: '',
                controller: categoryController,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                maxLines: null,
                minLines: 10,
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText: "Enter description",
                  label: const Text(
                    'Description',
                    style: TextStyle(color: Colors.black),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(
                        color: LightAppColors().seedColor, width: 0.5),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Button(
                  ontap: () {
                    CommunityPostModel dataToSave = CommunityPostModel(
                      subject: titleController.text,
                      category: categoryController.text,
                      description: descriptionController.text,
                    );
                    FirebaseFirestore.instance
                        .collection('community')
                        .add(dataToSave.toJson())
                        .then((value) => router.go('/'));
                  },
                  text: "Submit"),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
