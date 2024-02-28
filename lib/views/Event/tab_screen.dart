import 'package:campus_gather/utils/util.dart';
import 'package:flutter/material.dart';
import 'list_element.dart';
import 'package:campus_gather/models/event.dart';
import 'package:campus_gather/services/event.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mongo_dart/mongo_dart.dart' show Db;

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  TabScreenState createState() => TabScreenState();
}

class TabScreenState extends State<TabScreen> {
  List<Event> campusFeedEvents = [];
  List<Event> followingEvents = [];
  List<Event> favoriteEvents = [];

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch events when the widget initializes
  }

  // Method to fetch events from the API
  Future<void> fetchData() async {
    late Db db;
    try {
      // Establish connection to the MongoDB database
      db = await Db.create(dotenv.get('MONGO_URL'));
      await db.open();

      // Fetch events from the database
      final eventRepository = EventRepository(db);
      final events = Events(eventRepository);
      final allEvents = await events.getEvents();

      setState(() {
        // Assign fetched events to campusFeedEvents and followingEvents
        campusFeedEvents = allEvents.toList();
        followingEvents = allEvents.toList();
        favoriteEvents = allEvents.toList();
      });
    } catch (e) {
      setupLogger();
      logger.severe("Error fetching events: $e");
      // Handle error as needed
    } finally {
      // Close the database connection after fetching is complete
      await db.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints.expand(height: 50),
            child: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.rss_feed)),
                Tab(icon: Icon(Icons.people)),
                Tab(icon: Icon(Icons.star)),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                ListElementTab(tabTitle: "Feed", events: campusFeedEvents),
                ListElementTab(tabTitle: "Following", events: followingEvents),
                ListElementTab(tabTitle: "Favorite", events: favoriteEvents),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
