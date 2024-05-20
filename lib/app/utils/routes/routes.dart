
import 'package:flutter/material.dart';
import 'package:royal_falcon_limousine/app/utils/routes/routes_names.dart';

import '../../UI/login.dart';



class Routes
{
  static Route<dynamic> generateRoute(RouteSettings settings)
  {
    switch(settings.name){
      case RoutesNames.login:
        return MaterialPageRoute(builder: (BuildContext context)=> Login());
      default:
        return MaterialPageRoute(builder: (_)
            {
              return Scaffold(
                body: Center(
                  child: Text("No routes Available", style: TextStyle(color: Colors.black,fontSize: 20),),
                ),
              );
            }
        );
    }
  }
}