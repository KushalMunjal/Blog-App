import 'package:flutter/material.dart';
import 'package:practical_10/Services/firebase_operations.dart';
import 'package:practical_10/screens/blog_list.dart';

class AddBlog extends StatefulWidget {
  const AddBlog({super.key});

  @override
  State<AddBlog> createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController categorycontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Add Blog",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BlogList(),
                ));
              },
              child: Text(
                "See Your Blogs",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                TextField(
                  controller: titlecontroller,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Title",
                  ),
                ),
                TextField(
                  controller: categorycontroller,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Category",
                  ),
                ),
                SingleChildScrollView(
                  child: TextField(
                    controller: descriptioncontroller,
                    maxLength: 2000,
                    maxLines: 5,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "Description",
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    FirebaseOperations.addblog(titlecontroller.text,
                        categorycontroller.text, descriptioncontroller.text);

                    titlecontroller.clear();
                    descriptioncontroller.clear();
                    categorycontroller.clear();
                  },
                  child: Text(
                    "ADD",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.purple)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
