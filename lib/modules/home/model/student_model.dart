
class Student {
  int? id;
  String? name;
  int? phnNumber;
  String? fName;
  String? address;
  String? teacherUid;

  Student({this.id, this.name, this.fName, this.address, this.phnNumber,this.teacherUid});

  // Map toJson() => {
  //   'id':id,
  //   'name':name,
  //   'Phone_number':phnNumber,
  //   "Father's_Name":fName,
  //   "Address":address,
  //   "teacherUid":teacherUid
  //
  // };

factory Student.fromJson(Map<String, dynamic> json){
  return Student(
      id:json['id'],
       name:json['name'],
      phnNumber:json['Phone_number'],
      fName:json["Father's_Name"],
      address:json["Address"],
       teacherUid:json["teacherUid"]

  );
}

  //  Student.fromJson(Map<String,dynamic> json){
  //   id=json['id'];
  //   name=json['name'];
  //   phnNumber=json['Phone_number'];
  //   fName=json["Father's_Name"];
  //   address=json["Address"];
  //   teacherUid=json["teacherUid"];
  // }
  //
  // Map<String,dynamic> toJson(){
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['name'] = name;
  //   data['Phone_number'] = phnNumber;
  //   data["Father's_Name"]=fName;
  //   data['Address']=address;
  //   data['teacherUid']=teacherUid;
  //   return data;
  // }


}