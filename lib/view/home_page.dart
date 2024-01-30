import 'package:fashion/util/style.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedLocation = 'New York, USA';
  final searchController = TextEditingController();

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
        body: Padding(
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
              ],
            ),
          ),
        ),
      ),
    );
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
}

class NewsBoard extends StatelessWidget {
  const NewsBoard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade200,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'New Collection',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
          const Text('Discount 50% for \nthe first transaction'),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromRGBO(0, 0, 0, 0.8)),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Shop Now',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
          ),
        ],
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

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: Colors.grey.shade200, shape: BoxShape.circle),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.notifications_on_sharp,
          color: Colors.black,
        ),
      ),
    );
  }
}
