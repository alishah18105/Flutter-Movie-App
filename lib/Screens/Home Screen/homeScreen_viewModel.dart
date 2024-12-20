import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import 'package:stacked/stacked.dart';
import "dart:convert";
import "package:http/http.dart" as https;


class HomeScreenViewModel extends BaseViewModel{
  

List trending_movies = [];
List popular_movies = [];
List all_movies = [];
List filter_movies = [];
bool isTrendingLoading = false;
bool isPopularLoading = false;
TextEditingController search = TextEditingController();


Map<String, String> userData = {'email': 'abc@gmail.com', 'username': 'Abc'};

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      DocumentSnapshot userDataSnapshot = await firestore.collection('users').doc(user.uid).get();
      userData = {
        'email': userDataSnapshot['email'] ?? 'abc@gmail.com',
        'username': userDataSnapshot['username'] ?? 'Abc',
      };
      notifyListeners();  // Notify the UI to rebuild after fetching data
    }
  }

fireBase_logOut()async{
await FirebaseAuth.instance.signOut();

}

getTrendingMovieApi() async{
  isTrendingLoading = true;
  var url = Uri.parse("https://api.themoviedb.org/3/trending/movie/week?api_key=54a43eea6d03e9da4a2851af343aeda0");
  var response = await https.get(url);
  var responseBody = jsonDecode(response.body);
  trending_movies = responseBody["results"];
  isTrendingLoading = false;
notifyListeners();
}

getPopularMovieApi() async{
  isPopularLoading = true;
  var url = Uri.parse("https://api.themoviedb.org/3/movie/popular?api_key=54a43eea6d03e9da4a2851af343aeda0&language=en-US&page=1");
  var response = await https.get(url);
  var responseBody = jsonDecode(response.body);
  popular_movies = responseBody["results"];
  isPopularLoading = false;
notifyListeners();
}

getAllMovies()async{
  var url = Uri.parse("https://api.themoviedb.org/3/discover/movie?api_key=54a43eea6d03e9da4a2851af343aeda0");
  var response = await https.get(url);
  var responseBody = jsonDecode(response.body);
  all_movies = responseBody["results"];
}

void filterMovies(String query) {
  if(query.isEmpty){
filter_movies = [];  }
  else {
    filter_movies = all_movies.where((movie){
      final title = movie["original_title"]?.toLowerCase() ?? "";
      return title.contains(query.toLowerCase());
    }).toList();
  }
  notifyListeners();
}

}