class PostModel{
  String time,body;
  PostModel({this.time,this.body});
  Map<String,dynamic> toMap(){
    return {
      "time":time,
      "body":body
    };
  }
}