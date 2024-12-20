
import 'package:flutter/material.dart';
import 'package:movie_app/Screens/Detail%20Screen/detailScreen_viewModel.dart';
import 'package:movie_app/utilis/app_colors.dart';
import 'package:stacked/stacked.dart';
class DetailScreenView extends StatelessWidget {
  final int movieId;

  const DetailScreenView({super.key, required this.movieId});

  

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => DetailScreenViewModel(),
      onViewModelReady: (viewModel) {
        viewModel.getDetailScreenMovie(movieId); 
        viewModel.getWatchTrailer(movieId);
      },
      builder: (context, viewModel, child) {

        final movie = viewModel.detailScreenData;
        
        if (viewModel.isDetailScreenLoading) {
          return Center(child: CircularProgressIndicator());
        }

              
        final posterPath = movie["poster_path"] ;
        final backDropPath = movie["backdrop_path"];
        final hrs = movie["runtime"] ~/60;
        final min = movie["runtime"] % 60;
        final duration = "${hrs}h ${min}m";
        return Scaffold(
          backgroundColor: AppColors.darkThemeColor,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.lightBlue, 
              ),
              onPressed: () {
                Navigator.pop(context);  
              },
            ),
            title: Center(child: Text("", style: TextStyle(color: AppColors.white),)),
            backgroundColor: AppColors.darkThemeColor,
          ),
          body:   SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.blue,
                      child: Image.network("https://image.tmdb.org/t/p/w500$backDropPath",fit: BoxFit.fill,),
                    ),
                    Positioned(
                        left: 10,
                        bottom: -80,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Stack(
                              children:[ Container(
                                width: 120,
                                height: 160,
                                child: Image.network(
                                  "https://image.tmdb.org/t/p/w500$posterPath",
                                  fit: BoxFit.contain,
                                ),
                              ),
                              ],
                            ),
                          ),
            ),
            
                  ],
                ),
                SizedBox(height: 60),
                 Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){
                           
                          viewModel.launchTrailer(context);
                        
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.play_arrow,color: Colors.blue,),
                            SizedBox(width: 5,),
                            Text("Play Trailer", style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                  Text(movie["title"], 
                  style: TextStyle(fontSize: 24, color: Colors.white,fontWeight: FontWeight.bold),
                  maxLines: 2,  
                  overflow: TextOverflow.ellipsis,
                 softWrap: true,
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(Icons.calendar_today_rounded,color: AppColors.lightgrey,size: 20,),
                    SizedBox(width: 5,),
                    Text(movie["release_date"],style: TextStyle(color: AppColors.lightgrey, fontSize: 17),),
                
                    SizedBox(width: 25,),
                    Icon(Icons.timer_outlined,color: AppColors.lightgrey,size: 23,),
                    SizedBox(width: 5,),
                
                    Text("$duration", style: TextStyle(color: AppColors.lightgrey,fontSize: 17),), 
                  ],
                ),
                SizedBox(height: 16,),
                Text(movie["tagline"],style: TextStyle(color: AppColors.lightgrey, fontSize: 18, fontStyle: FontStyle.italic),),
                SizedBox(height: 15,),
                Text("Overview",style: TextStyle(color: AppColors.white, fontSize: 22,fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text(movie["overview"], style: TextStyle(color: AppColors.lightgrey),),
             
             SizedBox(height: 20),
            
                    ],
                  ),
                ),
                
                 ],
            ),
          ),
        );
      },
    );
  }
}
