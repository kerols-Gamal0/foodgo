import 'package:flutter/material.dart';
import 'package:foodgo/details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

int selectedIndex = 0;
TextEditingController controller = TextEditingController();

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> items = [
    {
      'image': 'assets/images/3.png',
      'name1': 'Cheeseburger',
      'name2': "Wendy's Burger",
      'name3':
          "The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles.",
      'star': "4.9",
      'price': 8.24,
    },
    {
      'image': 'assets/images/4.png',
      'name1': 'Hamburger',
      'name2': "Veggie Burger",
      'name3':
          "Enjoy our delicious Hamburger Veggie Burger, made with a savory blend of fresh vegetables and herbs, topped with crisp lettuce, juicy tomatoes, and tangy pickles, all served on a soft, toasted bun. ",
      'star': '4.8',
      'price': 9.99,
    },
    {
      'image': 'assets/images/5.png',
      'name1': 'Hamburger',
      'name2': "Chicken Burger",
      'name3':
          "Our chicken burger is a delicious and healthier alternative to traditional beef burgers, perfect for those looking for a lighter meal option. Try it today and experience the mouth-watering flavors of our Hamburger Chicken Burger!",
      'star': "4.6",
      'price': 12.48,
    },
    {
      'image': 'assets/images/6.png',
      'name1': 'Hamburger',
      'name2': "Fried Chicken Burger",
      'name3':
          "Indulge in our crispy and savory Fried Chicken Burger, made with a juicy chicken patty, hand-breaded and deep-fried to perfection, served on a warm bun with lettuce, tomato, and a creamy sauce.",
      'star': "4.5",
      'price': 26.99,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: 100,
          height: 50,
          child: Image.asset("assets/images/Foodgo2.png", fit: .fill),
        ),
        actions: [
          SizedBox(
            width: 60,
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset("assets/images/profile.jpeg", fit: .fill),
            ),
          ),
          SizedBox(width: 15),
        ],
      ),

      body: ListView(
        children: [
          Row(
            children: [
              SizedBox(width: 15),
              Text(
                "Order your favourite food!",
                style: TextStyle(color: Colors.grey[800]),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 15),
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 40),
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                width: 50,
                height: 50,
                child: Icon(Icons.tune, color: Colors.white),
              ),
              SizedBox(width: 15),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: .horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: 75,
                      height: 50,
                      child: Center(
                        child: Text(
                          "All",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: 100,
                      height: 50,
                      child: Center(
                        child: Text("Combos", style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: 100,
                      height: 50,
                      child: Center(
                        child: Text("Sliders", style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: 100,
                      height: 50,
                      child: Center(
                        child: Text("Clasic", style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.72,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(12),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailsScreen(burgerData: items[index]),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Center(
                            child: Image.asset(
                              items[index]['image'],
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          items[index]['name1'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xff322E2E),
                          ),
                        ),
                        Text(
                          items[index]['name2'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 18,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  items[index]['star'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.favorite_border,
                              color: Color(0xff322E2E),
                              size: 24,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
