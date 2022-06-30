import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:note_app/Screen/DiscScreen.dart';
import 'package:note_app/Screen/ReviewScreen.dart';
import 'package:note_app/helper/HelperNote.dart';

import '../constants.dart';

class HomeScreen extends StatefulWidget {


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Note.db.then((value) {
      print("value: $value");
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("ToDo",
          style: TextStyle(
            color: textcolor,
            fontSize: fontLarge,
          ),
          ),
          centerTitle: true,
          backgroundColor: primarydarkcolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(RadiusCircular),
              bottomRight:Radius.circular(RadiusCircular),
            ),
          ),

        ),
        backgroundColor: primarycolor,

        body: FutureBuilder(
          future: Note.getData(),

          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData)
              {
                if(snapshot.data.length==0)
                  {
                    return Center(
                          child:  Text("Your ToDo list is empty! "),
                                                );
                  }
                else {
                return  ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: Colors.transparent,
                      child: ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                            return ReviewScreen(date:snapshot.data[index].date,title:snapshot.data[index].title,description: snapshot.data[index].description,done: snapshot.data[index].done,);
                          }));
                        },
                        title: Text("${snapshot.data[index].title}",
                        style: TextStyle(
                          color: textcolor,
                        ),
                        ),
                        subtitle: Text("${snapshot.data[index].date}",
                          style: TextStyle(
                            color: textcolor,
                          ),
                        ),
                        trailing: IconButton(onPressed: () { 
                          Note.deleteNote(snapshot.data[index].id).then((value) {
                            setState(() {
                              Text("");
                            });
                          });

                        },
                          icon: Icon(Icons.delete_outline,color: red,size: 25,),

                        ),
                      ),
                    );

                },);

                }
              }
            else {
              return Text("");
            }

        },),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context)=>DiscScreen()
            ));
          },
          backgroundColor: primarydarkcolor,
          child: const Icon(Icons.add, color: textcolor,),
        ),
      ),
    );
  }
}
