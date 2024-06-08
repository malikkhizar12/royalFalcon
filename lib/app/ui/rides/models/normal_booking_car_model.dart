class CarModel {
  final String name;
  final String imageUrl;
  final double rating;
  final double price;
  final String currency;

  CarModel({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.price,
    required this.currency,
  });
  static List<CarModel> normal_booking_cars()
  {
    return [
      CarModel(
      name: "Lexus ES 300H",
      imageUrl: "images/lexus300.png",
      rating: 4.8,
      price: 425,
      currency: "AED",
    ),
      CarModel(
        name: "Lexus ES 300H",
        imageUrl: "images/lexus300.png",
        rating: 4.8,
        price: 425,
        currency: "AED",
      ),
      CarModel(
        name: "Lexus ES 300H",
        imageUrl: "images/lexus300.png",
        rating: 4.8,
        price: 425,
        currency: "AED",
      ),
      CarModel(
        name: "Lexus ES 300H",
        imageUrl: "images/lexus300.png",
        rating: 4.8,
        price: 425,
        currency: "AED",
      ),
      CarModel(
        name: "Lexus ES 300H",
        imageUrl: "images/lexus300.png",
        rating: 4.8,
        price: 425,
        currency: "AED",
      ),
    ];
  }
}
