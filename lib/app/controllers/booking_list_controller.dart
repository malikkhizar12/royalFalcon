import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class BookingListController extends GetxController {
  final _jsonDataList = RxList<Map<String, dynamic>>([]);
  List<Map<String, dynamic>> get jsonDataList => _jsonDataList;

  // Define isLoading variable to track data loading state
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchAlbums();
    super.onInit();
  }

  void fetchAlbums() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);
        List<Map<String, dynamic>> albumsData = jsonResponse.cast<Map<String, dynamic>>();
        _jsonDataList.value = albumsData;
        update(); // Manually trigger UI update
      } else {
        throw Exception('Failed to load albums');
      }
    } catch (e) {
      print('Error fetching albums: $e');
    } finally {
      isLoading.value = false; // Set isLoading to false when data fetching completes or fails
    }
  }
}
