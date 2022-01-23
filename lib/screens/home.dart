import 'package:crewbellatest/Animation/FadeAnimation.dart';
import 'package:crewbellatest/mods/screenconfig.dart';
import 'package:crewbellatest/screens/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String name;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: Text("Crewbella",style: TextStyle(color: Colors.white,fontSize: 21,fontWeight: FontWeight.w700),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
          SizedBox(
            height: screenHeight(context) * 0.05,
            width: screenWidth(context),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FadeAnimation(
              0.3, Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text("Enter User Name",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black.withOpacity(0.7),
                          fontWeight: FontWeight.w500,
                        ),),

                      SizedBox(
                        height: screenHeight(context) * 0.05,
                      ),


                      Container(
                        height: screenHeight(context) * 0.07,
                        width: screenWidth(context) * 0.90,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black.withOpacity(0.6)
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          onChanged: (value) {
                            name = value;
                          },
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                                RegExp("[0-9a-zA-Z_ ]"))
                          ],
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: 'chiragbalani',
                            border: InputBorder.none,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: screenHeight(context) * 0.03,
                      ),

                      FlatButton(
                          color: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                  uname: name,
                                ),
                              ),
                            ) ;
                          },
                          child: Container(
                            child: Center(
                              child: Text(
                                "Search",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            width: MediaQuery.of(context).size.width/1.2,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
