import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Addstudent extends StatelessWidget {
   Addstudent({super.key});

  TextEditingController fname=TextEditingController();
  TextEditingController lname=TextEditingController();
  TextEditingController college=TextEditingController();
  TextEditingController dob=TextEditingController();
  TextEditingController course=TextEditingController();
  TextEditingController mob=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController address=TextEditingController();

  Future<void> sendData() async{
    final apiUrl=
        Uri.parse("https://logix-space-course-app-1.onrender.com/addstudents");
    
    try{
      final response=await http.post(
        apiUrl,
        headers: {'Content-Type':'application/json',
        },
        body: jsonEncode( {
          "firstname": fname.text,
          "lastname": lname.text,
          "college": college.text,
          "dob": dob.text,
          "course": course.text,
          "mobile": mob.text,
          "email": email.text,
          "address": address.text

        }),
      );
      if(response.statusCode==200){
        print("Successfully Added");
      }
      else{
       print("Something Went wrong");
      }
    }
    catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            TextField(
              controller: fname,
              decoration: InputDecoration(
                labelText: "First name",
                hintText: "Enter first name",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: lname,
              decoration: InputDecoration(
                  labelText: "Last name",
                  hintText: "Enter last name",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: college,
              decoration: InputDecoration(
                  labelText: "College",
                  hintText: "Enter college",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: dob,
              decoration: InputDecoration(
                  labelText: "DOB",
                  hintText: "Enter date of birth",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: course,
              decoration: InputDecoration(
                  labelText: "Course",
                  hintText: "Enter course name",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: mob,
              decoration: InputDecoration(
                  labelText: "Mobile Number",
                  hintText: "Enter mobile number",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: email,
              decoration: InputDecoration(
                  labelText: "Email id",
                  hintText: "Enter email id",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: address,
              decoration: InputDecoration(
                  labelText: "Address",
                  hintText: "Enter address",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero
                    ),
                    backgroundColor: Colors.green
                  ),
                  onPressed: () async{

                    await sendData();
                  },
                  child: Text("Submit",
                  style: TextStyle(color: Colors.white,fontSize: 20.0),)),
            )
          ],
        ),
      ),
    );
  }
}
