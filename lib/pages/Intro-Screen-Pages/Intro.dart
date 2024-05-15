import 'package:flutter/material.dart';
class intro1 extends StatefulWidget {
  const intro1({Key? key})
  : super(
    key: key,
  );
  @override
  State<intro1> createState() => _intro1State();
}

class _intro1State extends State<intro1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(228, 241, 238, 1),
      body: Container(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            Container(
              child: Text('Welcome to Pocketsaver!',style: TextStyle(fontFamily: 'Poppins'),),
            ),
            SizedBox(height: 22,),
            Container(
              child: Image(
                image: AssetImage('assets/images/Saver.png')
              ),
            ),
            SizedBox(height: 24,),
            Container(
       
              child: Text('Track your expenses effortlessly with PocketSaver, your user-friendly budget companion',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              ),
            ),
            //Buttons
            SizedBox(height: 22,),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Wrap(
                spacing: 40,
                children: <Widget>[     
                  Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(84, 156, 141, 1),
                      shape: BoxShape.circle
                    )
                  ),
                    Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(212, 232, 228, 1),
                      shape: BoxShape.circle
                    )
                  ),
                    Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(212, 232, 228, 1),
                      shape: BoxShape.circle
                    )
                  ),
                ],
              ),
            ),
            //Buttons
            
            Container(
              width: 328,
              height: 47,
              decoration: BoxDecoration(
                color: Color.fromRGBO(139, 193, 182, 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(  'Next',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),)
             ),
              Container(
              width: 328,
              height: 47,
              decoration: BoxDecoration(
                color: Color.fromRGBO(212, 232, 228, 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(  'Skip',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),)
             ),
          ],
        ),
      ),
    );
  }
}