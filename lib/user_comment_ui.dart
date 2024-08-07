import 'dart:convert';

import 'package:apicreation/api/user_comments/user_comments/user_comments.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CommentUI extends StatefulWidget {
  const CommentUI({super.key});

  @override
  State<CommentUI> createState() => _CommentUIState();
}

class _CommentUIState extends State<CommentUI> {
  List<UserComments> commentList = [];

  Future<List<UserComments>> getData() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/comments")
        );
        final data = jsonDecode(response.body);

        if(response.statusCode == 200){
          for(var element in data){
            commentList.add(UserComments.fromJson(element)
            );
          } return commentList;
        } else {
          return commentList;
        }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "User Comments",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<List<UserComments>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else{
            return Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
              itemCount: commentList.length,
              itemBuilder: (context, index) {

                final obj = commentList[index];
                return Card(
                  color: Colors.greenAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          obj.name.toString(),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Text(obj.email.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600
                        ),
                        ),
                        Text(obj.body.toString())
                      ],
                    ),
                  ),
                );
              }),
        );
          }
        }
      ),
    );
  }
}
