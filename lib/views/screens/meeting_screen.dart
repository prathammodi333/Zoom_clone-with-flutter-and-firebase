import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom_app/controllers/jitsi_controller.dart';
import 'package:zoom_app/views/screens/widgets/reusable_icon.dart';
import 'package:zoom_app/views/screens/widgets/video_call_screen.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

class MeetingScreen extends StatefulWidget {
  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  // const MeetingScreen({Key? key}) : super(key: key);
  final JitsiController _jitsiController = JitsiController();

  createNewMeeting() {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiController.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeing() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => VideoCallScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ReusAbleIcon(
                icon: Icons.videocam,
                text: 'New Meeting',
                onPressed: createNewMeeting,
              ),
              ReusAbleIcon(
                icon: Icons.add_box_rounded,
                text: 'Join Meeting',
                onPressed: joinMeeing,
              ),
              ReusAbleIcon(
                icon: Icons.calendar_today,
                text: 'Schedule',
                onPressed: () {},
              ),
              ReusAbleIcon(
                icon: Icons.arrow_upward,
                text: 'Share Screen',
                onPressed: () {},
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Text(
                'Create/Join Meetings with just a Click',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
