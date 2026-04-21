import 'package:flutter/material.dart';
import 'package:foodgo/paymentScreenState.dart';

class CustomizeBurgerScreen extends StatefulWidget {
  const CustomizeBurgerScreen({super.key});

  @override
  State<CustomizeBurgerScreen> createState() => _CustomizeBurgerScreenState();
}

class _CustomizeBurgerScreenState extends State<CustomizeBurgerScreen> {
  double _spicyValue = 0.7;
  int _portionCount = 2;

  final List<Map<String, String>> toppings = [
    {'name': 'Tomato', 'image': 'assets/images/t1.png'},
    {'name': 'Onions', 'image': 'assets/images/t2.png'},
    {'name': 'Pickles', 'image': 'assets/images/t3.png'},
    {'name': 'Bacons', 'image': 'assets/images/t4.png'},
    {'name': 'Cheese', 'image': 'assets/images/t5.png'},
    {'name': 'Mushroom', 'image': 'assets/images/t6.png'},
    {'name': 'Avocado', 'image': 'assets/images/t7.png'},
  ];

  final List<Map<String, String>> sideOptions = [
    {'name': 'Fries', 'image': 'assets/images/s1.png'},
    {'name': 'Coleslaw', 'image': 'assets/images/s2.png'},
    {'name': 'Salad', 'image': 'assets/images/s3.png'},
    {'name': 'Onion Rings', 'image': 'assets/images/s4.png'},
    {'name': 'Mozzarella', 'image': 'assets/images/s5.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    'assets/images/7.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Customize Your Burger",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const Text(
                        "to Your Tastes. Ultimate Experience",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      const SizedBox(height: 20),
                      _buildSpicySlider(),
                      const SizedBox(height: 20),
                      _buildPortionCounter(),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              "Toppings",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            _buildHorizontalList(toppings),
            const SizedBox(height: 20),
            const Text(
              "Side options",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            _buildHorizontalList(sideOptions),
            const SizedBox(height: 40),
            _buildBottomBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildSpicySlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Spicy", style: TextStyle(fontWeight: FontWeight.bold)),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 2,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
          ),
          child: Slider(
            value: _spicyValue,
            activeColor: Colors.red,
            onChanged: (v) => setState(() => _spicyValue = v),
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Mild", style: TextStyle(color: Colors.green, fontSize: 10)),
            Text("Hot", style: TextStyle(color: Colors.red, fontSize: 10)),
          ],
        ),
      ],
    );
  }

  Widget _buildPortionCounter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Portion", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Row(
          children: [
            _counterButton(Icons.remove, () {
              if (_portionCount > 1) setState(() => _portionCount--);
            }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "$_portionCount",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            _counterButton(Icons.add, () => setState(() => _portionCount++)),
          ],
        ),
      ],
    );
  }

  Widget _counterButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }

  Widget _buildHorizontalList(List<Map<String, String>> dataList) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dataList.length,
        itemBuilder: (context, i) => Container(
          width: 90,
          margin: const EdgeInsets.only(right: 15, top: 10, bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 5,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(dataList[i]['image']!),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 4),
                decoration: const BoxDecoration(
                  color: Color(0xff322E2E),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dataList[i]['name']!,
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.add_circle, color: Colors.red, size: 14),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Total", style: TextStyle(color: Colors.grey)),
            Text(
              "\$16.49",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    PaymentScreen(basePrice: 8.24, portionCount: _portionCount),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: const Text(
            "ORDER NOW",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
