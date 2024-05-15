import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:saver/pages/constants.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _page = 0;
  int _activeIndex = 2;
  //Bottom Navigation Icons
  final iconList = <Widget>[
    Icon(Symbols.dashboard,
    size: 28),
    Icon(Symbols.account_balance_wallet,
    size: 28),
    Icon(Symbols.add_circle,
    size: 28),
    Icon(Symbols.notifications,
    size: 28),
    Icon(Symbols.account_circle,
    size: 28),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      //AppBar
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: (){
              //navigation here
            }, 
            icon: const Icon(
              Icons.settings,
              color: mainTextColor,
              ))
        ],
      ),
      body: Container(
        color: bgColor,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            //Current Funds and Graph
            Container(
              height: 162,
              width: 328,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Current Funds Widget
                  Container(
                    height: 92,
                    width: 328,
                    padding: const EdgeInsets.all(12),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF96E6A1), Color(0xFF204A41)] 
                        ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                           blurRadius: 1.0,
                           spreadRadius: 1.0,
                           offset: Offset(0.0, 1.0),
                           ),
                      ],
                    ),
                    //Current Funds Widget Content
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Current Funds",
                        style: Theme.of(context).textTheme.bodyMedium),
                        Container(
                          height: 41,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("PHP",
                              style: Theme.of(context).textTheme.displayMedium),
                              //Padding
                              SizedBox(width: 8),
                              //Current Funds Number Here
                              Text("1,000",
                              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                color: Colors.white,
                              ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  //Padding
                  SizedBox(height: 12),
                  //Graph for Current Funds
                  Container(
                    height: 58,
                    width: 328,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Text(
                      "Graph Here."
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            //Remaining Monthly Budget Widget
            Container(
              height: 92,
              width: 328,
              padding: const EdgeInsets.all(12),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF96E6A1), Color(0xFF204A41)] 
                  ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                      blurRadius: 1.0,
                      spreadRadius: 1.0,
                      offset: Offset(0.0, 1.0),
                      ),
                ],
              ),
              //Remaining Monthly Budget Widget Content
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Remaining Monthly Budget",
                  style: Theme.of(context).textTheme.bodyMedium),
                  Container(
                    height: 41,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("PHP",
                        style: Theme.of(context).textTheme.displayMedium),
                        //Padding
                        SizedBox(width: 8),
                        //Current Funds Number Here
                        Text("500",
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          color: Colors.white,
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            //Padding
            SizedBox(height: 12),
            //Recent Transactions
            Container(
              height: 58,
              width: 328,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Text(
                "Recent Transactions Here."
              ),
            ),
          ],
        ),
      ),
      //Bottom Navigation
      bottomNavigationBar: CurvedNavigationBar(
        height: 75,
        animationCurve: Curves.linearToEaseOut,
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: Colors.transparent,
        index: _activeIndex,
        items: iconList,
        //Navigation of Pages
        onTap: (index) {
          setState((){
            _page = index;
          });
        },
      ),
    );
  }
}