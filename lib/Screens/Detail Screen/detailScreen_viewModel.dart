import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as https;
import 'package:url_launcher/url_launcher.dart';

class DetailScreenViewModel extends BaseViewModel {
  Map<String, dynamic> detailScreenData = {}; 
  List<dynamic> watchTrailer = []; 

  bool isWatchTrailerLoading = false;
  bool isDetailScreenLoading = false;
  late String trailerLink; 
  bool isTrailerAvailable = true;

 
  getDetailScreenMovie(int? movieID) async {
    isDetailScreenLoading = true;
    var url = Uri.parse("https://api.themoviedb.org/3/movie/$movieID?api_key=54a43eea6d03e9da4a2851af343aeda0");
    var response = await https.get(url);
    var responseBody = jsonDecode(response.body);
    detailScreenData = responseBody;
    isDetailScreenLoading = false;
    notifyListeners();
  }

  
  getWatchTrailer(int? movieID) async {
    var url = Uri.parse("https://api.themoviedb.org/3/movie/$movieID/videos?api_key=54a43eea6d03e9da4a2851af343aeda0");
    var response = await https.get(url);
    var responseBody = jsonDecode(response.body);
    watchTrailer = responseBody["results"];

    final trailer = watchTrailer.firstWhere(
    (video) => video['type'] == 'Trailer' && video['name'] != null && video['name'].toLowerCase().contains('trailer'),
    orElse: () => null,
  );

    if (trailer != null) {
      final trailerKey = trailer['key'];
      trailerLink = "https://www.youtube.com/watch?v=$trailerKey";
      isTrailerAvailable = true;   
      notifyListeners();
      print(trailerLink);
    } else {
      print("No trailer found.");
      isTrailerAvailable = false; 
       notifyListeners();
    }
  }

  void launchTrailer(BuildContext context) async {
  if (isTrailerAvailable && trailerLink.isNotEmpty) {
    if (await canLaunchUrl(Uri.parse(trailerLink))) {
      await launchUrl(Uri.parse(trailerLink), mode: LaunchMode.inAppWebView);
    } else {
      print("Failed to launch trailer");
    }
  } else {
    // Show SnackBar or handle the case where trailer is not available
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.blue,
        content: Text(
          'Trailer Not Available',
          style: TextStyle(color: Colors.white,fontSize: 15),
        ),
        duration: Duration(seconds: 2),
      ),
    );
  }
} }


  
  

