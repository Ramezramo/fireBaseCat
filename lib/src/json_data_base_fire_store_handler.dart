class json_hander{
  final String? id;
  final String? fullname;
  final String? email;
  final String? phone_num;
  final String? password ;

  const json_hander({this.id,this.fullname,this.email,this.password,this.phone_num});

  tojson(){
    return {
      "fullname":fullname,
      "email":email,
      "phone_num":phone_num,
      "pass":password
    };
  }

}