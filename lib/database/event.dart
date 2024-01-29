import 'package:campus_gather/models/event.dart';
import 'package:mongo_dart/mongo_dart.dart';

class Events {
  final EventRepository _eventRepository;

  Events(this._eventRepository);

  Future<List<Event>> getEvents() async {
    return _eventRepository.getEvents();
  }

  Future<void> createEvent(Event event) async {
    await _eventRepository.createEvent(event);
  }

  Future<void> deleteEvent(String eventId) async {
    await _eventRepository.deleteEvent(eventId);
  }

  Future<void> updateEvent(Event event) async {
    await _eventRepository.updateEvent(event);
  }

  Future<List<Event>> searchEvent(String query) async {
    return _eventRepository.searchEvent(query);
  }
}

class EventRepository {
  final Db _db;

  EventRepository(this._db);

  Future<List<Event>> getEvents() async {
    final eventsCollection = _db.collection('events');
    final events = await eventsCollection.find().toList();
    return events.map((eventJson) => Event.fromJson(eventJson)).toList();
  }

  Future<void> createEvent(Event event) async {
    final eventsCollection = _db.collection('events');
    await eventsCollection.insertOne(event.toJson());
  }

  Future<void> deleteEvent(String id) async {
    final eventsCollection = _db.collection('events');
    await eventsCollection.deleteOne(where.eq('id', id));
  }

  Future<void> updateEvent(Event event) async {
    final eventsCollection = _db.collection('events');

    await eventsCollection.update(
      where.eq('id', event.id),
      event.toJson(),
    );
  }

  Future<List<Event>> searchEvent(String query) async {
    final eventsCollection = _db.collection('events');
    final searchRegex = RegExp(query, caseSensitive: false);
    print(searchRegex.isCaseSensitive);

    final searchResult = await eventsCollection.find(
      {
        '\$or': [
          {
            'name': {'\$regex': searchRegex, '\$options': 'i'}
          },
          {
            'description': {'\$regex': searchRegex, '\$options': 'i'}
          },
          {
            'organizationName': {'\$regex': searchRegex, '\$options': 'i'}
          }
        ]
      },
    ).toList();

    return searchResult.map((json) => Event.fromJson(json)).toList();
  }
}
