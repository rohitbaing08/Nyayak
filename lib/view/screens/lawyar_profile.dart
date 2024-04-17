import 'package:flutter/material.dart';
import 'package:nyayak/model/lawyer_model.dart';
import 'package:nyayak/res/colors.dart';
import 'package:nyayak/view/screens/chat/chat_view.dart';
import 'package:nyayak/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class LawyerProfile extends StatefulWidget {
  final LawyerModel lawyer;
  const LawyerProfile({
    super.key,
    required this.lawyer,
  });

  @override
  State<LawyerProfile> createState() => _LawyerProfileState();
}

class _LawyerProfileState extends State<LawyerProfile> {
  @override
  Widget build(BuildContext context) {
    String createChatRoom(String user1, String user2) {
      if (user1[0].toLowerCase().codeUnits[0] >
          user2[0].toLowerCase().codeUnits[0]) {
        return "$user1$user2";
      } else {
        return "$user2$user1";
      }
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: LightAppColors().backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Consumer<HomeViewModel>(
                builder: (context, value, child) => IconButton(
                    onPressed: () {
                      String roomId = createChatRoom(
                          value.userData['id'], widget.lawyer.id);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatView(
                                    lawyer: widget.lawyer,
                                    chatRoomId: roomId,
                                  )));
                    },
                    icon: const Icon(
                      Icons.message_outlined,
                      color: Colors.black,
                      size: 40,
                    )),
              ),
            )
          ],
          title: const Text(
            'Profile',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                height: 138,
                width: 146,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: Image.asset(
                    'assets/Images/profilepic.jpeg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 7),
              Text(
                widget.lawyer.name,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.grey,
                    size: 19,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    widget.lawyer.location,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        30.0), // Adjust the horizontal padding as needed
                child: Divider(
                  color: Color(0xFF3B495A),
                  thickness: 2,
                  height: 20, // Adjust the height of the divider as needed
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFF3B495A),
                    width: 1.4,
                  ),
                ),
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Flexible(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Cases Solved',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.4),
                          ),
                          Text(
                            '724',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.4),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Experience',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.4),
                          ),
                          Text(
                            '${widget.lawyer.experience} years',
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.4),
                          ),
                        ],
                      ),
                    ),
                    const Flexible(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Ratings',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.4),
                          ),
                          Text(
                            '',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.4),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFF3B495A),
                    width: 1.4,
                  ),
                ),
                height: 150,
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 250, 0),
                      child: Text(
                        'Insights',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.6),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        '"I believe in providing clients with clear, practical legal solutions tailored to their unique needs. My approach is client-centric, focusing on achieving the best possible outcome while minimizing stress and uncertainty."',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF514A4A),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFF3B495A),
                    width: 1.4,
                  ),
                ),
                height: 150,
                width: double.infinity,
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 200, 0),
                      child: Text(
                        'Practice Areas',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.6),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 130, 2),
                      child: Text(
                        '• Criminal Law \n• Civil Litigation \n• Family Law \n• Real Estate Law \n• Estate Planning and Probate',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF514A4A),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
