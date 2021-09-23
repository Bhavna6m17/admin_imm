import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ia_admin/screen/Contacts/Stream.dart';
import 'package:ia_admin/screen/Contacts/chat_page.dart';
import 'package:ia_admin/screen/Home/VDO/VideoList.dart';
import 'package:ia_admin/screen/Home/VDO/videoDemo.dart';
import 'package:ia_admin/screen/Home/seller/SellerDetails/SellerForm.dart';
import 'package:ia_admin/screen/Home/seller/SellerPost/SellerPost.dart';
import 'package:ia_admin/screen/Home/seller/SellerDetails/SellerDetails.dart';
import 'package:ia_admin/screen/Home/IletsTest.dart';
import 'package:ia_admin/provider/auth_provider.dart';
import 'package:ia_admin/screen/Home/Home.dart';
import 'package:ia_admin/screen/Home/seller/SellerPost/SellerPostStatus.dart';
import 'package:ia_admin/screen/SplashScreen.dart';
import 'package:provider/provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(Hello());
}

class Hello extends StatefulWidget {

  @override
  _HelloState createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return
      FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          // Check for errors

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return  MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_)=>AuthProvider())

              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                home: VideoViewer(),
              ),
            );
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return CircularProgressIndicator();
        },
      );

  }
}
class Online extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.white,
        child: Icon(Icons.chat,color: Colors.blue.shade900),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Chat()));
        },
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Online',
          style: TextStyle(color: Colors.black54, fontSize: 18),
        ),
      ),
      body: Column(
          children:[
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>chatbot()));
              },
              leading: CircleAvatar(
                  radius: 30,
                  backgroundImage:NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/The_Prime_Minister%2C_Shri_Narendra_Modi_addressing_at_the_webinar_for_effective_implementation_of_Union_Budget_in_Defence_Sector.jpg/1200px-The_Prime_Minister%2C_Shri_Narendra_Modi_addressing_at_the_webinar_for_effective_implementation_of_Union_Budget_in_Defence_Sector.jpg')
              ),
              title: Text('immigration'),
              trailing: Icon(Icons.circle_notifications,color: Colors.green,),
              subtitle: Text('Partner, India'),
            ),
          ]
      ),
    );
  }
}
class Chat extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              'Samavad',
              style: TextStyle(color: Colors.black54, fontSize: 18),
            ),
          ),
          body: Container(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  )),
              child:ChatListViewItem(
                  name: 'Narendra Modi',
                  image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/The_Prime_Minister%2C_Shri_Narendra_Modi_addressing_at_the_webinar_for_effective_implementation_of_Union_Budget_in_Defence_Sector.jpg/1200px-The_Prime_Minister%2C_Shri_Narendra_Modi_addressing_at_the_webinar_for_effective_implementation_of_Union_Budget_in_Defence_Sector.jpg',
                  message: 'Hello',
                  hasUnreadMessage : true
              ),



              /*StreamBuilder<List<ChatListModal>>(
                stream:database.readChatlist(),
                builder: (context, snapshot) {
                  if(snapshot.connectionState==ConnectionState.active){
                    if(snapshot.data!=null){
                      final pd=snapshot.data;
                      final pdata=pd.map((ChatListModal) => ChatListViewItem(chatListModal: ChatListModal,database:database ,user:user ,)).toList();
                      return ListView(
                          shrinkWrap: true,
                          children:pdata
                      );
                    }
                    else{
                      return CircularProgressIndicator();
                    }
                  }
                  else{
                    return CircularProgressIndicator();
                  }
                }
            ),*/
            ),
          ),
        ),
      ),
    );
  }

}

class ChatListViewItem extends StatelessWidget {
  String name;
  String image;
  String message;
  bool hasUnreadMessage;

  /*final ChatListModal chatListModal;
  final Database database;
  final Users user;
 const ChatListViewItem({
    this.chatListModal, this.database, this.user}) ;*/
  ChatListViewItem({
    this.name,this.image,this.message,this.hasUnreadMessage
  });

  @override
  Widget build(BuildContext context) {
    return
      Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 10,
                child: ListTile(
                  title: Text(
                    name??'',
                    style: TextStyle(fontSize: 16),
                  ),
                  subtitle: Text(
                    message??'',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        image??'https://bit.ly/38viNvQ'
                    ),
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('12:45AM',
                        // chatListModal.time??'',
                        style: TextStyle(fontSize: 12),
                      ),
                      hasUnreadMessage??''
                          ? Container(
                        margin: const EdgeInsets.only(top: 5.0),
                        height: 18,
                        width: 18,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            )),
                        child: Center(
                            child: Text(
                              '3',
                              //chatListModal.newMesssageCount.toString(),
                              style: TextStyle(fontSize: 11),
                            )),
                      )
                          : SizedBox()
                    ],
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>chatbot()));
                  },
                ),
              ),
            ],
          ),
          Divider(
            endIndent: 12.0,
            indent: 12.0,
            height: 0,
          ),
        ],
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.black87,
          icon: Icons.delete,
          onTap: ()async{

          },
        )
      ],
    );
  }
}
