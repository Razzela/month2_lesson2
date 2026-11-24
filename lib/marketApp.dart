import 'package:flutter/material.dart';

class MarketApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MarketPage());
  }
}

class MarketPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MarketPageState();
}

class MarketPageState extends State<MarketPage> {
  final Map<String, List<String>> productByCategory = {
    'Ноутбуки': ['Ноутбук Lenovo', 'Ноутбук Asus', 'Ноутбук HP'],
    'Смартфоны': ['iphone 18 Pro', 'Samsung Galaxy', 'Xiaomi Redmi'],
    'Аксессуары': ['Наушники', 'Клавиатура', 'Мышь'],
    'Мониторы': [
      'Монитор Xiaomi G27Q 27 Дюймов',
      'Монитор Samsung S40GD 24 Дюймов',
      'Монитор LG G4 26 Дюймов',
    ],
    'Принтеры': ['Принтер Canon', 'Принтер Epson', 'Принтер SuperColor'],
    'Игровые устройства': ['PlayStation 5', 'SteamDeck', 'Xbox'],
  };

  final Map<String, int> prices = {
    'Ноутбук Lenovo': 55000,
    'Ноутбук Asus': 62000,
    'Ноутбук HP': 48000,
    'iphone 18 Pro': 120000,
    'Samsung Galaxy': 85000,
    'Xiaomi Redmi': 18000,
    'Наушники': 3500,
    'Клавиатура': 2500,
    'Мышь': 1200,
    'Монитор Xiaomi G27Q 27 Дюймов': 25000,
    'Монитор Samsung S40GD 24 Дюймов': 21000,
    'Монитор LG G4 26 Дюймов': 23000,
    'Принтер Canon': 14000,
    'Принтер Epson': 16000,
    'Принтер SuperColor': 12000,
    'PlayStation 5': 52000,
    'SteamDeck': 48000,
    'Xbox': 45000,
  };

  Set<String> favorites = {};

  int currentIndex = 0;

  void toggleFavorite(String product) {
    setState(() {
      if (favorites.contains(product)) {
        favorites.remove(product);
      } else {
        favorites.add(product);
      }
    });
  }

  Widget buildProductList(List<String> products, IconData icon, Color color) {
    if (products.isEmpty) {
      return Center(child: Text('Список пуст'));
    }
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 8),
      itemCount: products.length,
      itemBuilder: (context, index) {
        String product = products[index];
        bool isFavorite = favorites.contains(product);
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: ListTile(
            leading: Icon(icon, color: color, size: 32),
            title: Text(product, style: TextStyle(fontSize: 16)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Товар есть в наличии'),
                Text(
                  'Цена: ${prices[product]} сом',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            trailing: IconButton(
              onPressed: () {
                toggleFavorite(product);
              },
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text(
            currentIndex == 0
                ? 'Каталог товаров'
                : currentIndex == 1
                ? 'Избранное'
                : 'Профиль',
          ),
          bottom: currentIndex == 0
              ? TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.blue,
                  indicatorWeight: 2,
                  tabs: [
                    Tab(text: 'Ноутбуки'),
                    Tab(text: 'Смартфоны'),
                    Tab(text: 'Аксессуары'),
                    Tab(text: 'Мониторы'),
                    Tab(text: 'Принтеры'),
                    Tab(text: 'Игровые устройства'),
                    Tab(text: 'Все товары'),
                  ],
                )
              : null,
        ),
        body: currentIndex == 0
            ? TabBarView(
                children: [
                  buildProductList(
                    productByCategory['Ноутбуки']!,
                    Icons.laptop,
                    Colors.blue,
                  ),
                  buildProductList(
                    productByCategory['Смартфоны']!,
                    Icons.smartphone,
                    Colors.green,
                  ),
                  buildProductList(
                    productByCategory['Аксессуары']!,
                    Icons.headphones,
                    Colors.purple,
                  ),
                  buildProductList(
                    productByCategory['Мониторы']!,
                    Icons.desktop_windows,
                    Colors.teal,
                  ),
                  buildProductList(
                    productByCategory['Принтеры']!,
                    Icons.print,
                    Colors.orange,
                  ),
                  buildProductList(
                    productByCategory['Игровые устройства']!,
                    Icons.sports_esports,
                    Colors.red,
                  ),
                  buildProductList(
                    productByCategory.values
                        .expand((products) => products)
                        .toList(),
                    Icons.shopping_bag,
                    Colors.grey,
                  ),
                ],
              )
            : currentIndex == 1
            ? buildProductList(
                favorites.toList(),
                Icons.shopping_bag,
                Colors.grey,
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person, size: 60, color: Colors.amber),
                    SizedBox(height: 16),

                    Text(
                      'Профиль пользователя',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.amber,
          iconSize: 24,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Избранное',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
          ],
        ),
      ),
    );
  }
}
