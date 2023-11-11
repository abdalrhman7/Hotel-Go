class HotelModel {
  String? name;
  int? starts;
  int? price;
  String? currency;
  String? image;
  num? reviewScore;
  String? review;
  String? address;

  HotelModel({
    this.name,
    this.starts,
    this.price,
    this.currency,
    this.image,
    this.reviewScore,
    this.review,
    this.address,
  });

  HotelModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    starts = json['starts'];
    price = json['price'];
    currency = json['currency'];
    image = json['image'];
    reviewScore = json['review_score'];
    review = json['review'];
    address = json['address'];
  }
}
