import 'package:flutter/material.dart';
import 'package:wallpaper_app/controller/apiOperation.dart';
import 'package:wallpaper_app/model/photosModel.dart';
import 'package:wallpaper_app/views/screens/fullScreen.dart';
import 'package:wallpaper_app/views/widgets/catBlock.dart';
import 'package:wallpaper_app/views/widgets/customAppBar.dart';
import 'package:wallpaper_app/views/widgets/searchBar.dart';

class CategoryScreen extends StatefulWidget {
  String catName;
  String catImgUrl;
  CategoryScreen({
    super.key,
    required this.catImgUrl,
    required this.catName,
  });

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late List<PhotosModel> categoryResults;
  bool isLoading = true;
  GetCatRelWall() async {
    categoryResults = await ApiOperations.searchWallpapers(widget.catName);

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    GetCatRelWall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.indigo[800],
        title: CustomAppBar(
          word1: 'Wallpaper',
          word2: ' Haeven',
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.network(
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                          widget.catImgUrl),
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black38,
                      ),
                      Positioned(
                        left: 150,
                        top: 50,
                        child: Column(
                          children: [
                            Text(
                              "Category",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white70),
                            ),
                            Text(
                              widget.catName,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white70),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: 700,
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 400,
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: categoryResults.length,
                      itemBuilder: ((context, index) => GridTile(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FullScreen(
                                            imgUrl: categoryResults[index]
                                                .imgSrc)));
                              },
                              child: Hero(
                                tag: categoryResults[index].imgSrc,
                                child: Container(
                                    height: 800,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.amberAccent,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                          height: 800,
                                          width: 50,
                                          fit: BoxFit.cover,
                                          categoryResults[index].imgSrc),
                                    )),
                              ),
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
