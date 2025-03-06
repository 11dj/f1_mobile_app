import 'package:f1_mobile_app/models/meeting/meeting.dart';
import 'package:f1_mobile_app/models/session/session.dart';
import 'package:f1_mobile_app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class MeetingsScreen extends StatefulWidget {
  const MeetingsScreen({super.key});

  @override
  State<MeetingsScreen> createState() => _MeetingsScreenState();
}

class _MeetingsScreenState extends State<MeetingsScreen> {
  final OpenF1Api _f1Api = OpenF1Api();
  late Future<List<Meeting>> meetingsFuture;
  Map<int, Future<List<Session>>> sessionsFutures = {};
  int? expandedMeetingKey; // Tracks the key of the currently expanded meeting

  @override
  void initState() {
    super.initState();
    meetingsFuture = _f1Api.getMeetings(
      year: 2025,
    );
  }

  void _toggleExpansion(int meetingKey) {
    setState(() {
      if (expandedMeetingKey == meetingKey) {
        // If the same tile is tapped again, collapse it
        expandedMeetingKey = null;
      } else {
        expandedMeetingKey = meetingKey;
        if (!sessionsFutures.containsKey(meetingKey)) {
          sessionsFutures[meetingKey] =
              _f1Api.getSessions(meetingKey: meetingKey);
        }
      }
    });
  }

  Future<void> _launchURL() async {
    const url = 'https://github.com/xsampedro/f1_telemetry_viewer';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget buildMeetingTile(Meeting meeting) {
    final dateStartString =
        DateFormat.yMMMMEEEEd().format(DateTime.parse(meeting.dateStart));

    return Card(
      child: ExpansionTile(
        key: PageStorageKey<int>(meeting.meetingKey),
        initiallyExpanded: expandedMeetingKey == meeting.meetingKey,
        title: Text(meeting.meetingName),
        subtitle: Text('${meeting.location}, $dateStartString'),
        onExpansionChanged: (bool expanded) {
          _toggleExpansion(meeting.meetingKey);
        },
        children: <Widget>[
          FutureBuilder<List<Session>>(
            future: sessionsFutures[meeting.meetingKey],
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                return Column(
                  children: snapshot.data!.map((session) {
                    final dateString =
                        DateFormat('MMMM d').format(session.dateStart);
                    final startTimeString =
                        DateFormat('HH:mm').format(session.dateStart);
                    final endTimeString =
                        DateFormat('HH:mm').format(session.dateEnd);

                    return ListTile(
                      title: Text(session.sessionName),
                      subtitle: Text(
                          '$dateString, from $startTimeString to $endTimeString'),
                      onTap: () {
                        //   Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => DriversScreen(
                        //           meeting: meeting, session: session)),
                        // );
                      },
                    );
                  }).toList(),
                );
              } else {
                return const Text('No sessions found');
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Meeting and Session'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.bug_report_sharp,
              color: Colors.indigo,
            ),
            padding: const EdgeInsets.only(right: 60.0),
            onPressed: _launchURL,
            tooltip: 'View Source Code',
          ),
        ],
      ),
      body: FutureBuilder<List<Meeting>>(
        future: meetingsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error.toString()}'));
          } else if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!.map(buildMeetingTile).toList(),
            );
          } else {
            return const Center(child: Text('No meetings found'));
          }
        },
      ),
    );
  }
}
