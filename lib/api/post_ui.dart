import 'dart:convert';

import 'package:apicreation/api/post_class/post_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostUI extends StatefulWidget {
  const PostUI({super.key});

  @override
  State<PostUI> createState() => _PostUIState();
}

class _PostUIState extends State<PostUI> {

  List<PostClass> postList = [];

  Future<List<PostClass>> getData() async{
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts")
    );

    final data = jsonDecode(response.body);

    if(response.statusCode == 200){
      for(var element in data){
        postList.add(PostClass.fromJson(element));    
      }
      return postList;
    } else {
      return postList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Post Api"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: FutureBuilder<List<PostClass>>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<List<PostClass>> snapshot){ 
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return  ListView.builder(
              itemCount: postList.length, 
              itemBuilder: (context, index){
                final obj = postList[index];
                return Card(
                  color: Colors.yellow,
                  child: Column(  
                    children: [
                      Text(
                        overflow: TextOverflow.ellipsis,
                        obj.title.toString(),
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        postList[index].body.toString()
                      )
                    ],
                  ),
                ); 
              },
              );
          }
        }
        )
      
      
     
    );
  }
}