import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/Api/api_constants.dart';
import 'package:final_project/Api/api_manager.dart';
import 'package:final_project/error_model/error_item.dart';
import 'package:final_project/home_page/save_item.dart';
import 'package:final_project/loading_effect/homeLoading.dart';
import 'package:final_project/loading_effect/image_loading.dart';
import 'package:final_project/model/RandomRecipeResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = "HomePage";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return
        FutureBuilder<RandomRecipeResponse?>(
            future: ApiManager.getRandomRecipe(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) => HomeLoading(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                );

                //   I have error
              } else if (snapshot.hasError) {
                return Center(
                  child: ErrorItem(errormessage: "something want wrong",error: (){
                     ApiManager.getRandomRecipe();
                    setState(() {
                    });
                  },),
                );
              }

              // Error from API
              if (snapshot.data?.status == 'failure') {
                return Center(
                  child:  ErrorItem(errormessage:snapshot.data?.message,error: (){
                    ApiManager.getRandomRecipe();
                    setState(() {
                    });
                  }, ),
                );

              }
              var recipes = snapshot.data?.recipes;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: GridView.builder(
                    itemCount: recipes?.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                CachedNetworkImage(
                                  imageUrl:
                                  "https://spoonacular.com/recipeImages/${recipes?[index].id}-636x393.jpg",
                                  placeholder: (context, url) =>
                                  ImageLoading(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: saveItem(),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            child: Text(
                              recipes?[index].title ?? "",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                            child: Text(
                              "Ready in ${recipes?[index].readyInMinutes}",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ],
                      );
                    }),
              );

            });


  }
}
