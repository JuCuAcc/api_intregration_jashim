
/*List<Data> dataFromJson(String str) => List<Data>.from(json.decode(str).map((x) => Data.fromJson(x)));

String dataToJson(List<Data> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));*/

class Data {
  Data({
   required this.bookId,
   required this.bookName,
   required this.categoryId,
   required this.category,
   required this.publisherId,
   required this.publisher,
   required this.authorId,
   required this.author,
   required this.description,
   required this.edition,
   required this.price,
   required this.isActive,
  });

  int bookId;
  String bookName;
  int categoryId;
  dynamic category;
  int publisherId;
  dynamic publisher;
  int authorId;
  dynamic author;
  String description;
  String edition;
  int price;
  bool isActive;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    bookId: json["bookId"],
    bookName: json["bookName"],
    categoryId: json["categoryId"],
    category: json["category"],
    publisherId: json["publisherId"],
    publisher: json["publisher"],
    authorId: json["authorId"],
    author: json["author"],
    description: json["description"],
    edition: json["edition"],
    price: json["price"],
    isActive: json["isActive"],
  );

  Map<String, dynamic> toJson() => {
    "bookId": bookId,
    "bookName": bookName,
    "categoryId": categoryId,
    "category": category,
    "publisherId": publisherId,
    "publisher": publisher,
    "authorId": authorId,
    "author": author,
    "description": description,
    "edition": edition,
    "price": price,
    "isActive": isActive,
  };
}
