import 'dart:convert';

import 'package:catbreeds/const/const.dart';
import 'package:catbreeds/models/cat.dart';
import 'package:catbreeds/screens/cat_detail.dart';
import 'package:catbreeds/service/service_api.dart';
import 'package:catbreeds/styles/styles.dart';
import 'package:catbreeds/widgets/loading.dart';
import 'package:flutter/material.dart';

class SearchCat extends StatefulWidget {
  const SearchCat({super.key});

  @override
  State<SearchCat> createState() => _SearchCatState();
}

class _SearchCatState extends State<SearchCat> {

  bool isLoading = true;
  List<Cat> listOfCats = [];
  List<Cat> filteredCats = [];
  final searchCatsController = TextEditingController();
  
  @override
  void initState() {
    // TODO: implement initState
    getListOfCats().then((onValue){
      setState(() {
        filteredCats = listOfCats;
        isLoading = false;
      });
      searchCatsController.addListener(() {
        filterList();
      });
    });
    super.initState();
  }

  void filterList() {
    setState(() {
      filteredCats = listOfCats.where((item) {
        return item.name.toLowerCase().contains(searchCatsController.text.toLowerCase());
      }).toList();
    });
  }

  @override
  void dispose() {
    searchCatsController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: isLoading == true ? const Loading() : Container(
        color: AppColors.backgroundColor,
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text('CATBREEDS', style: textTitleLogo,),
              ),
              TextField(
                controller: searchCatsController,
                decoration: textFieldDecoration.copyWith(hintText: 'Buscar por raza...'),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: filteredCats.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Stack(
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => CatDetail(name: filteredCats[index].name, image: filteredCats[index].imageUrl, description: filteredCats[index].description, id: filteredCats[index].id)),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: FadeInImage.assetNetwork(
                                  placeholder: 'assets/catbreeds.png',
                                  placeholderScale: 80,
                                  imageErrorBuilder: (context, error, stackTrace) {

                                return Center(child: Text('Image not available'));
                                },
                                  image: filteredCats[index].imageUrl, height: screenWidth, width: screenWidth, fit: BoxFit.cover,),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        decoration: backgroundDecoration,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(filteredCats[index].name, style: textCardTitle,),
                                        )),
                                    const Expanded(child: SizedBox()),
                                    Container(
                                        decoration: cardBackgroundDecoration,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(filteredCats[index].origin, textAlign: TextAlign.end, style: textCardData,),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future getListOfCats() async {
    final serviceApiUrl = ServiceApi(baseUrl: Const.baseUrl);
    try {
      final getResponse = await serviceApiUrl.getMethod('breeds');
      final responseList = json.decode(getResponse.body);

     for (var item in responseList) {
       final serviceApiUrl = ServiceApi(baseUrl: Const.getImageUrl);
       final getResponseImages = await serviceApiUrl.getMethod(item['reference_image_id']);
       String imageUrl = json.decode(getResponseImages.body)['url'];

       listOfCats.add(Cat(id: item['id'], name: item['name'], origin: item['origin'], description: item['description'], life_span: item['life_span'], reference_image_id: item['reference_image_id'], imageUrl : imageUrl));
      }

    } catch (e) {
      setState(() {
        print('Error:'+ e.toString());
        isLoading = false;
      });
    }
  }
}
