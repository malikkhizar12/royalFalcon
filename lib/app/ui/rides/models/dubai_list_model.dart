class DubaiListModel {
  final String imageUrl;
  final String name;
  final double starRating;
  final double totalRatings;
  final int totalReviews;
  final String price;

  DubaiListModel({
    required this.imageUrl,
    required this.name,
    required this.starRating,
    required this.totalRatings,
    required this.totalReviews,
    required this.price,
  });

  static List<DubaiListModel> getDubaiRides() {
    return [
      DubaiListModel(
        imageUrl: 'images/car_image.png',
        name: 'Lexus ES 300H',
        starRating: 4.8,
        totalRatings: 4.8,
        totalReviews: 150,
        price: '100 AED',
      ),
      DubaiListModel(
        imageUrl: 'images/car_image.png',
        name: 'Mercedes Benz S Class',
        starRating: 4.8,
        totalRatings: 4.8,
        totalReviews: 150,
        price: '225 AED',
      ),
      DubaiListModel(
        imageUrl: 'images/car_image.png',
        name: 'Chevrolet Malibu',
        starRating: 4.8,
        totalRatings: 4.8,
        totalReviews: 150,
        price: '225 AED',
      ),
      DubaiListModel(
        imageUrl: 'images/car_image.png',
        name: 'Toyota Previa',
        starRating: 4.8,
        totalRatings: 4.8,
        totalReviews: 150,
        price: '200 AED',
      ),
      DubaiListModel(
        imageUrl: 'images/car_image.png',
        name: 'Toyota Previa',
        starRating: 4.8,
        totalRatings: 4.8,
        totalReviews: 150,
        price: '200 AED',
      ),
      DubaiListModel(
        imageUrl: 'images/car_image.png',
        name: 'Toyota Previa',
        starRating: 4.8,
        totalRatings: 4.8,
        totalReviews: 150,
        price: '200 AED',
      ),
      DubaiListModel(
        imageUrl: 'images/car_image.png',
        name: 'Toyota Previa',
        starRating: 4.8,
        totalRatings: 4.8,
        totalReviews: 150,
        price: '200 AED',
      ),
    ];
  }
}
