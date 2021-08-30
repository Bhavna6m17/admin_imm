import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatefulWidget {
  final String type;
  final String name;
  final String phone;
  final String profileimg;
  final String email;
  final List data;

  const UserDetails(
      {Key key,
      this.type,
      this.name,
      this.phone,
      this.profileimg,
      this.email,
      this.data})
      : super(key: key);
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Center(
          child: Text(
            widget.name,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: ListView(
            children: [
              // Text(widget.data[0]['name']),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    widget.profileimg != ""
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewImage(
                                      image: widget.profileimg,
                                    )),
                          )
                        : showDialog(
                      context: context,
                          builder:(context)=>AlertDialog(
                            title: Text("No image here!"),
                            actions: [
                              ElevatedButton(onPressed: (){
                                Navigator.pop(context);
                              }, child: Text("Cancel"))
                            ],

                          )
                        );
                  },
                  child: CircleAvatar(
                      radius: 80,
                      backgroundImage: widget.profileimg == ""
                          ? AssetImage('images/icons_person.png')
                          : NetworkImage(widget.profileimg)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.name ?? "",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.phone ?? "",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.email ?? "",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Company Name',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Color(0xff0d47a1))),
                  onPressed: () {
                  },
                  child: Text(
                    "View Details",
                    style: TextStyle(color: Colors.white, fontSize: 23),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.call,
      //         size: 40,
      //         color: Colors.black,
      //       ),
      //       label: 'Calls',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.photo,
      //         size: 40,
      //         color: Colors.black,
      //       ),
      //       label: 'Posts',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.chat,
      //         size: 40,
      //         color: Colors.black,
      //       ),
      //       label: 'Chats',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.check_box_outlined,
      //         size: 40,
      //         color: Colors.black,
      //       ),
      //       label: 'Status',
      //     ),
      //   ],
      // ),

    );
  }
}

class ViewImage extends StatelessWidget {
  final String image;
  const ViewImage({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(image),
          ),
        ),
      ),
    );
  }
}
