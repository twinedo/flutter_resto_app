import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app_sub1/models/resto_model.dart';
import 'package:restaurant_app_sub1/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  final RestoModel resto;
  const DetailScreen({required this.resto});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    Widget header() {
      return Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(color: primaryColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: backgroundColor,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.chevron_left,
                  color: greyColor,
                ),
              ),
            ),
            CircleAvatar(
              backgroundColor: backgroundColor,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_outline,
                  color: isFavorite ? Colors.red.shade400 : greyColor,
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget body() {
      return Expanded(
        child: SingleChildScrollView(
          child: Container(
            color: backgroundColor,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 100,
                      decoration: BoxDecoration(color: primaryColor),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 100,
                          margin: const EdgeInsets.only(top: 80),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            color: backgroundColor,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          width: screenWidth,
                          color: backgroundColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                  child: Text(
                                    widget.resto.name.toString(),
                                    style: titleStyle.copyWith(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: IntrinsicHeight(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.pin_drop,
                                              color: Colors.green,
                                            ),
                                            Text(
                                              widget.resto.city.toString(),
                                              style: titleStyle.copyWith(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      VerticalDivider(
                                        width: 10,
                                        color: Colors.grey,
                                        thickness: 1,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: primaryColor,
                                            ),
                                            Text(
                                              widget.resto.rating.toString(),
                                              style: titleStyle.copyWith(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                'Description',
                                textAlign: TextAlign.start,
                                style: titleStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  widget.resto.description.toString(),
                                  textAlign: TextAlign.justify,
                                  style: titleStyle,
                                ),
                              ),
                              Text(
                                'Foods',
                                textAlign: TextAlign.start,
                                style: titleStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  widget.resto.menus!.foods!
                                      .map((e) => e.name)
                                      .toString(),
                                  style: titleStyle,
                                ),
                              ),
                              Text(
                                'Drinks',
                                textAlign: TextAlign.start,
                                style: titleStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  widget.resto.menus!.drinks!
                                      .map((e) => e.name)
                                      .toString(),
                                  style: titleStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Card(
                        elevation: 20.0,
                        color: Colors.white.withOpacity(0),
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25.0),
                            child: Hero(
                              tag: widget.resto.id.toString(),
                              child: Image.network(
                                widget.resto.pictureId.toString(),
                                width: screenWidth * 0.7,
                                fit: BoxFit.cover,
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                                  return Container(
                                    color: primaryColor,
                                    alignment: Alignment.center,
                                    child: Image.asset('/assets/icon_app.png'),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: InkWell(
                onTap: () {
                  launch("tel://+62812345678");
                },
                child: Text(
                  'Book',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: primaryColor),
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Column(
            children: [header(), body(), footer()],
          ),
        ),
      ),
    );
  }
}
