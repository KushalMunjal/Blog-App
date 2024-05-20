import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practical_10/Services/edit_blog_screen.dart';
import 'package:practical_10/screens/add_blog_screen.dart';
import 'package:practical_10/screens/blog_list.dart';

var db = FirebaseFirestore.instance;

class FirebaseOperations {
  static addblog(String title, String category, String description) {
    String demo = '';
    final blog = <String, dynamic>{
      "title": title,
      "category": category,
      "description": description,
      "blog_dt": DateTime.now().toString(),
    };

    db.collection("practical9_blog").add(blog).whenComplete(() {
      demo = 'Blog added successfully';
    });

    return demo;
  }

  static Stream<QuerySnapshot> fetchBlog() {
    CollectionReference collection = db.collection("practical9_blog");
    return collection.snapshots();
  }

  static deleteBlog(String id) {
    String resp = '';
    DocumentReference docRef = db.collection("practical9_blog").doc(id);

    docRef.delete().whenComplete(() {
      resp = 'Blog deleted successfully';
    });
    return resp;
  }

  static editBlog(BuildContext context, String id) {
    String edit = '';
    DocumentReference docRef = db.collection("practical9_blog").doc(id);

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => EditBlogScreen(
        blogId: id,
      ),
    ));
  }
}
