import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practical_10/Services/firebase_operations.dart';
import 'package:practical_10/screens/add_blog_screen.dart';

class BlogList extends StatefulWidget {
  const BlogList({super.key});

  @override
  State<BlogList> createState() => _BlogListState();
}

class _BlogListState extends State<BlogList> {
  Stream<QuerySnapshot> collection = FirebaseOperations.fetchBlog();

  Future<void> _refreshData() async {
    collection = FirebaseOperations.fetchBlog();

    // Simulate a delay to show the loading indicator
    await Future.delayed(Duration(seconds: 1));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Blog Application',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.black,
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width * 1,
                  child: StreamBuilder(
                    stream: collection,
                    builder: (context, Snapshot) {
                      if (Snapshot.hasData) {
                        return ListView(
                          children: Snapshot.data!.docs
                              .map(
                                (e) => Card(
                                  child: ListTile(
                                    title: Expanded(child: Text(e['title'])),
                                    subtitle: Row(
                                      children: [
                                        Text(e['category'].toString()),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          onPressed: () async {
                                            // First button action
                                            var res =
                                                FirebaseOperations.editBlog(
                                                    context, e.id);
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () async {
                                            var res =
                                                FirebaseOperations.deleteBlog(
                                                    e.id);
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.purple),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddBlog(),
                ));
              },
              child: Text(
                "New Blog",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
