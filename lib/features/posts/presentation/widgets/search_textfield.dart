import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_explorer/features/posts/controllers/posts_controller.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PostsController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        textInputAction: TextInputAction.search,
        onChanged: (value) {
          controller.searchPosts(value);
        },
        decoration: InputDecoration(
          hintText: 'Search posts...',
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          filled: true,
          fillColor: Colors.grey.withAlpha(25),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 20.0,
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: Colors.grey.withAlpha(100),
              width: 1.0,
            ),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: Colors.grey.withAlpha(100),
              width: 1.0,
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: Colors.grey.withAlpha(100),
              width: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
