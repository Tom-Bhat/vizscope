import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static const List<Map<String, String>> projects = [
    {
      'name': 'Horizon Heights Development',
      'image': 'assets/dummyImages/dummyimage.png'
    },
    {
      'name': 'Rajiv Gandhi Project',
      'image': 'assets/dummyImages/dummyimage.png'
    },
    {'name': 'Hemmer Project', 'image': 'assets/dummyImages/dummyimage.png'},
    {'name': 'Venkter Project', 'image': 'assets/dummyImages/dummyimage.png'},
    {'name': 'Sobjain Project', 'image': 'assets/dummyImages/dummyimage.png'},
    {
      'name': 'Zaric Plaza Construction',
      'image': 'assets/dummyImages/dummyimage.png'
    },
    {'name': 'Greenfield Tower', 'image': 'assets/dummyImages/dummyimage.png'},
    {
      'name': 'Liberty Estate Development',
      'image': 'assets/dummyImages/dummyimage.png'
    },
    {
      'name': 'Skyline View Project',
      'image': 'assets/dummyImages/dummyimage.png'
    },
    {'name': 'Pearl Apartments', 'image': 'assets/dummyImages/dummyimage.png'},
  ];

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background_image.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ),
        drawer: const MenuDrawer(),
        body: Column(
          children: [
            Align(
              alignment: const Alignment(0.4, 0),
              child: Image.asset(
                'assets/images/home_image.png',
                height: 200,
                width: 200,
                fit: BoxFit.contain,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: SearchBar(),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: const Color(0xFFD1D1D1),
                    child: ListView.builder(
                      itemCount: Home.projects.length,
                      itemBuilder: (context, index) {
                        final project = Home.projects[index];
                        return InkWell(
                          onTap: () {
                            /*To be routed towards the project detail page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProjectDetails(
                                  projectName: project['name']!,
                                ),
                              ),
                            );*/
                          },
                          child: ProjectCard(
                            name: project['name']!,
                            image: project['image']!,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('Username'),
            accountEmail: Text('username@example.com'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Projects'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/authentication');
            },
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shadowColor: Colors.white,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 10,
              spreadRadius: 1,
              offset: const Offset(-8, 10),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: const Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search bar',
                  border: InputBorder.none,
                ),
              ),
            ),
            Icon(Icons.search, color: Colors.black),
          ],
        ),
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final String name;
  final String image;

  const ProjectCard({super.key, required this.name, required this.image});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFEDEDED),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 4,
                  spreadRadius: 1,
                  offset: const Offset(-8, 10),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      widget.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      widget.image,
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}