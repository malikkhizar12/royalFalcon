class AbuDhabiListModel {
  final String imageUrl;
  final String name;
  final double starRating;
  final double totalRatings;
  final int totalReviews;
  final String price;

  AbuDhabiListModel({
    required this.imageUrl,
    required this.name,
    required this.starRating,
    required this.totalRatings,
    required this.totalReviews,
    required this.price,
  });

  static List<AbuDhabiListModel> getAbuDhabiRides() {
    return [
      AbuDhabiListModel(
        imageUrl: 'images/car_image.png',
        name: 'Toyota Camry',
        starRating: 4.8,
        totalRatings: 4.8,
        totalReviews: 150,
        price: '150 AED',
      ),
      AbuDhabiListModel(
        imageUrl: 'images/car_image.png',
        name: 'BMW X5',
        starRating: 4.8,
        totalRatings: 4.8,
        totalReviews: 150,
        price: '275 AED',
      ),
      AbuDhabiListModel(
        imageUrl: 'images/car_image.png',
        name: 'Audi A6',
        starRating: 4.8,
        totalRatings: 4.8,
        totalReviews: 150,
        price: '250 AED',
      ),
      AbuDhabiListModel(
        imageUrl: 'images/car_image.png',
        name: 'Nissan Altima',
        starRating: 4.8,
        totalRatings: 4.8,
        totalReviews: 150,
        price: '175 AED',
      ),AbuDhabiListModel(
        imageUrl: 'images/car_image.png',
        name: 'Nissan Altima',
        starRating: 4.8,
        totalRatings: 4.8,
        totalReviews: 150,
        price: '175 AED',
      ),
    ];
  }
}
