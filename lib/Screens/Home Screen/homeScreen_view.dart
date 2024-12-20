import 'package:flutter/material.dart';
import 'package:movie_app/Screens/Detail%20Screen/detailScreen_view.dart';
import 'package:movie_app/Screens/Home%20Screen/homeScreen_viewModel.dart';
import 'package:movie_app/Screens/Login%20Screen/loginScreen_view.dart';
import 'package:movie_app/utilis/app_colors.dart';
import 'package:stacked/stacked.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeScreenViewModel(),
      onViewModelReady: (viewModel) {
        viewModel.getTrendingMovieApi();
        viewModel.getPopularMovieApi();
         viewModel.getAllMovies();
         viewModel.getUserData();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: AppColors.darkThemeColor,
          appBar: AppBar(
            
            leading: Builder(
              builder: (context) {
                return IconButton(onPressed: (){
                  Scaffold.of(context).openDrawer();
                }, icon: Icon(Icons.menu, size: 30, color: AppColors.lightBlue,));
              }
            ),
            
            backgroundColor: AppColors.darkThemeColor,
            title: Center(
              child: Container(
                        height: 60,
                        width: 60,
                        child: Image.asset(
                        'assets/images/appBar_Logo.png',
                          fit: BoxFit.contain,
                    ),
                  ),
                ), 
                      actions: [
                      IconButton(
                        icon: Icon(
                          Icons.logout,
                          size: 30,
                          color: AppColors.lightBlue, 
                        ),
                        onPressed: () {
                          viewModel.fireBase_logOut();
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> LoginScreenView()), (route) => false);
         
                        },
                      ),
                    ],
                ),

                drawer: Drawer(
                  backgroundColor: AppColors.darkThemeColor,
              child: ListView(
                children: [
                  SizedBox(
                    height: 200,
                    child: DrawerHeader(
                      decoration: BoxDecoration(
                        color: Color(0xFF007BFF),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage("assets/images/movie_app.JPG",),
                          ),
                          SizedBox(height: 10,),
                          Text("${viewModel.userData['username']}",style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),),
                          SizedBox(height: 5,),
                          Text("${viewModel.userData['email']}",style: TextStyle(color: AppColors.white, fontSize: 12)),
                    
                    
                        ],
                      )
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.home, color: Colors.white),
                    title: Text('Home',style: TextStyle(color: AppColors.white)),
                    onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreenView()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.person,color: Colors.white),
                    title: Text('Profile',style: TextStyle(color: AppColors.white)),
                    onTap: () {
                      // Handle Settings tap
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.favorite,color: Colors.white),
                    title: Text('Favorite',style: TextStyle(color: AppColors.white)),
                    onTap: () {
                      // Handle Logout tap
                    },
                  ),

                   ListTile(
                    leading: Icon(Icons.settings,color: Colors.white),
                    title: Text('Settings',style: TextStyle(color: AppColors.white)),
                    onTap: () {
                      
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.privacy_tip,color: Colors.white),
                    title: Text('Privacy & Policies',style: TextStyle(color: AppColors.white)),
                    onTap: () {
                      
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.logout,color: Colors.white),
                    title: Text('Logout', style: TextStyle(color: AppColors.white),),

                    onTap: () {
                      viewModel.fireBase_logOut();
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> LoginScreenView()), (route) => false);
                    },
                  ),
                ],
              ),
            ),
                body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: viewModel.search ,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: "Search",
                      hintStyle: TextStyle(color: AppColors.white),
                      suffixIcon: Icon(Icons.search, color: AppColors.white,),
                      fillColor: Colors.blue,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white),  // Border color when not focused
    ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    ) ,
                    style: TextStyle(color: Colors.white),
                    onChanged: (text){
                      viewModel.filterMovies(viewModel.search.text);
                    },
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    child: Expanded(
                      child: ListView.builder(
                        itemCount: viewModel.filter_movies.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index){
                          final movie = viewModel.filter_movies[index];
                          final posterPath = movie["poster_path"];
                          final imageUrl = "https://image.tmdb.org/t/p/w500$posterPath";
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreenView(movieId: movie["id"])));
                            },
                            child: Container(
                              color: Colors.black,
                              height: 60,
                              child: ListTile(
                                leading: Container(
                                  height: 50,
                                  width: 30,
                                  child: Image.network(imageUrl,fit: BoxFit.cover,)),
                                title: Text(movie["title"], style: TextStyle(color: Colors.white),),
                              ),
                            ),
                          );
                          
                        } ),
                    ),
                  ),

                  SizedBox(height: 10),


                  Text(
                    "Trending 🔥",
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 150,
                    child: viewModel.isTrendingLoading
                        ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: viewModel.trending_movies.length,
                            itemBuilder: (context, index) {
                              final movie = viewModel.trending_movies[index];
                              final posterPath = movie['poster_path'];
                              final imageUrl =
                                  "https://image.tmdb.org/t/p/w500$posterPath";
                              return Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: GestureDetector(
                                    onTap: (){

               Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreenView(movieId: movie["id"],)));
                 
                                    },
                                    child: Container(
                                      width: 120,
                                      child: Image.network(
                                        imageUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    "Popular Movies",
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  if (viewModel.isPopularLoading) Center(child: CircularProgressIndicator()) else GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 5.0,
                            childAspectRatio: 0.65,
                          ),
                          itemCount: viewModel.popular_movies.length,
                          itemBuilder: (context, index) {
                            final movie = viewModel.popular_movies[index];
                            final posterPath = movie['poster_path'];
                            final imageUrl =
                                "https://image.tmdb.org/t/p/w500$posterPath";

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreenView(movieId: movie["id"])));
                                    },
                                    child: Container(
                                      height: 180,
                                      width: double.infinity,
                                      child: Image.network(
                                        imageUrl,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Center(
                                  child: Text(
                                    movie["title"] ?? "No Title",
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
