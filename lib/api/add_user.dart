import 'dart:convert';
import 'package:apicreation/api/post_class/post_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  Future<PostClass> postdata(String title, String body) async{
      final response = await http.post(Uri.parse("https://jsonplaceholder.typicode.com/comments"), 
      headers: <String, String>{
        'Content-Type' : 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, dynamic>  
      {
        'title': title,
        'body': body
      })
      );
      var data = response.body;
      // ignore: avoid_print
      print(data);
      if(response.statusCode == 201){
        return PostClass.fromJson(jsonDecode(data) as Map<String, dynamic>);
      } else {
        throw Exception('failed to add post');
      }
    
  }

  String _responseMessage = ''; 

  Future<void> _submitPost() async{
    try{
      PostClass newPost = await postdata(titleController.text, bodyController.text);
      setState(() {
        _responseMessage = 'post created: ${newPost.title}';
      });
    } catch (e){
      setState(() {
        _responseMessage = e.toString();
      });
    }
  }

  @override
  void dispose(){
    titleController.dispose();
    bodyController.dispose  ();
    super.dispose();
  } 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add User To Internet"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'title'
                ),
              ),
              TextField(
                controller: bodyController,
                decoration: const InputDecoration(
                  labelText: 'body'
                ),
              ),
              ElevatedButton(
                onPressed: _submitPost, 
                // String title = titleController.text;
                // String body = bodyController.text;
                // PostClass data = await postdata(title, body);
                // setState(() {
                //   postClass = data;
                // });
              child: const Text("Submit")   
              ),

              const SizedBox(height: 20),

              Text(_responseMessage)
            ],
          ),
        ),
      ),
    );
  }
}