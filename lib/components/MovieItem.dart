import 'package:flutter/material.dart';
import 'package:myfluttertask/models/Movie.dart' as models;

class MovieItem extends StatelessWidget {
  final models.Movie movie;
  MovieItem({this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        
        children: <Widget>[
          Column(children: <Widget>[
            if (this.movie.poster != "N/A")
              Image.network(this.movie.poster, height: 100, width: 100)
          ]),
          Expanded(child: Column(
             
              children: <Widget>[
                Text(
                  this.movie.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(color: Colors.white),
                ), 
                Padding(padding: EdgeInsets.all(12),),
                Text(this.movie.year,
                 style: TextStyle(color: Colors.white),
                 ),
              ]),)
        ],
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 8, left: 10, right: 10),
      decoration:
              BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),color: Colors.grey[900]),
     );
  }
}