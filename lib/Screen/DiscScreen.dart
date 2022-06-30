import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:note_app/Screen/HomeScreen.dart';
import 'package:note_app/helper/HelperNote.dart';

import '../constants.dart';

class DiscScreen extends StatefulWidget {


  @override
  _DiscScreenState createState() => _DiscScreenState();
}

class _DiscScreenState extends State<DiscScreen> {
  String? title,dateTime,description;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add ToDo",
            style: TextStyle(
              color: textcolor,
              fontSize: fontLarge,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios,color: textcolor,size: 25,),
          ),
          backgroundColor: primarydarkcolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(RadiusCircular),
              bottomRight:Radius.circular(RadiusCircular),
            ),
          ),

        ),
        backgroundColor: primarycolor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(DPadding),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: DPadding),
                  child: TextFormField(
                    style: TextStyle(
                      color: textcolor,
                    ),
                    cursorColor: textcolor,
                   decoration: InputDecoration(

                     labelText: "Title",
                     labelStyle: TextStyle(color: green),
                     hintText: "Enter Title",
                     contentPadding: EdgeInsets.all(DPadding),
                     helperStyle: TextStyle(color: primarydarkcolor),
                     fillColor: primarydarkcolor,
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20),
                       borderSide:BorderSide(
                           color: primarydarkcolor,
                           width: 0.5
                       ),
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(DPadding),
                       borderSide:BorderSide(
                           color: primarydarkcolor,
                           width: 0.5
                       ),


                     ),

                   ),
                    onChanged: (value){
                     setState(() {
                       title=value;
                     });
                    },
                  ),
                ),
                SizedBox(height: SizedBoxheight,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: DPadding),
                  child: TextFormField(
                    keyboardType: TextInputType.datetime,
                   decoration: InputDecoration(

                     labelText: "Date",
                     labelStyle: TextStyle(color: green),
                     hintText: "Enter Date",
                     contentPadding: EdgeInsets.all(DPadding),
                     helperStyle: TextStyle(color: primarydarkcolor),
                     fillColor: primarydarkcolor,
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20),
                       borderSide:BorderSide(
                           color: primarydarkcolor,
                           width: 0.5
                       ),
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(DPadding),
                       borderSide:BorderSide(
                           color: primarydarkcolor,
                           width: 0.5
                       ),


                     ),

                   ),
                    cursorColor: textcolor,
                    style: TextStyle(
                      color: textcolor,
                    ),
                    onChanged: (value){
                     setState(() {
                       dateTime=value;
                     });
                    },
                  ),
                ),
                SizedBox(height: SizedBoxheight,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: DPadding),
                  child: TextFormField(
                    maxLines: 8,
                    style: TextStyle(
                      color: textcolor,
                    ),
                    cursorColor: textcolor,
                    decoration: InputDecoration(

                      labelText: "Note",
                      labelStyle: TextStyle(color: green),
                      hintText: "Enter Note",
                      contentPadding: EdgeInsets.all(DPadding),
                      helperStyle: TextStyle(color: primarydarkcolor),
                      fillColor: primarydarkcolor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:BorderSide(
                            color: primarydarkcolor,
                            width: 0.5
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(DPadding),
                        borderSide:BorderSide(
                            color: primarydarkcolor,
                            width: 0.5
                        ),


                      ),

                    ),
                    onChanged: (value){
                      setState(() {
                        description=value;
                      });
                    },
                  ),
                ),
                SizedBox(height: SizedBoxheight,),
                ElevatedButton.icon(onPressed: (){
                  Note.insertdb({
                    'description': description,
                    'title': title,
                    'date':dateTime,
                    'done':"not done ",



                  }).then((value) {
                    print ("value: $value");
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
                      return HomeScreen();
                    }));
                  });

                },
                    style: ElevatedButton.styleFrom(primary: primarydarkcolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                      ),
                    
                    ),
                    icon: Icon(Icons.add,color: textcolor,size: 18,),
                    label: Text("Add",style: TextStyle(color: textcolor),)
                )
              ],

            ),
          ),
        ),
      ),
    );
  }
}
