import 'package:flutter/material.dart';
import 'package:myfluttertask/components/MovieItem.dart';
import 'package:myfluttertask/models/Movie.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movies;
  final Function itemClick;
 
  MovieList({this.movies, this.itemClick});

  @override
  Widget build(context) {
    return new Container(
        decoration: BoxDecoration(color: Colors.black),
        child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: this.movies.length,
            itemBuilder: (BuildContext context, int i) {
              return new GestureDetector(
                  child: MovieItem(movie: this.movies[i]),
                  onTap: () => this.itemClick(this.movies[i]));
            }));
  }
}