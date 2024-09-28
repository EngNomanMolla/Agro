import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_biniyog/App/constant/base_url.dart';

import '../../../../data/model/blog_model.dart'; // Import intl package

class BlogDetailsScreen extends StatelessWidget {

  Data blog;

  BlogDetailsScreen(this.blog) ;

  String formatDate(String date) {
    final DateTime parsedDate = DateTime.parse(date);
    return DateFormat('dd MMM yyyy').format(parsedDate); // Formatting to 01 Jun 2024
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: ()=>Get.back(),
          child: Icon(Icons.arrow_back_ios,color: Colors.white),
        ),
        title: Text(blog.title!, style: TextStyle(fontSize: 18,color: Colors.white)),
        backgroundColor: Color(0xff38b579),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Blog Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                api_base_url+blog.image!, // Replace with your image path
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),

            // Blog Title
            Text(
              blog.title!,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
            SizedBox(height: 10),

            // Blog Creation Date
            Text(
              'Published on ${formatDate(blog.createdAt!)}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 20),
            Text(
              blog.description!,
              style: TextStyle(fontSize: 15, height: 1.5,color: Colors.black.withOpacity(0.5) ),
            ),
          ],
        ),
      ),
    );
  }
}
