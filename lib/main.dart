import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CSS Framework Selector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List of CSS frameworks with corresponding icons
  final List<Map<String, dynamic>> frameworks = [
    {'name': 'Bootstrap', 'icon': FontAwesomeIcons.bootstrap},
    {'name': 'Tailwind', 'icon': FontAwesomeIcons.wind},
    {'name': 'Bulma', 'icon': FontAwesomeIcons.bullhorn},
    {'name': 'Foundation', 'icon': FontAwesomeIcons.anchor},
    {'name': 'Daisy UI', 'icon': FontAwesomeIcons.seedling},
    {'name': 'Materialize', 'icon': FontAwesomeIcons.boxOpen},
    {'name': 'UIKit', 'icon': FontAwesomeIcons.universalAccess},
    {'name': 'Semantic UI', 'icon': FontAwesomeIcons.server},
    {'name': 'Ant Design', 'icon': FontAwesomeIcons.stackExchange},
    {'name': 'Primer', 'icon': FontAwesomeIcons.book},
    {'name': 'Tachyons', 'icon': FontAwesomeIcons.rocket},
    {'name': 'Pure', 'icon': FontAwesomeIcons.water},
    {'name': 'Material Design Lite', 'icon': FontAwesomeIcons.lightbulb},
    {'name': 'Spectre', 'icon': FontAwesomeIcons.ghost},
    {'name': 'Milligram', 'icon': FontAwesomeIcons.weightHanging},
    {'name': 'Water', 'icon': FontAwesomeIcons.water},
    {'name': 'Chakra', 'icon': FontAwesomeIcons.spa},
    {'name': 'Mantine UI', 'icon': FontAwesomeIcons.heart},
    {'name': 'Skelton', 'icon': FontAwesomeIcons.bone},
    {'name': 'MUI', 'icon': FontAwesomeIcons.box},
    {'name': 'GetCSS', 'icon': FontAwesomeIcons.code},
  ];

  // Components corresponding to each framework
  final Map<String, List<String>> components = {
    'Tailwind': [
      'NavBar',
      'Hero',
      'Navbar & Hero Combo',
      'Button',
      'Card',
      'Modal'
    ],
    'Bootstrap': ['Button', 'Card', 'Modal'],
    'Bulma': ['Button', 'Card', 'Modal'],
    'Foundation': ['Button', 'Card', 'Modal'],
    'Daisy UI': ['Button', 'Card', 'Modal'],
    'Materialize': ['Button', 'Card', 'Modal'],
    'UIKit': ['Button', 'Card', 'Modal'],
    'Semantic UI': ['Button', 'Card', 'Modal'],
    'Ant Design': ['Button', 'Card', 'Modal'],
    'Primer': ['Button', 'Card', 'Modal'],
    'Tachyons': ['Button', 'Card', 'Modal'],
    'Pure': ['Button', 'Card', 'Modal'],
    'Material Design Lite': ['Button', 'Card', 'Modal'],
    'Spectre': ['Button', 'Card', 'Modal'],
    'Milligram': ['Button', 'Card', 'Modal'],
    'Water': ['Button', 'Card', 'Modal'],
    'Chakra': ['Button', 'Card', 'Modal'],
    'Mantine UI': ['Button', 'Card', 'Modal'],
    'Skelton': ['Button', 'Card', 'Modal'],
    'MUI': ['Button', 'Card', 'Modal'],
    'GetCSS': ['Button', 'Card', 'Modal'],
  };

  // Selected framework and component
  String? selectedFramework;
  String? selectedComponent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('CSS Framework Selector'),
          ),
      body: Row(
        children: [
          // Primary Sidebar
          Container(
            width: 200,
            color: Colors.grey[200],
            child: ListView.builder(
              itemCount: frameworks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: FaIcon(frameworks[index]['icon']),
                  title: Text(frameworks[index]['name']),
                  onTap: () {
                    setState(() {
                      selectedFramework = frameworks[index]['name'];
                      selectedComponent = null; // Reset selected component
                    });
                  },
                );
              },
            ),
          ),
          // Secondary Sidebar
          selectedFramework == null
              ? Container(
                  width: 200,
                  color: Colors.white,
                  child: Center(
                    child: Text('Select a CSS framework to view components'),
                  ),
                )
              : Container(
                  width: 200,
                  color: Colors.grey[300],
                  child: ListView.builder(
                    itemCount: components[selectedFramework]!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(components[selectedFramework]![index]),
                        onTap: () {
                          setState(() {
                            selectedComponent =
                                components[selectedFramework]![index];
                          });
                        },
                      );
                    },
                  ),
                ),
          // Detail View
          Expanded(
            child: Container(
              color: Colors.white,
              child: selectedComponent == null
                  ? Center(
                      child: Text('Select a component to view details'),
                    )
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Card(
                            margin: EdgeInsets.all(10),
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                'Details about $selectedComponent',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                          Card(
                            margin: EdgeInsets.all(10),
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                '$selectedComponent Example 1',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                          Card(
                            margin: EdgeInsets.all(10),
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                '$selectedComponent Example 2',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                          // Add more cards as needed
                        ],
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
