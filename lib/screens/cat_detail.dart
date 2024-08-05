import 'dart:convert';

import 'package:catbreeds/styles/styles.dart';
import 'package:catbreeds/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../const/const.dart';
import '../service/service_api.dart';

class CatDetail extends StatefulWidget {
  final String name, image,description,id;
  const CatDetail({super.key, required this.name, required this.image, required this.description, required this.id});

  @override
  State<CatDetail> createState() => _CatDetailState();
}

class _CatDetailState extends State<CatDetail> {

  bool isLoading = true;
  String life_span = '';
  num adaptability = 0, child_friendly = 0, dog_friendly = 0, energy_level = 0, grooming = 0, health_issues = 0, intelligence = 0, shedding_level = 0, social_needs = 0, stranger_friendly = 0, vocalisation = 0;

  @override
  void initState() {
    // TODO: implement initState
    getCatData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(widget.name.toUpperCase(), style: textTitleLogo,),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: isLoading == true ? const Loading() : Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/catbreeds.png',
                placeholderScale: 80,
                imageErrorBuilder: (context, error, stackTrace) {

                  return Center(child: Text('Image not available'));
                },
                image: widget.image, height: screenWidth, width: screenWidth, fit: BoxFit.cover,),
            ),
            SizedBox(
              height: 6,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(widget.description, style: textCardTitle,),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.access_time_outlined),
                        SizedBox(
                          width: 4,
                        ),
                        Text('Life Span: ', style: textCardTitle,),
                        Text(life_span+' years', style: textCardTitle,),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Card(
                      shape: cardShape,
                      color: AppColors.primaryWhite,
                      elevation: 8,
                      shadowColor: AppColors.primaryBlack,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('CAT DATA', style: textCardTitle,),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text('Adaptability', style: textCardData,)),
                                Expanded(
                                  flex: 3,
                                  child: LinearPercentIndicator(
                                    lineHeight: 12.0,
                                    percent: (((adaptability/100)/5)*100).toDouble(),
                                    barRadius: const Radius.circular(8),
                                    backgroundColor: AppColors.backgroundColor,
                                    progressColor: Colors.brown,
                                  ),
                                ),
                                Text(adaptability.toString(), style: textTitleLogo,)
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text('Child Friendly', style: textCardData,)),
                                Expanded(
                                  flex: 3,
                                  child: LinearPercentIndicator(
                                    lineHeight: 12.0,
                                    percent: (((child_friendly/100)/5)*100).toDouble(),
                                    barRadius: const Radius.circular(8),
                                    backgroundColor: AppColors.backgroundColor,
                                    progressColor: Colors.brown,
                                  ),
                                ),
                                Text(child_friendly.toString(), style: textTitleLogo,)
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text('Dog Friendly', style: textCardData,)),
                                Expanded(
                                  flex: 3,
                                  child: LinearPercentIndicator(
                                    lineHeight: 12.0,
                                    percent: (((dog_friendly/100)/5)*100).toDouble(),
                                    barRadius: const Radius.circular(8),
                                    backgroundColor: AppColors.backgroundColor,
                                    progressColor: Colors.brown,
                                  ),
                                ),
                                Text(dog_friendly.toString(), style: textTitleLogo,)
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text('Energy Level', style: textCardData,)),
                                Expanded(
                                  flex: 3,
                                  child: LinearPercentIndicator(
                                    lineHeight: 12.0,
                                    percent: (((energy_level/100)/5)*100).toDouble(),
                                    barRadius: const Radius.circular(8),
                                    backgroundColor: AppColors.backgroundColor,
                                    progressColor: Colors.brown,
                                  ),
                                ),
                                Text(energy_level.toString(), style: textTitleLogo,)
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text('Grooming', style: textCardData,)),
                                Expanded(
                                  flex: 3,
                                  child: LinearPercentIndicator(
                                    lineHeight: 12.0,
                                    percent: (((grooming/100)/5)*100).toDouble(),
                                    barRadius: const Radius.circular(8),
                                    backgroundColor: AppColors.backgroundColor,
                                    progressColor: Colors.brown,
                                  ),
                                ),
                                Text(grooming.toString(), style: textTitleLogo,)
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text('Health Issues', style: textCardData,)),
                                Expanded(
                                  flex: 3,
                                  child: LinearPercentIndicator(
                                    lineHeight: 12.0,
                                    percent: (((health_issues/100)/5)*100).toDouble(),
                                    barRadius: const Radius.circular(8),
                                    backgroundColor: AppColors.backgroundColor,
                                    progressColor: Colors.brown,
                                  ),
                                ),
                                Text(health_issues.toString(), style: textTitleLogo,)
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text('Intelligence', style: textCardData,)),
                                Expanded(
                                  flex: 3,
                                  child: LinearPercentIndicator(
                                    lineHeight: 12.0,
                                    percent: (((intelligence/100)/5)*100).toDouble(),
                                    barRadius: const Radius.circular(8),
                                    backgroundColor: AppColors.backgroundColor,
                                    progressColor: Colors.brown,
                                  ),
                                ),
                                Text(intelligence.toString(), style: textTitleLogo,)
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text('Shedding Level', style: textCardData,)),
                                Expanded(
                                  flex: 3,
                                  child: LinearPercentIndicator(
                                    lineHeight: 12.0,
                                    percent: (((shedding_level/100)/5)*100).toDouble(),
                                    barRadius: const Radius.circular(8),
                                    backgroundColor: AppColors.backgroundColor,
                                    progressColor: Colors.brown,
                                  ),
                                ),
                                Text(shedding_level.toString(), style: textTitleLogo,)
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text('Social Needs', style: textCardData,)),
                                Expanded(
                                  flex: 3,
                                  child: LinearPercentIndicator(
                                    lineHeight: 12.0,
                                    percent: (((social_needs/100)/5)*100).toDouble(),
                                    barRadius: const Radius.circular(8),
                                    backgroundColor: AppColors.backgroundColor,
                                    progressColor: Colors.brown,
                                  ),
                                ),
                                Text(social_needs.toString(), style: textTitleLogo,)
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text('Stranger Friendly', style: textCardData,)),
                                Expanded(
                                  flex: 3,
                                  child: LinearPercentIndicator(
                                    lineHeight: 12.0,
                                    percent: (((stranger_friendly/100)/5)*100).toDouble(),
                                    barRadius: const Radius.circular(8),
                                    backgroundColor: AppColors.backgroundColor,
                                    progressColor: Colors.brown,
                                  ),
                                ),
                                Text(stranger_friendly.toString(), style: textTitleLogo,)
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text('Vocalisation', style: textCardData,)),
                                Expanded(
                                  flex: 3,
                                  child: LinearPercentIndicator(
                                    lineHeight: 12.0,
                                    percent: (((vocalisation/100)/5)*100).toDouble(),
                                    barRadius: const Radius.circular(8),
                                    backgroundColor: AppColors.backgroundColor,
                                    progressColor: Colors.brown,
                                  ),
                                ),
                                Text(vocalisation.toString(), style: textTitleLogo,)
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future getCatData() async {
    final serviceApiUrl = ServiceApi(baseUrl: Const.baseUrl);
    try {
      final getResponse = await serviceApiUrl.getMethod('breeds/${widget.id}');
      final responseList = json.decode(getResponse.body);

      setState(() {
        life_span = responseList['life_span'] ?? 'no data';
        adaptability = responseList['adaptability'] ?? 0;
        child_friendly = responseList['child_friendly'] ?? 0;
        dog_friendly = responseList['dog_friendly'] ?? 0;
        energy_level = responseList['energy_level'] ?? 0;
        grooming = responseList['grooming'] ?? 0;
        health_issues = responseList['health_issues'] ?? 0;
        intelligence = responseList['intelligence'] ?? 0;
        shedding_level = responseList['shedding_level'] ?? 0;
        social_needs = responseList['social_needs'] ?? 0;
        stranger_friendly = responseList['stranger_friendly'] ?? 0;
        vocalisation = responseList['vocalisation'] ?? 0;
        isLoading = false;
      });

    } catch (e) {
      setState(() {
        print('Error:'+ e.toString());
        isLoading = false;
      });
    }
  }
}
