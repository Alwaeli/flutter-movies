import 'package:flutter/material.dart';
import 'package:myfluttertask/components/MovieList.dart';
import 'package:myfluttertask/screens/MovieDetail.dart';
import 'package:myfluttertask/services/MovieService.dart';
import 'package:myfluttertask/models/Movie.dart' ;
import 'package:flutter/services.dart';

class MoviesAppHome extends StatefulWidget {
  @override
  MoviesAppHomeState createState() => MoviesAppHomeState();
}

class MoviesAppHomeState extends State<MoviesAppHome> {
  final searchTextController = new TextEditingController();
  String searchText = "";
  
  

  @override
  void dispose() {
    searchTextController.dispose();
    
    super.dispose();
  }

  void itemClick(Movie item) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MovieDetail(
                movieName: item.title,
                imdbId: item.imdbID,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor:Colors.black ,
        appBar: AppBar(
          backgroundColor:Colors.black ,
          title: Center(child: Text('My flutter  movies task ')),
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: Row(children: <Widget>[
                Flexible(
                  child: TextField(
                    
                    style: TextStyle(color: Colors.white),
                    controller: searchTextController,
                    decoration:
                        InputDecoration(hintText: 'Enter your search',
                        hintStyle: TextStyle(color:Colors.white),
                        ), 
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  color:Colors.white ,
                  tooltip: 'Search Movies',
                  onPressed: () {
                    setState(() {
                      searchText = searchTextController.text;
                      SystemChannels.textInput.invokeMethod('TextInput.hide');
                    });
                  },
                ),

                
                 
              ]
              ),
              padding: EdgeInsets.all(10),
            ),
           

                   if (searchText.length > 0)
              FutureBuilder<List<Movie>>(
                  future: searchMovies(searchText ),
                  builder: (context, v) {
                    if (v.hasData) {
                      return Expanded(
                          child: MovieList(
                              movies: v.data,
                              itemClick: this.itemClick));
                    } else if (v.hasError) {
                      return Text("${v.error}",style: TextStyle(color:Colors.red),);
                    }
                    return CircularProgressIndicator();
                    
                  }),

                 

               
                 

        ])
        );
  }
}