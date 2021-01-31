import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'model_class.dart';


class PlayerDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData.dark(),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin
 {
  List<Welcome> _list = [];
  var loading = false;
  Future<List<Welcome>> fetchData() async
  {

    setState(() {
      loading = true;
    });

    var url = "http://playonnuat-env.eba-ernpdw3w.ap-south-1.elasticbeanstalk.com/api/v1/establishment/test/list?offset=0&limit=10";
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          _list.add(Welcome.fromJson(i));
        }
        loading = false;
      });
    }

  }


  @override
  void initState() {
    fetchData();
  }

  Widget build(BuildContext context) {
    return new Scaffold(

      body:Container(
        child: Column(
          children: [

            Container(
              width: 600,
              height: 120,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(1000)
                    ),
                    color: Colors.grey[400].withOpacity(0.5),
                  ),
                  child: Column(

                    children: [
                      SizedBox(height: 30,),
                      Row(
                        children: [
                          SizedBox(height: 70,),
                          SizedBox(width: 70,),
                          Text("Player Details", style: TextStyle( fontSize: 34, color: Colors.white,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic ),)
                        ],
                      ),
                    ],
                  )
              ),
            ),

            Expanded(
              child: Container(
                child: loading?Center(child: CircularProgressIndicator()):
                ListView.builder(
                    itemCount: _list.length,
                    shrinkWrap: true,
                    itemBuilder: ( context, i){
                      final x = _list[i];
                      return
                        Container(
                            child:Container(
                              width: 400,
                              height: 400,
                              //color: Colors.grey[400].withOpacity(0.5),
                              child:
                              Card(elevation: 15,
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height: 20,),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(width: 10,),
                                        Text("Palyer Name :  ",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold )),

                                        Expanded(
                                          child:Text(
                                            x.name,textDirection: TextDirection.ltr,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 5,style: TextStyle(fontSize: 16,color: Colors.white),
                                          ), ),

                                      ],

                                    ),


                                    SizedBox(height: 5,),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(width: 10,),
                                        Text("Open Time :  ",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold )),

                                        Expanded(
                                          child:Text(
                                            x.openTime,textDirection: TextDirection.ltr,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 5,style: TextStyle(fontSize: 16,color: Colors.white ),
                                          ), ),

                                      ],

                                    ),

                                    SizedBox(height: 5,),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(width: 10,),
                                        Text("Close Time :  ",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold )),

                                        Expanded(
                                          child:Text(
                                            x.closeTime,textDirection: TextDirection.ltr,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 5,style: TextStyle(fontSize: 16,color: Colors.white),
                                          ), ),

                                      ],

                                    ),

                                    SizedBox(height: 5,),

                                    Row(
                                      children: <Widget>[
                                        SizedBox(width: 10,),
                                        Text("Created On :  ",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold )),

                                        Expanded(
                                          child:Text(
                                            x.createOn.toString(),textDirection: TextDirection.ltr,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 5,style: TextStyle(fontSize: 16,color: Colors.white,),
                                          ), ),

                                      ],

                                    ),


                                    SizedBox(height: 5,),

                                    Row(
                                      children: <Widget>[
                                        SizedBox(width: 10,),
                                        Text("Updated On :  ",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold )),

                                        Expanded(
                                          child:Text(
                                            x.updatedOn.toString(),textDirection: TextDirection.ltr,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 5,style: TextStyle(fontSize: 16,color: Colors.white),
                                          ), ),

                                      ],

                                    ),

                                    SizedBox(height: 5,),

                                    Row(
                                      children: <Widget>[
                                        SizedBox(width: 10,),
                                        Text("Slot Time:  ",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold )),

                                        Expanded(
                                          child:Text(
                                            x.slotTimeSize.toString(),textDirection: TextDirection.ltr,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 5,style: TextStyle(fontSize: 16,color: Colors.white ),
                                          ), ),

                                      ],

                                    ),

                                    SizedBox(width: 50,),
                                    Text("SPORTS :- ",style: TextStyle(fontSize:20,color: Colors.white,fontWeight: FontWeight.bold )),
                                    SizedBox(height: 10,),

                                    Row(
                                      children: <Widget>[
                                        SizedBox(width: 10,),
                                        Text("Name :  ",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold )),

                                        Expanded(
                                          child:Text(
                                            x.sports.name.toString(),textDirection: TextDirection.ltr,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 5,style: TextStyle(fontSize: 16,color: Colors.white),
                                          ), ),

                                      ],

                                    ),

                                    SizedBox(height: 5,),

                                    Row(
                                      children: <Widget>[
                                        SizedBox(width: 10,),
                                        Text("Created On :  ",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold )),

                                        Expanded(
                                          child:Text(
                                            x.sports.createOn.toString(),textDirection: TextDirection.ltr,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 5,style: TextStyle(fontSize: 16,color: Colors.white),
                                          ), ),

                                      ],

                                    ),

                                    SizedBox(height: 5,),

                                    Row(
                                      children: <Widget>[
                                        SizedBox(width: 10,),
                                        Text("Updated On :  ",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold )),

                                        Expanded(
                                          child:Text(
                                            x.sports.updatedOn.toString(),textDirection: TextDirection.ltr,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 5,style: TextStyle(fontSize: 16,color: Colors.white ),
                                          ), ),

                                      ],

                                    ),

                                    SizedBox(height: 20,),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(width: 20,),
                                        Image.network(x.sports.iconWhiteUrl,width: 100,height: 100,),
                                        SizedBox(width: 100,),
                                        Image.network(x.sports.iconBlackUrl,width: 100,height: 100,),
                                      ],

                                    ),

                                  ],
                                )

                                ,color: Colors.grey[400].withOpacity(0.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                shadowColor: Colors.black,

                              ),
                            )
                        );
                    }
                ),
              ),
            ),



          ],
        ),
      )







    );
  }
}

