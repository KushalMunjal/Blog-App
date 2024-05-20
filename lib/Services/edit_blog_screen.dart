import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:practical_10/screens/blog_list.dart';

class EditBlogScreen extends StatefulWidget {
  final String blogId;

  EditBlogScreen({required this.blogId});

  @override
  State<EditBlogScreen> createState() => _EditBlogScreenState();
}

class _EditBlogScreenState extends State<EditBlogScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Blog"),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("practical9_blog")
              .doc(widget.blogId)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                var data = snapshot.data;
                titleController.text = data?["title"] ?? "";
                categoryController.text = data?["category"] ?? "";
                descriptionController.text = data?["description"] ?? "";
              }

              return Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      hintText: "Title",
                    ),
                  ),
                  TextField(
                    controller: categoryController,
                    decoration: InputDecoration(
                      hintText: "Category",
                    ),
                  ),
                  TextField(
                    controller: descriptionController,
                    maxLength: 2000,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Enter your description here",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String updatedTitle = titleController.text;
                      String updatedCategory = categoryController.text;
                      String updatedDescription = descriptionController.text;

                      FirebaseFirestore.instance
                          .collection("practical9_blog")
                          .doc(widget.blogId)
                          .update({
                        "title": updatedTitle,
                        "category": updatedCategory,
                        "description": updatedDescription,
                      }).then((value) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BlogList(),
                          ),
                        );
                      }).catchError((error) {
                        print("Error updating data: $error");
                      });
                    },
                    child: Text("SAVE"),
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
