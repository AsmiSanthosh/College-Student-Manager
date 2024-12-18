import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class ViewAllStudent extends StatefulWidget {
  const ViewAllStudent({super.key});

  @override
  State<ViewAllStudent> createState() => _ViewAllStudentState();
}

class _ViewAllStudentState extends State<ViewAllStudent> {
  List<Map<String,dynamic>> students= [];

  Future<void> fetchStudentsData() async{
   final apiUrl = Uri.parse("https://logix-space-course-app-1.onrender.com/getdata");

   try{
     final response=await http.get(apiUrl);
     if(response.statusCode==200)
       {
        List data=json.decode(response.body);
        setState(() {
          students=List<Map<String,dynamic>>.from(data);
        });
       }
     else{
       throw Exception("Failed to fetch API Data");
     }
   }
   catch(exception){
    print(exception);
   }
  }

  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchStudentsData();
  }
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index){
          return Card(
            elevation: 4,
            child: ListTile(
              title: Text(students[index]["firstname"]),
              subtitle: Text(students[index]["email"]+ "\n" + students[index]["mobile"] + "\n"+ students[index]["course"] + "\n" + students[index]["dob"] + "\n" + students[index]["college"]),
            ),
          );
        }
    );
  }
}