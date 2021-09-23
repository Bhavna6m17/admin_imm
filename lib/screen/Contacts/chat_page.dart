import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';



class chatbot extends StatefulWidget {
   String image;
   String name;
   String phone;
   chatbot({this.image, this.name,this.phone});
  // final int coins;


  @override
  _chatbotState createState() => _chatbotState();
}

class _chatbotState extends State<chatbot> {
  final messageInsert = TextEditingController();
  List<Map> messsages = List();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leadingWidth: 2.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        /*leading: IconButton(icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.black54,), onPressed: (){
          Navigator.pop(context);
        }),*/
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundImage:
              widget.image== ""?AssetImage('images/business man icon.png'): NetworkImage(widget.image),
            ),
            Flexible(child: Text(widget.name,style:
            TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black54),
              overflow: TextOverflow.fade,)),
          ],),
        actions: [
          SizedBox(width: 5,),
          InkWell(
              onTap: ()async{},
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: CircleAvatar(backgroundColor:Colors.blue.shade900,
                  child: Center(child: Icon(Icons.call,

                    color: Colors.white,),),),
              )),
          SizedBox(width: 5,),
          // InkWell(
          //     onTap: ()async{
          //
          //     },
          //     child: CircleAvatar(backgroundColor:Colors.blueAccent,child: Center(child: Icon(Icons.video_call,color: Colors.white,),),))
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            messsages.isEmpty?Flexible(child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 150,width: 150,
                    decoration: BoxDecoration(shape: BoxShape.circle,
                        image: DecorationImage(
                            image: widget.image== ""?AssetImage('images/business man icon.png'): NetworkImage(widget.image),
                        )
                    ),
                  ),
                  SizedBox(height: 5,),
                  Flexible(child: Text(widget.name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black54),overflow: TextOverflow.fade,)),
                  // Text('Follow: 10M',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black54),)
                ],
              ),
            ),)


                :Flexible(
                child: ListView.builder(
                    reverse: true,
                    itemCount: messsages.length,
                    itemBuilder: (context, index) => chat(
                        messsages[index]["message"].toString(),
                        messsages[index]["data"]))),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: roundedContainer(),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (messageInsert.text.isEmpty) {
                        print("empty message");
                        //BotToast.showText(text: 'Empty message');
                      } else {
                        setState(() {
                          messsages.insert(0,
                              {"data": 1, "message": messageInsert.text});
                        });
                        //response(messageInsert.text);
                        messageInsert.clear();
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.blue.shade900,
                      child: Icon(Icons.send,color: Colors.white,),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            )
          ],
        ),
      ),
    );
  }

  //for better one i have use the bubble package check out the pubspec.yaml
  Widget roundedContainer (){
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            SizedBox(width: 8.0),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLengthEnforced: true,
                maxLength: 40,
                controller: messageInsert,
                decoration: InputDecoration(
                  counterText: "",
                  hintText: 'Type a message',
                  border: InputBorder.none,
                ),
              ),
            ),
            Icon(Icons.attach_file,
                size: 30.0, color: Colors.blue.shade900),
            SizedBox(width: 8.0),
            Icon(Icons.camera_alt,
                size: 30.0, color: Colors.blue.shade900),
            SizedBox(width: 8.0),
          ],
        ),
      ),
    );
  }

  Widget chat(String message, int data) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Bubble(
          radius: Radius.circular(15.0),
          // color: data == 0 ? myColors.blue[500] : Colors.orange[700],
          elevation: 0.0,
          alignment: data == 0 ? Alignment.topLeft : Alignment.topRight,
          nip: data == 0 ? BubbleNip.leftBottom : BubbleNip.rightTop,
          child: Padding(
            padding: EdgeInsets.all(2.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage:
           data== 0? Container():(widget.image!=""?NetworkImage(widget.image):AssetImage('images/business man icon.png')),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Flexible(
                    child: Text(
                      message,
                      style: TextStyle(
                          color: Colors.blue.shade900, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          )),
    );
  }
}