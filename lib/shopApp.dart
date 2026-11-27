import 'package:flutter/material.dart';

class ShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CatalogListPage(),
    );
  }
}

class CatalogListPage extends StatelessWidget {
  final List<Map<String, String>> products = List.generate(
    20,
    (i) => {
      'title': 'Товар ${i + 1}',
      'desc': 'Описание товара ${i + 1}',
      'image': 'https://picsum.photos/seed/item$i/200/140',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список товаров'),
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final item = products[index];
          return Card(
            child: ListTile(
              leading: Image.network(
                item['image']!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              title: Text(item['title']!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailPage(
                      title: item['title']!,
                      desc: item['desc']!,
                      imageUrl: item['image']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final String title;
  final String desc;
  final String imageUrl;

  ProductDetailPage({
    required this.title,
    required this.desc,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: Colors.amber),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imageUrl, height: 200, fit: BoxFit.cover),
            SizedBox(height: 12),
            Text(desc),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => OrderPage(productTitle: title),
                    ),
                  );
                },
                child: Text('Купить'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderPage extends StatelessWidget {
  final String productTitle;

  OrderPage({required this.productTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Заказ и оплата'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ваш заказ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 8),

            Text(productTitle),

            SizedBox(height: 24),

            Text(
              'Способ оплаты',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 16),

            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('Банковская карта'),
            ),

            ListTile(
              leading: Icon(Icons.account_balance_wallet_outlined),
              title: Text('Электронный кошелек'),
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          OrderConfirmationPage(productTitle: productTitle),
                    ),
                  );
                },
                child: Text('Оплатить'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderConfirmationPage extends StatelessWidget {
  final String productTitle;

  OrderConfirmationPage({required this.productTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Подтверждение заказа'),
        backgroundColor: Colors.amber,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 100),
            SizedBox(height: 16),
            Text(
              'Заказ успешно оформлен',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(productTitle, style: TextStyle(fontSize: 18)),
            SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Text('Вернуться в каталог'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
