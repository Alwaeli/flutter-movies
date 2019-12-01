import 'package:flutter/material.dart';
import 'package:myfluttertask/services/MovieService.dart';
import 'package:myfluttertask/models/MovieInfo.dart';
import 'package:myfluttertask/components/PaddedText.dart';

class MovieDetail extends StatelessWidget {
  final String movieName;
  final String imdbId;

  MovieDetail({this.movieName, this.imdbId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black ,
      appBar: AppBar(
        backgroundColor:Colors.black ,
        title: Text(this.movieName,style: TextStyle(color: Colors.white),
        ),),
      
      body: FutureBuilder<MovieInfo>(
          future: getMovie(this.imdbId),
          builder: (context, i) {
            if (i.hasData) {
              return Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          alignment: Alignment.center,
                          child: Image.network(
                            i.data.poster,
                            width: 200,
                          ),
                        ),
                        Text(i.data.plot, textAlign: TextAlign.justify),
                        PaddedText("Year : " + i.data.year),
                        PaddedText("Genre : " + i.data.genre),
                        PaddedText("Directed by : " + i.data.director),
                        PaddedText("Runtime : " + i.data.runtime),
                        PaddedText("Rated : " + i.data.rating),
                        PaddedText("IMDB Rating : " + i.data.imdbRating),
                        PaddedText("Meta Score : " + i.data.metaScore),
                      ]));
            } else if (i.hasError) {
              return Text("${i.error}",style: TextStyle(color: Colors.red),);
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}