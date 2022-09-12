import 'package:flutter/material.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key,}) : super(key: key);
  @override
  State<MainMenu> createState() => _MainMenuState();
}
class _MainMenuState extends State<MainMenu> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
          title:const Text("DataCity-menu")
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("-Search Filters-",textScaleFactor: 2.5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: height*0.15,
                  width: width*0.25,
                  child: TextButton(onPressed:(){
                    Navigator.pushNamed(context, "/searchbyname");
                  },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          )
                        )
                      )
                      , child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.location_city,color: Colors.white,),
                      Text("NAME",style: TextStyle(color: Colors.white),)
                    ],
                  )),
                ),
                SizedBox(
                  height: height*0.15,
                  width: width*0.25,
                  child: TextButton(onPressed:(){
                    Navigator.pushNamed(context, "/searchbycountry");
                  },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blue),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              )
                          )
                      )
                      , child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.flag,color: Colors.white,),
                          Text("COUNTRY",style: TextStyle(color: Colors.white),)
                        ],
                      )),
                ),
                SizedBox(
                  height: height*0.15,
                  width: width*0.26,
                  child: TextButton(onPressed:(){
                    Navigator.pushNamed(context, "/searchbyarea");
                  },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blue),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              )
                          )
                      )
                      , child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.panorama_photosphere,color: Colors.white,),
                          Text("COORDINATE",style: TextStyle(color: Colors.white),)
                        ],
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
