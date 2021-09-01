import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatus extends StatefulWidget {
  final String postImage;
  final String sellerPhone;
  final String sellerAddress;
  final String sellerEmail;
  final String slogo;
  final String discription;
  final String publisher;
  final String pid;
  final String productState;
  final String sellerName;


  const PostStatus({Key key, this.postImage, this.sellerPhone, this.sellerAddress, this.sellerEmail, this.slogo, this.discription, this.publisher, this.pid, this.productState, this.sellerName}) : super(key: key);

  @override
  _PostStatusState createState() => _PostStatusState();
}

class _PostStatusState extends State<PostStatus> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child:
          Column(
            children: [
              Container(
                height: 400,
                width: 800,
                child: Image.network(widget.postImage,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                   // color: Color(0xff0d47a1),
                    height: 35,
                    // width: 130,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => Color(0xff0d47a1),),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),

                              ),

        ),
                      ),
                      onPressed: () {
                      },
                      child: Text(
                        "Approve",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    // color: Color(0xff0d47a1),
                    height: 35,
                    // width: 130,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Color(0xff0d47a1),),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),

                          ),

                        ),
                      ),
                      onPressed: () {
                      },
                      child: Text(
                        "Unapprove",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    // color: Color(0xff0d47a1),
                    height: 35,
                    // width: 130,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Color(0xff0d47a1),),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),

                          ),

                        ),
                      ),
                      onPressed: () {
                      },
                      child: Text(
                        "Delete",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Center(
                child: Text(
                  "Seller Details",
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(elevation: 1,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Container(
                                  height: 100,
                                  width: 150,
                                  decoration: BoxDecoration(shape: BoxShape.circle,
                                  image: DecorationImage(image:NetworkImage(widget.slogo
                                  ),
                                    fit: BoxFit.cover,
                                  ),),

                              ),
                          ),

                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child:
                                  Text(
                                    widget.sellerName,
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                // Divider(color: Colors.grey,),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    widget.sellerPhone,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                // Divider(color: Colors.grey,),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    widget.sellerEmail,
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(color: Colors.grey,),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      widget.discription,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Divider(color: Colors.grey,),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      widget.productState,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
            ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
