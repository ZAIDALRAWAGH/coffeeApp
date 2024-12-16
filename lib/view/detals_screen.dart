import 'package:coffee/Model/coffee_model.dart';
import 'package:coffee/Widget/common_button.dart';
import 'package:coffee/colors.dart';
import 'package:coffee/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../provider/favorite_provider.dart';

class DetailsScreen extends StatefulWidget {
  final Coffee coffee;
  const DetailsScreen({
    super.key,
    required this.coffee,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

String selectedIndex = "M";

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = FavoriteProvider.of(context);
    final cartProvider = CartProvider.of(context);
    return Scaffold(
      backgroundColor: xBackgroundColor,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        children: [
          const SizedBox(height: 65),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new)),
              const Text(
                "Detail",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {
                  favoriteProvider.toggleFavorite(widget.coffee);
                },
                icon: Icon(
                  favoriteProvider.isExist(widget.coffee)
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  size: 22,
                ),
              )
            ],
          ),
          const SizedBox(height: 25),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Hero(
              tag: widget.coffee.image,
              child: Image.asset(
                widget.coffee.image,
                width: double.infinity,
                height: 270,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.coffee.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.coffee.type,
                        style: TextStyle(
                          fontSize: 12,
                          color: xSecondaryColor,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Image.asset(
                            "images/ic_star_filled.png",
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "${widget.coffee.rate}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                          Text(
                            "(${widget.coffee.review})",
                            style: TextStyle(
                              fontSize: 12,
                              color: xSecondaryColor,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      "images/bike.png",
                      "images/bean.png",
                      "images/milk.png",
                    ].map(
                      (e) {
                        return Container(
                          margin: const EdgeInsets.only(left: 12),
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.black12.withOpacity(0.02),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.center,
                          child: Image.asset(
                            e,
                            height: 25,
                            width: 25,
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const Divider(
                indent: 15,
                endIndent: 15,
                color: Colors.black12,
              )
            ],
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Description",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
              const SizedBox(height: 10),
              ReadMoreText(
                widget.coffee.description,
                trimLength: 125,
                trimMode: TrimMode.Length,
                trimCollapsedText: " Read More",
                trimExpandedText: " Read Less",
                style: TextStyle(
                  fontSize: 15,
                  color: xSecondaryColor,
                ),
                moreStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: xPrimaryColor,
                ),
                lessStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: xPrimaryColor,
                ),
              ),
              const SizedBox(height: 30),
              Column(
                children: [
                  const Text(
                    "Size",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: ["S", "", "M", "", "L"].map(
                      (e) {
                        if (e == "") return const SizedBox(width: 20);
                        bool isSelected = selectedIndex == e;
                        return Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = e;
                              });
                            },
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? xPrimaryColor.withOpacity(0.1)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: isSelected
                                        ? xPrimaryColor
                                        : Colors.black),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                e,
                                style: TextStyle(
                                    color: isSelected
                                        ? xPrimaryColor
                                        : Colors.black),
                              ),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  )
                ],
              ),
              const SizedBox(height: 25),
            ],
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        child: Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Price",
                  style: TextStyle(
                    color: xSecondaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                Text(
                  "\$${widget.coffee.price}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: xPrimaryColor),
                )
              ],
            )),
            SizedBox(
              width: 240,
              child: CommonButton(
                title: "Add to Cart",
                onTap: () {
                  cartProvider.toggleFavorite(widget.coffee);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      "Successful added! ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    duration: Duration(seconds: 1),
                  ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
