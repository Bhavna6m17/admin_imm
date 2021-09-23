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
      {
        this.address,
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

   PostModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    buyerEmail = json['buyerEmail'];
    category = json['category'];
    date = json['date'];
    buyerPhone = json['buyerPhone'];
    profileimage = json['profileimage'];
    description = json['description'];
    designation = json['designation'];
    experience = json['experience'];
    field = json['field'];
    image = json['image'];
    joblocation = json['joblocation'];
    mobile = json['mobile'];
    name = json['name'];
    pid = json['pid'];
    productState = json['productState'];
    publisher = json['publisher'];
    qualification = json['qualification'];
    salaryExpect = json['salaryExpect'];
    time = json['time'];
    title = json['title'];
    uid = json['Uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['buyerEmail'] = this.buyerEmail;
    data['category'] = this.category;
    data['date'] = this.date;
    data['buyerPhone'] = this.buyerPhone;
    data['profileimage'] = this.profileimage;
    data['description'] = this.description;
    data['designation'] = this.designation;
    data['experience'] = this.experience;
    data['field'] = this.field;
    data['image'] = this.image;
    data['joblocation'] = this.joblocation;
    data['mobile'] = this.mobile;
    data['name'] = this.name;
    data['pid'] = this.pid;
    data['productState'] = this.productState;
    data['publisher'] = this.publisher;
    data['qualification'] = this.qualification;
    data['salaryExpect'] = this.salaryExpect;
    data['time'] = this.time;
    data['title'] = this.title;
    data['Uid'] = this.uid;
    return data;
  }
}
