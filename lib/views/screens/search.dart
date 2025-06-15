import 'package:flutter/material.dart';
import 'package:wallpaper_app/controller/apiOperation.dart';
import 'package:wallpaper_app/model/photosModel.dart';
import 'package:wallpaper_app/views/screens/fullScreen.dart';
import 'package:wallpaper_app/views/widgets/catBlock.dart';
import 'package:wallpaper_app/views/widgets/customAppBar.dart';
import 'package:wallpaper_app/views/widgets/searchBar.dart';

class SearchScreen extends StatefulWidget {
  String query;
  SearchScreen({super.key, required this.query});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List<PhotosModel> searchResults;
  bool isLoading = true;
  GetSearchResults() async {
    searchResults = await ApiOperations.searchWallpapers(widget.query);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    GetSearchResults();
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
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: SearchBar1()),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: MediaQuery.of(context).size.height,
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 400,
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: searchResults.length,
                      itemBuilder: ((context, index) => GridTile(
                            //child:InkWell(onTapp:(){Navigator.push(context,MaterialPageRoute(builder: (context)=>FullScreen(imgUrl:searchResults[index].imgSrc))),},

                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FullScreen(
                                            imgUrl:
                                                searchResults[index].imgSrc)));
                              },
                              child: Hero(
                                tag: searchResults[index].imgSrc,
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
                                          searchResults[index].imgSrc),
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
