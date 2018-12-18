import 'package:flutter/material.dart';
import 'package:flutter_first_chatme/chat_message.dart';


class ChatScreen extends StatefulWidget{
  @override
  State createState()=> new ChatScreenState();

}
class ChatScreenState extends State<ChatScreen>{
  final TextEditingController _textEditingController= new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];


  void _handleSubmitted(String text){
    _textEditingController.clear();
    ChatMessage _message = new ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, _message);
    });

}
  Widget _textComposerWidget(){
    return IconTheme(
      data: new IconThemeData(color: Colors.greenAccent),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                decoration: new InputDecoration.collapsed(hintText: "Send a Message"),
                controller: _textEditingController,
                onSubmitted: _handleSubmitted,
              ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed:()=>_handleSubmitted(_textEditingController.text),

              ),
            )

          ],
        ),

        ),
    );

}
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[
        new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_,int index)=>_messages[index],
              itemCount: _messages.length

            )
        ),
        new Divider(height: 1.0,),
        new Container(decoration: new BoxDecoration(
            color: Theme.of(context).cardColor
        ),
          child: _textComposerWidget(),
        )
      ],
    );
  }

}
