import 'dart:convert';

import 'package:eco_friendly/model/comment.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class CommentController with ChangeNotifier {
  List<Comment> _commentsList = [];

  List<Comment> get getCommentsList {
    return [..._commentsList];
  }

  Future<void> fetchComments(String eventId) async {
    try {
      final url = 'https://climate-change-ec951-default-rtdb.firebaseio.com/events/$eventId/comments.json';
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Comment> loadedComments = [];
      extractedData.forEach((commentId, commentData) {
        loadedComments.add(
          Comment(
            id: commentId,
            text: commentData['text'],
            userId: commentData['userId'],
            timestamp: DateTime.parse(commentData['timestamp']),
          ),
        );
      });
      _commentsList = loadedComments;
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> addComment(String text, String userId, String eventId) async {
    try {
      final url = 'https://climate-change-ec951-default-rtdb.firebaseio.com/events/$eventId/comments.json';
      final timeStamp = DateTime.now();

      final response = await http.post(Uri.parse(url), body: json.encode({
        'text': text,
        'userId': userId,
        'timestamp': timeStamp.toIso8601String(),
      }));

      final newComment = Comment(
        id: json.decode(response.body)['name'],
        text: text,
        userId: userId,
        timestamp: timeStamp,
      );

      _commentsList.add(newComment);
      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }


}