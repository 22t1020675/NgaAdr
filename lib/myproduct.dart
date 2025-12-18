import 'package:flutter/material.dart';
import 'package:appp_hi/api.dart';
import 'package:appp_hi/model/product.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({super.key});

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  List<Product> list = [];
  bool isLoading = true;
  int _bottomIndex = 0;

  final FocusNode _searchFocus = FocusNode();
  bool _isFocus = false;

  @override
  void initState() {
    super.initState();
    loadData();
    _searchFocus.addListener(() {
      setState(() => _isFocus = _searchFocus.hasFocus);
    });
  }

  Future<void> loadData() async {
    list = await test_api.getAllProduct();
    setState(() => isLoading = false);
  }

  @override
  void dispose() {
    _searchFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),

      // ================= APP BAR =================
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: 42,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: _isFocus ? Colors.amber : Colors.transparent,
                width: 1.5,
              ),
            ),
            child: Row(
              children: [
                const SizedBox(width: 12),
                const Icon(Icons.search, size: 20, color: Colors.grey),
                const SizedBox(width: 6),
                Expanded(
                  child: TextField(
                    focusNode: _searchFocus,
                    decoration: const InputDecoration(
                      hintText: "Tìm kiếm sản phẩm",
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.mic, size: 20),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.tune, size: 20),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),

      // ================= BODY =================
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(color: Colors.amber),
            )
          : LayoutBuilder(
              builder: (context, constraints) {
                final double width = constraints.maxWidth;

                final int crossAxisCount = width < 360
                    ? 1
                    : width < 600
                        ? 2
                        : width < 1100
                            ? 3
                            : 4;

                // 👉 tăng chiều cao item cho mobile để không overflow
                final double aspectRatio = width < 360
                    ? 0.6
                    : width < 600
                        ? 0.65
                        : width < 1100
                            ? 0.75
                            : 0.8;

                return Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    child: GridView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: list.length,
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        childAspectRatio: aspectRatio,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemBuilder: (_, i) => _productItem(list[i]),
                    ),
                  ),
                );
              },
            ),

      // ================= BOTTOM NAV =================
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomIndex,
        onTap: (i) => setState(() => _bottomIndex = i),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang chủ"),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Mall"),
          BottomNavigationBarItem(icon: Icon(Icons.live_tv), label: "Live"),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Thông báo",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Tôi"),
        ],
      ),
    );
  }

  // ================= PRODUCT ITEM =================
  Widget _productItem(Product p) {
    final bool isFreeShip = p.price >= 20;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // ⭐ tránh overflow
        children: [
          // IMAGE
          SizedBox(
            height: 140,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: Image.network(
                      p.image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  top: 6,
                  left: 6,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      "-SALE",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // TITLE
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              p.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                height: 1.25,
              ),
            ),
          ),

          // FREESHIP
          if (isFreeShip)
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 4),
              child: Row(
                children: const [
                  Icon(Icons.local_shipping,
                      size: 14, color: Colors.green),
                  SizedBox(width: 4),
                  Text(
                    "Freeship",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

          const SizedBox(height: 6),

          // RATING
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                const Icon(Icons.star, size: 13, color: Colors.orange),
                Text(
                  " ${p.rating}",
                  style: const TextStyle(fontSize: 12),
                ),
                const Spacer(),
                Text(
                  "Đã bán ${p.count}",
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 6),

          // PRICE
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${p.price}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(
                    Icons.add_shopping_cart,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
