import 'package:firstapplication/Cart.dart';
import 'package:firstapplication/Products.dart';
import 'package:firstapplication/Shared.dart';
import 'package:firstapplication/splash.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


void main(){
  WidgetsFlutterBinding.ensureInitialized();
  Shared.init();//هنا بستدعي الداتا بتاعي الاول اللي متخزنه في الكلاس دا قبل ما اعمل رن لل ابليكيشن بتاعي  
  runApp( const Myapp());//built in function to run app
}
class Myapp extends StatelessWidget{
  const Myapp({super.key});
//StatelessWidget is abstract class

  @override
  Widget build(BuildContext context) {
    //widget is the return type for the function
    return ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return  const MaterialApp(
             debugShowCheckedModeBanner: false,

          home:Splash(),
          //home: Products(),
          //home:Cart(),
        //  onGenerateRoute: onGenerateRoute,
        // initialRoute: AppRoutes.home,
          );
        }

    );
  }

}

