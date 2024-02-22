import 'package:flutter/material.dart';

class PersonalFirst extends StatefulWidget {
  @override
  _PersonalFirstState createState() => _PersonalFirstState();
}

class _PersonalFirstState extends State<PersonalFirst> {
  List<Map<String, dynamic>> cards = [
    {"title": "Peanut", "img": "assets/peanut1.png", "selected": false},
    {"title": "Gluten", "img": "assets/gluten.png", "selected": false},
    {"title": "Shellfish", "img": "assets/shellfish.png", "selected": false},
    {"title": "Milk", "img": "assets/milk1.png", "selected": false},
    {"title": "Egg", "img": "assets/egg2.png", "selected": false},
    {
      "title": "Personal Tree Nut",
      "img": "assets/nuts1.png",
      "selected": false
    },
    {"title": "Soy", "img": "assets/soy1.png", "selected": false},
    {"title": "Fish", "img": "assets/fish1.png", "selected": false},
    {"title": "Wheat", "img": "assets/wheat.png", "selected": false},
  ];

  List<Color> colors = [
    Color(0xFFAEC6CF),
    Color(0xFF98FB98),
    Color(0xFFE6E6FA),
    Color(0xFFFFDAB9),
    Color(0xFF87CEEB),
    Color(0xFFFFFF99),
    Color(0xFFF7CAC9),
    Color(0xFFBCE27F),
    Color(0xFF0e6994),
  ];

  void handlePress(int i) {
    setState(() {
      cards[i]['selected'] = !cards[i]['selected'];
    });

    List<Map<String, dynamic>> selectedCards =
        cards.where((card) => card['selected']).toList();

    // Update user allergies
    // setUser(allergies: selectedCards.map((card) => card['title']).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'What allergies you have ?',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 25,
            ),
          ),
          Text(
            'Select all that apply',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              children: List.generate(cards.length, (index) {
                return GestureDetector(
                  onTap: () => handlePress(index),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.23,
                    height: 100,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: cards[index]['selected']
                          ? colors[index]
                          : Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.35),
                          offset: Offset(5, 5),
                          blurRadius: 3.84,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          cards[index]['img'],
                          height: 70,
                          width: 70,
                        ),
                        Text(
                          cards[index]['title'],
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
