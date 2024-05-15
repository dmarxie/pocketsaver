import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class LoginIntro extends StatefulWidget {
  const LoginIntro({super.key});

  @override
  State<LoginIntro> createState() => _LoginIntroState();
}

class _LoginIntroState extends State<LoginIntro> {
  final Text_style_bold = TextStyle(fontWeight: FontWeight.bold);
  final Text_style = TextStyle(fontSize: 32,fontWeight: FontWeight.w700);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromRGBO(228, 241, 238, 1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
          Flexible(
            flex: 3,
            child: Center(
              child: Text('Welcome to PocketSaver!',
                style: GoogleFonts.poppins(textStyle: Text_style),
                textAlign: TextAlign.center,
              ),
            )
          ),
          Flexible(
            flex: 6,
            child: Center(
              child: Image(
                image: AssetImage('assets/images/Saver.png'),
               
                ),
            ),  
          ),
          Flexible(
            flex: 2,
          
              child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                      filled: true,
                      fillColor: Colors.white,
                    border: const OutlineInputBorder()
                  ),
               ),
            ), 
             SizedBox(height: 24,),
            Flexible(
            flex: 2,

              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      filled: true,
                      fillColor: Colors.white,
                       border: const OutlineInputBorder(
                      
                       )
                    ),
                  ),
                   SizedBox(height: 1,),
                  
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                              'Forgot Your Password?',
                    textAlign: TextAlign.start,
                        )
                      ],
                    )
               
                  )
                ],
              ),
            ), 
             SizedBox(height: 20,),
            Flexible(
              flex: 1,
              child: Container(
              width: 308,
              height: 47,
                 padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              decoration: BoxDecoration(
                 borderRadius: BorderRadius.all(Radius.circular(8.0)),
                 color: Color.fromRGBO(212, 232, 228, 1),
              ),
              child: GestureDetector(  
              child: Center(
                child: Text('Login',
                textAlign: TextAlign.center,
                 style:  GoogleFonts.poppins(textStyle: Text_style_bold),
                ),
              )
              ) 
              ),
            ),
             SizedBox(height: 24,),
             Flexible(
              flex: -1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                    child: Container(
                      width: 37,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter
                          )
                        )
                      ),
                    ),
                  ),
                  
                  Text(
                    "Don't have an account?",
                    textAlign: TextAlign.center,
                    
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(
                      width: 37,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter
                          )
                        )
                      ),
                    ),
                  ),
                ],
              )
            ), 
            SizedBox(height: 22,),
            Flexible(
              flex: 1,
              child: Container(
              width: 308,
              height: 47,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                 borderRadius: BorderRadius.all(Radius.circular(8.0)),
                 color: Color.fromRGBO(212, 232, 228, 1),
              ),
              child: GestureDetector(  
              child: Center(
                child: Text('Sign up',
                textAlign: TextAlign.center,
                 style:  GoogleFonts.poppins(textStyle: Text_style_bold),
                ),
              )
              ) 
              ),
            ),   
          ],
        ),
      ) ,
    );
  }
}