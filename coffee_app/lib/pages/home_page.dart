import 'package:coffee_app/pages/coffee_type.dart';
import 'package:coffee_app/util/coffee_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List coffeeType = [
    [
      'Cappuccino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Black',
      false,
    ],
  ];

  void coffeeTypeSelected(int index) {
    setState((
        ) {
      for(int i=0; i<coffeeType.length; i++){
        coffeeType[i][1]=false;
      }
      coffeeType[index][1] = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: Icon((Icons.person)),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              ('Find the best coffee for you'),
              style: GoogleFonts.bebasNeue(
                fontSize: 56,
              ),
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Find your coffee..',
                focusedBorder: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
              height: 20,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
    itemCount: coffeeType.length,
                itemBuilder: (context, index) {
                  return CoffeeType(coffeeType: coffeeType[index][0], isSelected: coffeeType[index][1], onTap: (){coffeeTypeSelected(index);},);
                })
              ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeTitle(
                  coffeeImagePath: 'lib/images/coffee.jpg',
                  coffeeName: 'Latte',
                  coffeePrice: '4.99',
                ),
                CoffeTitle(
                  coffeeImagePath: 'lib/images/coffee2.jpg',
                  coffeeName: 'Cappucino',
                  coffeePrice: '7.99',
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }
}
