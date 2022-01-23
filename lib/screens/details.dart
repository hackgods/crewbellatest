import 'dart:convert';

import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:crewbellatest/Animation/FadeAnimation.dart';
import 'package:crewbellatest/models/profilemodel.dart';
import 'package:crewbellatest/mods/profileapi.dart';
import 'package:crewbellatest/mods/screenconfig.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/src/widgets/image.dart' as imgs;


class DetailsScreen extends StatefulWidget {

  String uname;

  DetailsScreen({this.uname});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {


  Profilemodel profileModel = Profilemodel();
  bool isLoad = true;

  void getData() async {
    var client = http.Client();
      var response = await client.get(Uri.https('py.crewbella.com', '/user/api/profile/${widget.uname}'));
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      print(jsonMap);
      profileModel = Profilemodel.fromJson(jsonMap);
      setState(() {
        isLoad = false;
      });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile of ${widget.uname}",style: TextStyle(color: Colors.white,fontSize: 21,fontWeight: FontWeight.w700),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.redAccent,
      ),
      body: isLoad != true ?
      SingleChildScrollView(
        child: Column(
          children: [

            Container(
              height: screenHeight(context)/3,
              color: Colors.transparent,
              child: Stack(
                children: [
                  FadeAnimation(0.15, CachedNetworkImage(imageUrl: profileModel.basic.cover)),

                  Positioned(
                    bottom: 0,
                    left: screenWidth(context)/3,
                    right: screenWidth(context)/3,
                    child: FadeAnimation(
                      0.35, Container(
                          padding: EdgeInsets.all(8), // Border width
                          decoration: BoxDecoration(color: Colors.white.withOpacity(0.7), borderRadius: BorderRadius.circular(30)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(68), // Image radius
                              child: imgs.Image.network(profileModel.basic.imageHd, fit: BoxFit.cover),
                            ),
                          ),
                        ),
                    ),
                  )

                ],
              ),
            ),

            SizedBox(
              height: screenHeight(context)/50,
            ),

            Text(profileModel.basic.fullname,style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 23),),
            Text("@" + profileModel.basic.username,style: GoogleFonts.poppins(fontWeight: FontWeight.w300,fontSize: 16),),

            SizedBox(
              height: screenHeight(context)/50,
            ),

            profileModel.basic.bio != "" || profileModel.basic.bio != null ?
            Align(
              alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 22.0),
                  child: Text(profileModel.basic.bio,style: GoogleFonts.poppins(fontWeight: FontWeight.w300,fontSize: 16),),
                )) : SizedBox(),

            profileModel.basic.bio != "" || profileModel.basic.bio != null ? SizedBox(
              height: screenHeight(context)/50,
            ) : SizedBox(),

            FadeAnimation(
              0.4, Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: screenWidth(context)/1.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("Followers",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 18),),
                            Text(profileModel.basic.followings.toString(),style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 18),),
                          ],
                        ),

                        Column(
                          children: [
                            Text("Quick Books",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 18),),
                            Text(profileModel.basic.quickBookings.toString(),style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 18),),
                          ],
                        ),

                        Column(
                          children: [
                            Text("Visits",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 18),),
                            Text(profileModel.basic.visits.toString(),style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 18),),
                          ],
                        ),


                      ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: screenHeight(context)/60,
            ),

            profileModel.portfolio.length != 0 ? FadeAnimation(
              0.4, ExpansionCard(
                trailing: Icon(Icons.keyboard_arrow_down_rounded,color: Colors.redAccent,),
                title: Text("Portfolio",style: GoogleFonts.poppins(color: Colors.black.withOpacity(0.6),fontWeight: FontWeight.w600,fontSize: 18),),
                children: [
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: profileModel.portfolio.length,
                      itemBuilder: (context,i) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FadeAnimation(
                            0.4, Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: CachedNetworkImage(imageUrl: profileModel.portfolio[i].images[0].image)),
                                      Text("${profileModel.portfolio[i].projectName}",style: GoogleFonts.poppins(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.w500,fontSize: 20),),
                                      Text("${profileModel.portfolio[i].position}",style: GoogleFonts.poppins(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.w400,fontSize: 16),),
                                      SizedBox(
                                        height: screenHeight(context)/60,
                                      ),
                                      Text("${profileModel.portfolio[i].description}",style: GoogleFonts.poppins(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.w400,fontSize: 18),),

                                      SizedBox(
                                        height: screenHeight(context)/60,
                                      ),

                                    ],
                                  )
                              ),
                            ),
                          ),
                          ),
                        );
                      }
                  )
                ],
              ),
            ) : SizedBox(),

            profileModel.clientPostings.length != 0 ? FadeAnimation(
              0.4, ExpansionCard(
                trailing: Icon(Icons.keyboard_arrow_down_rounded,color: Colors.redAccent,),
                title: Text("Client Postings",style: GoogleFonts.poppins(color: Colors.black.withOpacity(0.6),fontWeight: FontWeight.w600,fontSize: 18),),
                children: [
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: profileModel.clientPostings.length,
                      itemBuilder: (context,i) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FadeAnimation(
                            0.4, Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  child: Column(
                                    children: [
                                      Text("${profileModel.clientPostings[i].description}",style: GoogleFonts.poppins(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.w400,fontSize: 18),),

                                      SizedBox(
                                        height: 20,
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Badge(
                                              toAnimate: true,
                                              shape: BadgeShape.square,
                                              badgeColor: Colors.redAccent,
                                              borderRadius: BorderRadius.circular(8),
                                              badgeContent: Text('${profileModel.clientPostings[i].profession}', style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w500),),
                                            ),

                                            Badge(
                                              toAnimate: true,
                                              shape: BadgeShape.square,
                                              badgeColor: Colors.redAccent,
                                              borderRadius: BorderRadius.circular(8),
                                              badgeContent: Text('${profileModel.clientPostings[i].experience} years', style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w500),),
                                            ),

                                            Badge(
                                              toAnimate: true,
                                              shape: BadgeShape.square,
                                              badgeColor: Colors.redAccent,
                                              borderRadius: BorderRadius.circular(8),
                                              badgeContent: Text('${profileModel.clientPostings[i].location}', style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600),),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            ),
                          ),
                          ),
                        );
                      }
                  )
                ],
              ),
            ) : SizedBox(
            ),



            profileModel.professions.length != 0 ? FadeAnimation(
              0.4, ExpansionCard(
                trailing: Icon(Icons.keyboard_arrow_down_rounded,color: Colors.redAccent,),
                title: Text("Profession",style: GoogleFonts.poppins(color: Colors.black.withOpacity(0.6),fontWeight: FontWeight.w600,fontSize: 18),),
                children: [
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: profileModel.professions.length,
                      itemBuilder: (context,i) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FadeAnimation(
                            0.4, Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Text("${profileModel.professions[i].title}",style: GoogleFonts.poppins(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.w500,fontSize: 20),),
                                      Text("${profileModel.professions[i].experience} years",style: GoogleFonts.poppins(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.w400,fontSize: 16),),
                                      SizedBox(
                                        height: screenHeight(context)/60,
                                      ),
                                      profileModel.professions[i].forQuickbook == true ?
                                      Text("${profileModel.professions[i].quickbookDetails.rateAmount} ${profileModel.professions[i].quickbookDetails.rateCurrency}/${profileModel.professions[i].quickbookDetails.rateDuration}",style: GoogleFonts.poppins(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.w400,fontSize: 18),): SizedBox(),

                                      SizedBox(
                                        height: screenHeight(context)/60,
                                      ),

                                    ],
                                  )
                              ),
                            ),
                          ),
                          ),
                        );
                      }
                  )
                ],
              ),
            ) : SizedBox(),

            SizedBox(
              height: screenHeight(context)/40,
            ),

          ],
        ),
      ) : Center(child: CircularProgressIndicator(),)
    );
  }
}
