import 'package:flutter/material.dart';
import 'package:wallpaper_app/views/screens/category.dart';

class Catblock extends StatelessWidget {
  String categoryName;
  String categoryImgSrc;

  Catblock(
      {super.key, required this.categoryImgSrc, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryScreen(
                    catImgUrl: categoryImgSrc, catName: categoryName)));
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 7),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                    height: 50, width: 100, fit: BoxFit.cover, categoryImgSrc),
              ),
              Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Positioned(
                  left: 25,
                  top: 15,
                  child: Text(
                    categoryName,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ))
            ],
          )),
    );
  }
}
