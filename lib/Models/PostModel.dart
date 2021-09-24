// import 'package:firebase_database/firebase_database.dart';

import 'package:firebase_database/firebase_database.dart';

class PostModel {
  String address;
  String buyerEmail;
  String category;
  String date;
  String buyerPhone;
  String profileimage;
  String description;
  String designation;
  String experience;
  String field;
  String image;
  String joblocation;
  String mobile;
  String name;
  String pid;
  String productState;
  String publisher;
  String qualification;
  String salaryExpect;
  String time;
  String title;
  String uid;

  PostModel(
      {this.address,
      this.buyerEmail,
      this.category,
      this.date,
      this.buyerPhone,
      this.profileimage,
      this.description,
      this.designation,
      this.experience,
      this.field,
      this.image,
      this.joblocation,
      this.mobile,
      this.name,
      this.pid,
      this.productState,
      this.publisher,
      this.qualification,
      this.salaryExpect,
      this.time,
      this.title,
      this.uid});

  PostModel.fromSnapshot(DataSnapshot snapshot) {
    address = snapshot.value['address'];
    buyerEmail = snapshot.value['buyerEmail'];
    category = snapshot.value['category'];
    date = snapshot.value['date'];
    buyerPhone = snapshot.value['buyerPhone'];
    profileimage = snapshot.value['profileimage'];
    description = snapshot.value['description'];
    designation = snapshot.value['designation'];
    experience = snapshot.value['experience'];
    field = snapshot.value['field'];
    image = snapshot.value['image'];
    joblocation = snapshot.value['joblocation'];
    mobile = snapshot.value['mobile'];
    name = snapshot.value['name'];
    pid = snapshot.value['pid'];
    productState = snapshot.value['productState'];
    publisher = snapshot.value['publisher'];
    qualification = snapshot.value['qualification'];
    salaryExpect = snapshot.value['salaryExpect'];
    time = snapshot.value['time'];
    title = snapshot.value['title'];
    uid = snapshot.value['Uid'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['address'] = this.address;
  //   data['buyerEmail'] = this.buyerEmail;
  //   data['category'] = this.category;
  //   data['date'] = this.date;
  //   data['buyerPhone'] = this.buyerPhone;
  //   data['profileimage'] = this.profileimage;
  //   data['description'] = this.description;
  //   data['designation'] = this.designation;
  //   data['experience'] = this.experience;
  //   data['field'] = this.field;
  //   data['image'] = this.image;
  //   data['joblocation'] = this.joblocation;
  //   data['mobile'] = this.mobile;
  //   data['name'] = this.name;
  //   data['pid'] = this.pid;
  //   data['productState'] = this.productState;
  //   data['publisher'] = this.publisher;
  //   data['qualification'] = this.qualification;
  //   data['salaryExpect'] = this.salaryExpect;
  //   data['time'] = this.time;
  //   data['title'] = this.title;
  //   data['Uid'] = this.uid;
  //   return data;
  // }
}
