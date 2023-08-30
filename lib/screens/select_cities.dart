import 'package:flutter/material.dart';

import 'Details_Page.dart';

class SelectCities extends StatefulWidget {
  final String profession;
  const SelectCities({required this.profession});

  @override
  State<SelectCities> createState() => _SelectCitiesState();
}

class GridItem {
  final String title;
  final String imagePath;

  GridItem(this.title, this.imagePath);
}

class _SelectCitiesState extends State<SelectCities> {
  final List<GridItem> items = [
    GridItem('Delhi NCR', 'images/india_gate.png'),
    GridItem('Mumbai', 'images/mumbai.png'),
    GridItem('Banglore', 'images/bangalore.png'),
    GridItem('Banaras', 'images/banaras.png'),
    GridItem('Hyderabad', 'images/hyderabad.png'),
    GridItem('Lucknow', 'images/lucknow.png'),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .12,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, bottom: 30),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Choose your location',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xFF34B89B),
                    fontSize: 30,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 1.63,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, bottom: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width * .65,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFC4C4C4),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: .075 * MediaQuery.of(context).size.height,
            ),
            SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: ShapeDecoration(
                  color: Color(0xFF34B89B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                ),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GridTile(
                      child: Padding(
                        padding: const EdgeInsets.all(35),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Detailspage(city: '${items[index].title}',profession: widget.profession,),),
                            );

                          },

                          child: Container(
                            width: .35*MediaQuery.of(context).size.width,
                            height: .15*MediaQuery.of(context).size.height,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                ),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  items[index].imagePath,
                                  width: .2*MediaQuery.of(context).size.width,
                                  height: .1*MediaQuery.of(context).size.height,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  items[index].title,
                                  style: TextStyle(color: Color(0xFFA17F2F),fontSize: 15,),

                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

            ),

          ],
        ),
      ),
    );
  }
}
