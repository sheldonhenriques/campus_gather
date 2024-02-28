import 'package:campus_gather/models/event.dart';
import 'package:flutter/material.dart';
import 'package:campus_gather/utils/util.dart';

class ListElement extends StatelessWidget {
  final String thumbnailUrl;
  final String dateTimeTitle;
  final String actualTitle;
  final String subtitle;

  const ListElement({
    super.key,
    required this.thumbnailUrl,
    required this.dateTimeTitle,
    required this.actualTitle,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            width: 70,
            height: 70,
            child: Image.network(thumbnailUrl),
          ),
        ),
        title: Text(
          actualTitle,
          style: const TextStyle(
            fontSize: 13, // Adjust the size as needed
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dateTimeTitle,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 12, // Adjust the size as needed
                color: Colors.grey,
              ),
            ),
          ],
        ),
        trailing: const Icon(Icons.favorite_border),
      ),
    );
  }
}

class ListElementTab extends StatelessWidget {
  final String tabTitle;
  final List<Event> events;

  const ListElementTab(
      {super.key, required this.tabTitle, required this.events});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: events.length,
      itemBuilder: (context, index) {
        // Build each list element using the event data
        Event event = events[index];

        return ListElement(
          thumbnailUrl:
              "https://se-images.campuslabs.com/clink/images/${event.imagePath}?preset=med-w",
          dateTimeTitle: formatEventStartTime(event.startsOn),
          actualTitle: event.name,
          subtitle: "Hosted by: ${event.organizationName}",
        );
      },
    );
  }
}
