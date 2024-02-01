import 'package:fashion/util/components.dart';
import 'package:fashion/util/style.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Widget Function()> _pages;
  String selectedLocation = 'New York, USA';
  final searchController = TextEditingController();
  int _selectedPage = 0;
  Color colorIconSelected = Colors.black, colorIconNotSelected = Colors.grey;

  @override
  void initState() {
    super.initState();
    _pages = [
      mainHome,
      teste,
      //TODO - adicionar mais páginas
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'just exquisite',
            style: kAppBarTitle,
          ),
          centerTitle: true,
        ),
        body: IndexedStack(
          index: _selectedPage,
          children: _pages.map((pageBuilder) => pageBuilder()).toList(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
          ],
          selectedItemColor: colorIconSelected,
          unselectedItemColor: colorIconNotSelected,
          selectedIconTheme: IconThemeData(color: colorIconSelected, size: 30),
          onTap: _onBottomNavigationTapped,
        ),
      ),
    );
  }

  void _onBottomNavigationTapped(int index) {
    setState(() {
      _selectedPage = index;
      colorIconSelected = Colors.black;
      colorIconNotSelected = Colors.grey;
    });
  }

  DropdownButton<String> _dropdownLocations() {
    return DropdownButton<String>(
      value: selectedLocation,
      onChanged: (String? newValue) {
        setState(() {
          selectedLocation = newValue!;
        });
      },
      items: <String>[
        'New York, USA',
        'São Paulo, BR',
        'Tokyo, JP',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      icon: const Icon(
        Icons.keyboard_arrow_down_rounded,
        color: Colors.black,
        size: 25,
      ),
    );
  }

  Widget mainHome() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  direction: Axis.vertical,
                  spacing: 0,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text('Location'),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on_sharp),
                        const SizedBox(width: 2),
                        _dropdownLocations(),
                      ],
                    ),
                  ],
                ),
                const NotificationIcon(),
              ],
            ),
            SearchBar(searchController: searchController),
            const NewsBoard(),
            const CategoryFrame(),
            const Text(
              'Flash Sale',
              style: kTitleStyle,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  direction: Axis.horizontal,
                  children: [
                    DefaultLittleButtton(
                      name: 'All',
                      isSelectable: true,
                    ),
                    DefaultLittleButtton(
                      name: 'All',
                      isSelectable: true,
                    ),
                    DefaultLittleButtton(
                      name: 'All',
                      isSelectable: true,
                    ),
                  ],
                ),
              ),
            ),
            Wrap(
              direction: Axis.horizontal,
              spacing: 15,
              runSpacing: 25,
              children: [
                ProductCard(
                  context: context,
                  image: 'assets/jaqueta.jpeg',
                  name: 'Black Jacket',
                  price: '119,99',
                  rating: 4.9,
                ),
                ProductCard(
                  context: context,
                  image: 'assets/jaqueta.jpeg',
                  name: 'Black Jacket',
                  price: '119,99',
                  rating: 4.9,
                ),
                ProductCard(
                  context: context,
                  image: 'assets/jaqueta.jpeg',
                  name: 'Black Jacket',
                  price: '119,99',
                  rating: 4.9,
                ),
                ProductCard(
                  context: context,
                  image: 'assets/jaqueta.jpeg',
                  name: 'Black Jacket',
                  price: '119,99',
                  rating: 4.9,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: searchController,
            decoration: const InputDecoration(
              hintText: 'Search',
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              prefixIcon: Icon(Icons.search_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.black,
          ),
          child: IconButton(
            onPressed: () {
              //TODO - abrir lista de filtros
            },
            icon: const Icon(
              Icons.filter_list_alt,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

Widget teste() {
  return Text('teste');
}
