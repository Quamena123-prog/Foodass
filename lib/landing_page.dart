import 'package:flutter/material.dart';
import 'profile_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;
  bool _isDarkMode = false;
  bool _hasNotifications = true; // Example: assuming there are notifications

  static const List<Widget> _widgetOptions = <Widget>[
    SizedBox.shrink(), // Empty widget for Home Page
    Text('Order Page Placeholder'), // Placeholder for Order Page
    Text('Profile Page Placeholder'), // Placeholder for Profile Page
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  Widget buildFoodItem(String image, String title, String description,
      double rating, double price, List<String> reviews) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          description,
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[600]),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Row(
                              children: List.generate(
                                5,
                                (index) => Icon(
                                  index < rating
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: Colors.amber,
                                  size: 20,
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Text('$rating'),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          'GH₵$price',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                reviews.isNotEmpty ? 'Reviews' : 'No reviews yet',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              ...reviews.map((review) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      review,
                      style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                    ),
                  )),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text('Place Order',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _isDarkMode
          ? ThemeData.dark().copyWith(
              primaryColor: Colors.black,
              scaffoldBackgroundColor: Colors.black,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.black,
              ),
              switchTheme: SwitchThemeData(
                thumbColor: MaterialStateProperty.all(Colors.grey[700]),
                trackColor: MaterialStateProperty.all(Colors.grey[500]),
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(color: Colors.white),
                bodyText2: TextStyle(color: Colors.white70),
              ),
              iconTheme: IconThemeData(color: Colors.white),
            )
          : ThemeData.light().copyWith(
              primaryColor: Colors.white,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.transparent,
                iconTheme: IconThemeData(color: Colors.black),
              ),
              switchTheme: SwitchThemeData(
                thumbColor: MaterialStateProperty.all(Colors.grey[700]),
                trackColor: MaterialStateProperty.all(Colors.grey[500]),
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(color: Colors.black),
                bodyText2: TextStyle(color: Colors.black87),
              ),
              iconTheme: IconThemeData(color: Colors.black),
            ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            Stack(
              children: [
                IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {
                    // Handle notifications action
                  },
                ),
                if (_hasNotifications)
                  Positioned(
                    right: 11,
                    top: 11,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 12,
                        minHeight: 12,
                      ),
                      child: Text(
                        '',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Center(
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 48,
                  ),
                ),
              ),
              SwitchListTile(
                secondary: Icon(Icons.dark_mode),
                title: Text('Dark Mode'),
                value: _isDarkMode,
                onChanged: (bool value) {
                  _toggleDarkMode();
                },
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  _onItemTapped(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text('Order'),
                onTap: () {
                  _onItemTapped(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.feedback),
                title: Text('Feedback'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.star_rate),
                title: Text('Rate Us'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi Yves',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Hungry Now?',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.search, color: Colors.red),
                            SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search Food',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.withOpacity(0.2)),
                      ),
                      child: Icon(Icons.filter_list, color: Colors.red),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Text(
                  'Popular Items',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                buildFoodItem(
                  'assets/images/Delicious Pizza.jpg',
                  'Delicious Pizza',
                  'A delicious cheese pizza topped with fresh vegetables and meats.',
                  4.5,
                  12.99,
                  ['Great taste!', 'Loved it!'],
                ),
                buildFoodItem(
                  'assets/images/Tasty Burger.jpg',
                  'Tasty Burger',
                  'A juicy burger with a side of crispy fries.',
                  4.0,
                  10.99,
                  ['Very satisfying!', 'Could be better.'],
                ),
                buildFoodItem(
                  'assets/images/Pasta Delight.jpg',
                  'Pasta Delight',
                  'Creamy pasta with a blend of spices and herbs.',
                  4.8,
                  15.49,
                  ['Absolutely delightful!', 'Will order again!'],
                ),
                buildFoodItem(
                  'assets/images/Banku And Tilapia.jpg',
                  'Banku And Tilapia',
                  'Hot and spicy ramen with a rich broth.',
                  4.7,
                  9.99,
                  ['Perfectly spicy!', 'A bit too hot for me.'],
                ),
                buildFoodItem(
                  'assets/images/Jollof rice with chicken.jpg',
                  'Jollof rice with chicken',
                  'An assortment of fresh sushi rolls.',
                  4.9,
                  22.99,
                  ['Best sushi ever!', 'Very fresh and tasty.'],
                ),
                buildFoodItem(
                  'assets/images/Waakye.jpg',
                  'Waakye',
                  'Tender grilled salmon with a side of veggies.',
                  4.6,
                  18.49,
                  ['Cooked to perfection!', 'A bit pricey but worth it.'],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Order',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.red,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
