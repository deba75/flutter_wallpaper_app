import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/controller/apiOperation.dart';
import 'package:wallpaper_app/model/categoryModel.dart';
import 'package:wallpaper_app/model/photosModel.dart';
import 'package:wallpaper_app/views/screens/fullScreen.dart';
import 'package:wallpaper_app/views/widgets/catBlock.dart';
import 'package:wallpaper_app/views/widgets/customAppBar.dart';
import 'package:wallpaper_app/views/widgets/searchBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PhotosModel> trendingWallList = [];
  late List<CategoryModel> CatModList;
  bool isLoading = true;
  GetCatDetails() async {
    CatModList = await ApiOperations.getCategoriesList();
    print("Getting Cat Mod List");
    print(CatModList);
    setState(() {
      CatModList = CatModList;
    });
  }

  getTrendingWallpapers() async {
    trendingWallList = await ApiOperations.getTrendingWallpaper();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    GetCatDetails();
    getTrendingWallpapers();
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
          word2: ' Heaven',
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
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: CatModList.length,
                          itemBuilder: ((context, index) => Catblock(
                                categoryImgSrc: CatModList[index].catImgUrl,
                                categoryName: CatModList[index].catName,
                              ))),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 700,
                      child: RefreshIndicator(
                        onRefresh: () async {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        },
                        child: GridView.builder(
                          physics: BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 400,
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: trendingWallList.length,
                          itemBuilder: ((context, index) => GridTile(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => FullScreen(
                                                imgUrl: trendingWallList[index]
                                                    .imgSrc)));
                                  },
                                  child: Hero(
                                    tag: trendingWallList[index].imgSrc,
                                    child: Container(
                                        height: 800,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.amberAccent,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                              height: 800,
                                              width: 50,
                                              fit: BoxFit.cover,
                                              trendingWallList[index].imgSrc),
                                        )),
                                  ),
                                ),
                              )),
                        ),
                      ))
                ],
              ),
            ),
    );
  }
}
