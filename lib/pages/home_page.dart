import 'package:flutter/material.dart';
import 'package:restaurant_app_sub1/models/restaurants_model.dart';
import 'package:restaurant_app_sub1/models/resto_model.dart';
import 'package:restaurant_app_sub1/pages/detail_screen.dart';
import 'package:restaurant_app_sub1/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget bottomNavBar() {
      return BottomNavigationBar(
        elevation: 20,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icon_home.png',
              width: 24,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icon_notification.png',
              width: 24,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icon_love.png',
              width: 24,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icon_user.png',
              width: 24,
            ),
            label: '',
          ),
        ],
      );
    }

    Widget header() {
      return Container(
        padding: const EdgeInsets.only(top: 20),
        margin: const EdgeInsets.only(bottom: 10),
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
                      'CaResto',
                      style: titleStyle.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                    ),
                  ],
                ),
                Icon(
                  Icons.settings,
                  color: greyColor,
                )
              ],
            ),
            Container(
              child: Text(
                'Rekomendasi Resto',
                style: titleStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );
    }

    Widget city() {
      var screenHeight = MediaQuery.of(context).size.height;
      return Container(
        height: screenHeight - 170,
        child: SingleChildScrollView(
          child: FutureBuilder<String>(
              future: DefaultAssetBundle.of(context)
                  .loadString('assets/local_restaurant.json'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  final Restaurants restaurants =
                      restaurantFromJson(snapshot.data!);
                  // final List<RestoModel> resto = parseResto(snapshot.data);
                  print(restaurants.restaurants);

                  return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: restaurants.restaurants.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return _buildRestoItem(
                            context, restaurants.restaurants[index]);
                      });
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ),
      );
    }

    Widget body() {
      return Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: [header(), city()],
        ),
      );
    }

    return Scaffold(
      bottomNavigationBar: bottomNavBar(),
      body: body(),
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _buildRestoItem(BuildContext context, RestoModel resto) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailScreen(resto: resto);
        }));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(resto.pictureId.toString(),
                  color: Colors.black.withOpacity(0.7),
                  colorBlendMode: BlendMode.srcATop),
            ),
            Text(
              resto.name.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
