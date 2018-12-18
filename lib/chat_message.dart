import 'package:flutter/material.dart';
const String _name="Pawan";

class ChatMessage extends StatelessWidget{
  final String text;
  ChatMessage({this.text});
  final List<ChatMessage> message = <ChatMessage>[];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(right: 16),
            child: new CircleAvatar(
              child: new Text(_name[0]),
            ),
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(_name,style: Theme.of(context).textTheme.subhead),
              new Container(
                margin: const EdgeInsets.only(top: 5),
                child: new Text(text),
              )
            ],
          )
        ],
      ),
    );
  }

}