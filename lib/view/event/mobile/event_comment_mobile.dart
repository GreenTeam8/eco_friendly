import 'package:eco_friendly/controller/authentication_controller.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/helpers/size_config.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:eco_friendly/controller/comment_controller.dart';

import 'package:eco_friendly/controller/event_controller.dart';
import 'package:eco_friendly/model/comment.dart';
import 'package:eco_friendly/model/event.dart';

class EventCommentsScreen extends StatefulWidget {
  final String eventId;

  const EventCommentsScreen({required this.eventId});

  @override
  _EventCommentsScreenState createState() => _EventCommentsScreenState();
}

class _EventCommentsScreenState extends State<EventCommentsScreen> {
  TextEditingController _textEditingController = TextEditingController();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchComments();
  }

  Future<void> _fetchComments() async {
    try {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<CommentController>(context, listen: false)
          .fetchComments(widget.eventId);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final commentController = Provider.of<CommentController>(context);
    final authController = Provider.of<AuthenticationController>(context);
    final comments = commentController.getCommentsList;
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: mColor,),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text(
          'Comments',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: _isLoading
          ? Center(child: Lottie.asset('assets/lottie/loading.json', height: height * 0.2),)
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                final comment = comments[index];
                final subtitle = comment.userId;
                return ListTile(
                  leading: CircleAvatar(
                    child: Image.asset(
                      'assets/images/profileIcon.png',
                      color: Colors.white,
                    ),
                    radius: 25,
                  ),
                  title: Text(comment.text),
                  subtitle: Text(subtitle, style: TextStyle(fontSize: 12)),
                );
              },
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Add a comment...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () async {
                    final text = _textEditingController.text;
                    final userId = authController.email;
                    if (text.isNotEmpty) {
                      await commentController.addComment(
                          text, userId, widget.eventId);
                      _textEditingController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}