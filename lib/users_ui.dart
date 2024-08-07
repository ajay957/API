import 'dart:convert';

import 'package:apicreation/api/user_class/user_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserUI extends StatefulWidget {
  const UserUI({super.key});

  @override
  State<UserUI> createState() => _UserUIState();
}

class _UserUIState extends State<UserUI> {
  List<UserClass> userData = [];

  Future<List<UserClass>> getDataUser() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
        final data = jsonDecode(response.body);

        if(response.statusCode == 200){
          for(var element in data){
            userData.add(UserClass.fromJson(element));
          } return userData;
        } else {
          return userData;
        }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("User Complex Data"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getDataUser(),
        builder: (BuildContext context, AsyncSnapshot<List<UserClass>> snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else {
            return Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
              itemCount: userData.length,
              itemBuilder: (contecxt, index) {
                final obj = userData[index];
                return Card(
                  color: Colors.tealAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data![index].name.toString(),
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          obj.email.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                         obj.username.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                         Row(
                          children: [
                            const Text(
                          "Address: ",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                            Text(snapshot.data![index].address!.city.toString()),
                          ],
                        )
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
