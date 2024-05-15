import 'package:flutter/material.dart';
import 'package:saver/pages/Intro-Screen-Pages/content-model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saver/pages/Login-Form-Pages/Login_Intro.dart';

class intro1 extends StatefulWidget {
  const intro1({super.key});

  @override
  State<intro1> createState() => _intro1State();
}

class _intro1State extends State<intro1> {
  int currentIndex = 0;
  final Text_style = TextStyle(fontSize: 32,fontWeight: FontWeight.w700);
  final Text_style_bold = TextStyle(fontWeight: FontWeight.bold);
  PageController _controller = PageController(initialPage: 0);

  @override
  void initState() {
    _controller;
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(228, 241, 238, 1),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              clipBehavior: Clip.antiAlias,
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index){
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_,i){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(contents[i].title,  
                      style: GoogleFonts.poppins(textStyle: Text_style),
                      textAlign: TextAlign.center,
                      ),
                       SizedBox(height: 24,),
                      Container(
                      child: Image(
                        image: AssetImage(contents[i].images)
                        ),
                      ),
                       SizedBox(height: 24,),
                      Text(contents[i].description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,  
                      style: GoogleFonts.poppins(),
                      ),
                        SizedBox(height: 24,),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(contents.length, (index) => 
              buildDot(index, context),
              ),
            ),
          ),
                  SizedBox(height: 24,),
          Container(    
            width: 328, 
            padding: const EdgeInsets.all(10),     
             decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: Color.fromRGBO(139, 193, 182, 1),
            ),
            child: Center(
              child: GestureDetector( 
                 child: Text(currentIndex == contents.length -1 ? 'Continue' : "Next",           
                  textAlign: TextAlign.center,
                  style:  GoogleFonts.poppins(textStyle: Text_style_bold,color: Colors.white),
                  
              ),
                onTap: () {
                if(currentIndex == contents.length -1){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> LoginIntro(),
                  ));
                }
                  _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeOut);      
              },          
              ),
            ),
           
            
            
          ),
          SizedBox(height: 20,),
           Container(
            width: 328,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
               borderRadius: BorderRadius.all(Radius.circular(8.0)),
               color: Color.fromRGBO(212, 232, 228, 1),
            ),
            child: GestureDetector(  
            child: Center(
              child: Text('Skip',
              textAlign: TextAlign.center,
               style:  GoogleFonts.poppins(textStyle: Text_style_bold),
              ),
            )
            ) 
          ),
           SizedBox(height: 20,),
        ],
      ),
    );
  }

  Container buildDot(int index,BuildContext context) {
    return Container(
              height: 10,
              width: 10,
              margin: EdgeInsets.only(right:28),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), 
                color: currentIndex == index ? Color.fromRGBO(84, 156, 141, 1) : Color.fromRGBO(212, 232, 228, 1),
             )
    );
  }
}