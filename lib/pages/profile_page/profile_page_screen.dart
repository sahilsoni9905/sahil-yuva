import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_landing_page/pages/profile_page/widgets/auth_dialogue_widgets.dart';

class ProfilePageScreen extends StatefulWidget {
  const ProfilePageScreen({super.key});

  @override
  State<ProfilePageScreen> createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {
  bool isEditing = false;

  final TextEditingController _nameController =
      TextEditingController(text: 'Virat Kohli');
  final TextEditingController _heightController =
      TextEditingController(text: '175');
  final TextEditingController _weightController =
      TextEditingController(text: '55');
  final TextEditingController _bloodTypeController =
      TextEditingController(text: 'B+');
  final TextEditingController _ageController =
      TextEditingController(text: '17');

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFFFE8CD),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: -screenHeight * 0.02,
              right: screenWidth * 0.58,
              child: Image.asset(
                'assets/images/left_leaf_1.png',
                fit: BoxFit.cover,
                height: screenHeight * 0.15,
              ),
            ),
            Positioned(
              top: screenHeight * 0.06,
              right: screenWidth * 0.5,
              child: Image.asset(
                'assets/images/left_leaf_2.png',
                fit: BoxFit.cover,
                height: screenHeight * 0.18,
              ),
            ),
            Positioned(
              top: -screenHeight * 0.02,
              left: screenWidth * 0.58,
              child: Image.asset(
                'assets/images/right_leaf_1.png',
                fit: BoxFit.cover,
                height: screenHeight * 0.15,
              ),
            ),
            Positioned(
              top: screenHeight * 0.06,
              left: screenWidth * 0.5,
              child: Image.asset(
                'assets/images/right_leaf_2.png',
                fit: BoxFit.cover,
                height: screenHeight * 0.18,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.04),
                Center(
                  child: Image.asset(
                    'assets/images/profile_text.png',
                    width: screenWidth * 0.6,
                  ),
                ),
                SizedBox(height: screenHeight * 0.15),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF41733D),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  height: screenHeight * 0.55,
                  width: screenWidth * 0.8,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.8 * 0.12),
                    child: Column(
                      children: [
                        SizedBox(height: screenHeight * 0.52 * 0.23),
                        _buildEditableTextField(
                          controller: _nameController,
                          isEditing: isEditing,
                          style: GoogleFonts.josefinSans(
                            color: const Color(0xFFFFE8CD),
                            fontSize: screenHeight * 0.52 * 0.08,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.52 * 0.05),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                _buildEditableTextField(
                                  controller: _heightController,
                                  isEditing: isEditing,
                                  style: GoogleFonts.josefinSans(
                                    color: const Color(0xFFFFE8CD),
                                    fontSize: screenHeight * 0.52 * 0.08,
                                    height: screenHeight * 0.52 * 0.002,
                                  ),
                                ),
                                Text(
                                  'Height',
                                  style: GoogleFonts.josefinSans(
                                    color: const Color(0xFF92B78F),
                                    fontSize: screenHeight * 0.52 * 0.03,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '|',
                              style: GoogleFonts.josefinSans(
                                color: const Color(0xFF92B78F),
                                fontSize: screenHeight * 0.52 * 0.16,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                _buildEditableTextField(
                                  controller: _weightController,
                                  isEditing: isEditing,
                                  style: GoogleFonts.josefinSans(
                                    color: const Color(0xFFFFE8CD),
                                    fontSize: screenHeight * 0.52 * 0.08,
                                    height: screenHeight * 0.52 * 0.002,
                                  ),
                                ),
                                Text(
                                  'Weight',
                                  style: GoogleFonts.josefinSans(
                                    color: const Color(0xFF92B78F),
                                    fontSize: screenHeight * 0.52 * 0.03,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                _buildEditableTextField(
                                  controller: _bloodTypeController,
                                  isEditing: isEditing,
                                  style: GoogleFonts.josefinSans(
                                    color: const Color(0xFFFFE8CD),
                                    fontSize: screenHeight * 0.52 * 0.08,
                                    height: screenHeight * 0.52 * 0.002,
                                  ),
                                ),
                                Text(
                                  'Blood Type',
                                  style: GoogleFonts.josefinSans(
                                    color: const Color(0xFF92B78F),
                                    fontSize: screenHeight * 0.52 * 0.03,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '|',
                              style: GoogleFonts.josefinSans(
                                color: const Color(0xFF92B78F),
                                fontSize: screenHeight * 0.52 * 0.16,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                _buildEditableTextField(
                                  controller: _ageController,
                                  isEditing: isEditing,
                                  style: GoogleFonts.josefinSans(
                                    color: const Color(0xFFFFE8CD),
                                    fontSize: screenHeight * 0.52 * 0.08,
                                    height: screenHeight * 0.52 * 0.002,
                                  ),
                                ),
                                Text(
                                  'Years old',
                                  style: GoogleFonts.josefinSans(
                                    color: const Color(0xFF92B78F),
                                    fontSize: screenHeight * 0.52 * 0.03,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.52 * 0.05),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AuthDialogueWidgets();
                              },
                            );
                          },
                          child: Container(
                            height: screenHeight * 0.52 * 0.08,
                            width: screenWidth * 0.8 * 0.54,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1.5,
                                color: const Color(0xFF92B78F),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Medical Records',
                                  style: GoogleFonts.josefinSans(
                                    color: const Color(0xFFFFE8CD),
                                    fontSize: screenHeight * 0.52 * 0.08 * 0.52,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              left: screenWidth * 0.3,
              top: screenHeight * 0.15,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF92B78F),
                    width: screenHeight * 0.004,
                  ),
                ),
                child: Container(
                  width: screenHeight * 0.14,
                  height: screenHeight * 0.14,
                  decoration: const BoxDecoration(
                    color: Color(0xFF92B78F),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    "assets/images/profile_page_dp.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.42,
              top: screenHeight * 0.77,
              child: InkWell(
                onTap: () {
                  setState(() {
                    isEditing = !isEditing;
                  });
                },
                child: Container(
                  height: screenHeight * 0.033,
                  width: screenWidth * 0.18,
                  decoration: BoxDecoration(
                    color: const Color(0xFF054400),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    isEditing ? 'Save' : 'Edit',
                    style: GoogleFonts.josefinSans(
                      color: const Color(0xFFBFD6AA),
                      fontSize: screenHeight * 0.022,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableTextField({
    required TextEditingController controller,
    required bool isEditing,
    required TextStyle style,
  }) {
    return isEditing
        ? TextField(
            controller: controller,
            style: style,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            textAlign: TextAlign.center,
          )
        : Text(
            controller.text,
            style: style,
          );
  }
}
