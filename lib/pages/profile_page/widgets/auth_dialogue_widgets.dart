import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthDialogueWidgets extends StatefulWidget {
  const AuthDialogueWidgets({super.key});

  @override
  State<AuthDialogueWidgets> createState() => _AuthDialogueWidgetsState();
}

class _AuthDialogueWidgetsState extends State<AuthDialogueWidgets> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          height: screenHeight * 0.5,
          width: screenWidth * 0.8,
          child: Stack(
            children: [
              Container(
                  height: screenHeight * 0.35,
                  width: screenWidth * 0.8,
                  decoration: BoxDecoration(
                    color: const Color(0xFF042D00),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.05),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: GoogleFonts.josefinSans(
                                color: const Color(0xFFBFD6AA),
                                fontSize: screenHeight * 0.35 * 0.065,
                              ),
                            ),
                            TextField(
                              controller: _userNameController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xFFFFE8CD),
                                labelStyle: const TextStyle(color: Color(0xFF042D00)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                     const  BorderSide(color: Colors.transparent),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal:
                                        5), 
                                isDense: true, 
                              ),
                              style: GoogleFonts.josefinSans(
                                color: Colors.black,
                                fontSize: screenHeight * 0.35 * 0.05,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.35 * 0.05,
                            ),
                            Text(
                              'Password',
                              style: GoogleFonts.josefinSans(
                                color: const Color(0xFFBFD6AA),
                                fontSize: screenHeight * 0.35 * 0.065,
                              ),
                            ),
                            TextField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xFFFFE8CD),
                                labelStyle: const TextStyle(color: Color(0xFF042D00)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.transparent),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal:
                                        5), // Adjust this to control height
                                isDense: true, // Reduces the overall height
                              ),
                              style: GoogleFonts.josefinSans(
                                color: Colors.black,
                                fontSize: screenHeight * 0.35 * 0.05,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.35 * 0.05,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Authentication using Google",
                                  style: GoogleFonts.josefinSans(
                                    color: const Color(0xFFBFD6AA),
                                    fontSize: screenHeight * 0.35 * 0.05,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFF8FFCD),
                                    ),
                                    onPressed: () {},
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          'Sign in using google ',
                                          style: GoogleFonts.josefinSans(
                                            color: const Color(0xFF042D00),
                                            fontSize:
                                                screenHeight * 0.35 * 0.055,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Image.asset(
                                          'assets/images/google_logo.png.png',
                                          height: screenHeight * 0.35 * 0.085,
                                        )
                                      ],
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              Positioned(
                left: screenWidth * 0.8 * 0.37,
                top: screenHeight * 0.4,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF92B78F)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Done',
                    style: GoogleFonts.josefinSans(
                      color: const Color(0xFF042D00),
                      fontSize: screenHeight * 0.35 * 0.055,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: screenWidth * 0.8 * 0.35,
                top: screenHeight * 0.35 * 0.95,
                child: Image.asset(
                  'assets/images/profile_page_ipo.png',
                  height: screenHeight * 0.35 * 0.23,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
