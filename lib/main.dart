
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    HomeTab(),
    CategoryTab(),
    SearchTab(),
    AccountTab(userName: "gauravmasand", phoneNumber: "+91 7507807839"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class HomeTab extends StatelessWidget {

  late double width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hydrabad < Telengana | 500001', style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),),
            Text("coplete addres of home | office", style: TextStyle(
                color: Colors.black,
                fontSize: 11,
                fontWeight: FontWeight.w400
            ),)
          ],
        ),
        
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/offer1.jpeg',
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width-32,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/offer2.jpeg',
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width - 32, // Set the height to match the container height
                      ),
                    ),
                    // Add more images as needed
                  ],
                ),
              ),
            ),


            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Shop By Categories",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  ListView(
                    primary: false,
                    shrinkWrap: true,
                    children: [
                      Row(
                        children: [
                          _buildCategoryItem("WOW Weekends", '1'),
                          _buildCategoryItem("Chicken", '2'),
                          _buildCategoryItem("Fish & Seafood", '3'),
                          _buildCategoryItem("Mutton", '4'),
                        ],
                      ), Row(
                        children: [
                          _buildCategoryItem("Ready to Cook", '5'),
                          _buildCategoryItem("Prawns", '6'),
                          _buildCategoryItem("Eggs", '7'),
                          _buildCategoryItem("Cold Cuts", '8'),
                        ],
                      ), Row(
                        children: [
                          _buildCategoryItem("Kebab & Biryani", '9'),
                          _buildCategoryItem("Spreads", '10'),
                          _buildCategoryItem("Combos", '11'),
                          _buildCategoryItem("Meat Masala", '12'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildOfferItem("Bank Offer 1", "Offer 1"),
                    _buildOfferItem("Bank Offer 2", "Offer 2"),
                    _buildOfferItem("Bank Offer 3", "Offer 3"),
                    _buildOfferItem("Bank Offer 4", "Offer 4"),
                  ],
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.all(16),
              child: ListView(
                primary: false,
                shrinkWrap: true,
                children: [
                  Text(
                    "Shop By Categories",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Most Popular Products Near you",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey
                    ),
                  ),
                  SizedBox(height: 8,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildBestSellerItem("Chicken Curry Cut - Small Pieces (Large Pack)", '2.png'),
                        _buildBestSellerItem("Farm Fresh Classic Eggs - Pack of 12", 'bs2.png'),
                        _buildBestSellerItem("Afghani Murgh Seekh Kebab", 'bs3.png'),
                        _buildBestSellerItem("Rohu (Seelavathi) Medium - Bengali Cut, No Head", 'bs4.png'),

                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Bestsellers
            _buildHorizontalList('Bestsellers', [
              'Bestseller 1',
              'Bestseller 2',
              'Bestseller 3',
              'Bestseller 4',
              'Bestseller 5',
            ]),

            // Combo for You
            _buildHorizontalList('Combo for You', [
              'Combo 1',
              'Combo 2',
              'Combo 3',
              'Combo 4',
              'Combo 5',
            ]),
          ],
        ),
      ),
    );
  }
  Widget _buildBannerItem(BuildContext context, String imagePath) {
    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = screenWidth - 32;

    return Container(
      width: itemWidth,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/${imagePath}"),
          fit: BoxFit.cover,
        ),
      ),
      // You can add additional widgets or content on top of the image if needed
      // For example, you can add a text overlay or additional widgets.
    );
  }




  Widget _buildBestSellerItem(String title, String imageName) {
    return Container(
      width: 250,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image at the top
          Image.asset(
            'assets/images/${imageName}',
            height: 120,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 12),
          // Title
          Text(
            title,
            maxLines: 2,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          // Points (Weight, Pieces, Serves, etc.)
          Text(
            'Weight: 500g | Pieces: 8 | Serves: 1',
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 8), // Added spacing between points and price details
          // Price details
          Row(
            children: [
              Text(
                '\₹18',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 8), // Added spacing between price and discount
              Text(
                '\₹20',
                style: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey
                ),
              ),
              Text(
                ' (-10%)',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildOfferItem(String title, String offer) {
    return Container(
      width: 300, // Long as the width of the screen
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Opacity(
              opacity: 0.25,
              child: Image.asset(
                'assets/images/offer_graphic.jpg', // Add your graphic image path
                height: 70,
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8),
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  offer,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String name, String imageName) {
    return Container(
      width: width*0.183,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/$imageName.png',
            height: 75,
            width: 100,
          ),
          SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalList(String title, List<String> items) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Container(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return _buildListItem(items[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(String item) {
    return Container(
      width: 100,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(item),
      ),
    );
  }
}

class Category {
  final String title;
  final String subtitle;
  final String imagePath;

  Category({required this.title, required this.subtitle, required this.imagePath});
}

class CategoryTab extends StatelessWidget {

  final List<Category> categories = [
    Category(
      title: 'WOW Weekends',
      subtitle: 'Category Description',
      imagePath: 'assets/images/1.png',
    ),
    Category(
      title: 'Chicken',
      subtitle: 'Category Description',
      imagePath: 'assets/images/2.png',
    ),
    Category(
      title: 'Fish & Seafood',
      subtitle: 'Category Description',
      imagePath: 'assets/images/3.png',
    ),
    Category(
      title: 'Mutton',
      subtitle: 'Category Description',
      imagePath: 'assets/images/4.png',
    ),
    Category(
      title: 'Ready to Cook',
      subtitle: 'Category Description',
      imagePath: 'assets/images/5.png',
    ),
    Category(
      title: 'Prawns',
      subtitle: 'Category Description',
      imagePath: 'assets/images/6.png',
    ),
    Category(
      title: 'Eggs',
      subtitle: 'Category Description',
      imagePath: 'assets/images/7.png',
    ),
    Category(
      title: 'Cold Cuts',
      subtitle: 'Category Description',
      imagePath: 'assets/images/8.png',
    ),
    Category(
      title: 'Kebab & Biryani',
      subtitle: 'Category Description',
      imagePath: 'assets/images/9.png',
    ),
    Category(
      title: 'Spreads',
      subtitle: 'Category Description',
      imagePath: 'assets/images/10.png',
    ),
    Category(
      title: 'Fish & Combos',
      subtitle: 'Category Description',
      imagePath: 'assets/images/11.png',
    ),
    Category(
      title: 'Meat Masala',
      subtitle: 'Category Description',
      imagePath: 'assets/images/12.png',
    ),
    // Add more categories as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Categories', style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w600,
        ),),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return _buildCategoryItem(category);
        },
      ),
    );
  }

  Widget _buildCategoryItem(Category category) {
    return InkWell(
      onTap: () {
        // Handle category item tap here
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey[300]!,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              category.imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    category.subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

class SearchTab extends StatefulWidget {

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  late double width;

  final TextEditingController _searchController = TextEditingController();

  final FocusNode _searchFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    // Request focus on the search field when the SearchTab is opened
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_searchFocus);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Search here...'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search action here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _searchController,
              focusNode: _searchFocus,
              decoration: InputDecoration(
                hintText: 'Search for any product here',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                // Handle text input changes here
              },
            ),
            SizedBox(height: 20),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Shop By Categories",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  ListView(
                    primary: false,
                    shrinkWrap: true,
                    children: [
                      Row(
                        children: [
                          _buildCategoryItem("WOW Weekends", '1'),
                          _buildCategoryItem("Chicken", '2'),
                          _buildCategoryItem("Fish & Seafood", '3'),
                          _buildCategoryItem("Mutton", '4'),
                        ],
                      ), Row(
                        children: [
                          _buildCategoryItem("Ready to Cook", '5'),
                          _buildCategoryItem("Prawns", '6'),
                          _buildCategoryItem("Eggs", '7'),
                          _buildCategoryItem("Cold Cuts", '8'),
                        ],
                      ), Row(
                        children: [
                          _buildCategoryItem("Kebab & Biryani", '9'),
                          _buildCategoryItem("Spreads", '10'),
                          _buildCategoryItem("Combos", '11'),
                          _buildCategoryItem("Meat Masala", '12'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String name, String imageName) {
    return Container(
      width: width*0.183,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/$imageName.png',
            height: 75,
            width: 100,
          ),
          SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class AccountTab extends StatelessWidget {
  final String userName;
  final String phoneNumber;

  AccountTab({required this.userName, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(userName),
            Text(
              phoneNumber,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Options',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListView(
              primary: false,
              shrinkWrap: true,
              children: [
                _buildAccountOption(
                  icon: Icons.card_giftcard,
                  title: 'Rewards',
                ),
                _buildAccountOption(
                  icon: Icons.shopping_bag,
                  title: 'Orders',
                ),
                _buildAccountOption(
                  icon: Icons.location_on,
                  title: 'Address',
                ),
                _buildAccountOption(
                  icon: Icons.account_balance_wallet,
                  title: 'Our Wallet',
                ),
                _buildAccountOption(
                  icon: Icons.notifications,
                  title: 'Notifications',
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Our Zone',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListView(
              primary: false,
              shrinkWrap: true,
              children: [
                _buildAccountOption(
                  icon: Icons.contact_mail,
                  title: 'Contact Us',
                ),
                _buildAccountOption(
                  icon: Icons.description,
                  title: 'Terms and Conditions',
                ),
                _buildAccountOption(
                  icon: Icons.privacy_tip,
                  title: 'Privacy Policy',
                ),
                _buildAccountOption(
                  icon: Icons.help,
                  title: 'FAQs',
                ),
                _buildAccountOption(
                  icon: Icons.article,
                  title: 'Blogs',
                ),
                _buildAccountOption(
                  icon: Icons.restaurant_menu,
                  title: 'Recipes',
                ),
                _buildAccountOption(
                  icon: Icons.logout,
                  title: 'Logout',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountOption({required IconData icon, required String title}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16, // Adjust the size of the arrow icon here
        color: Colors.grey, // Adjust the color and opacity of the arrow icon here
      ),
      onTap: () {
        // Handle option click here
      },
    );
  }
}
