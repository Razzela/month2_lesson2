import 'package:flutter/material.dart';
import 'constants.dart';

class ProductApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 217, 205, 221),
        appBar: AppBar(
          title: Text('Товары'),
          backgroundColor: const Color.fromARGB(255, 177, 138, 204),
        ),
        body: Padding(
          padding: EdgeInsetsGeometry.all(cardRadius),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ProductCard(
                      image: 'images/bots.jpg',
                      title: 'Nike Air Max',
                      price: '\$120',
                      category: 'Shoes',
                      rating: 4,
                      sale: true,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ProductCard(
                      image: 'images/backpack.webp',
                      title: 'Backpack',
                      price: '\$60',
                      category: 'Bags',
                      rating: 3,
                      sale: true,
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
}

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String category;
  final int rating;
  final bool sale;

  ProductCard({
    required this.image,
    required this.title,
    required this.price,
    required this.category,
    required this.rating,
    this.sale = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(paddingSize),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(cardRadius),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(12),
                child: Image.asset(
                  image,
                  height: imageHeight,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: imageHeight,
                    color: Colors.red,
                    child: Center(child: Text('Нет картинки')),
                  ),
                ),
              ),
              if (sale)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Sale',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 10),

          Row(
            children: [
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.visible,
                  softWrap: true,
                ),
              ),
              Spacer(),
              Text(
                price,
                style: TextStyle(
                  fontSize: 16,
                  color: priceColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          // категория товаров
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              category,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 5; i++)
                Icon(
                  i < rating ? Icons.star : Icons.star_border,
                  size: 16,
                  color: Colors.amber,
                ),
            ],
          ),
          SizedBox(height: 8),
          ElevatedButton(onPressed: () {}, child: Text('Купить')),
          SizedBox( height: 8,),
          SizedBox(
  width: double.infinity,
  child: OutlinedButton(
    onPressed: () {},
    child: Text('В избранное'),
  ),
),
        ],
      ),
    );
  }
}
