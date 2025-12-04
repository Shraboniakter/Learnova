import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  bool isStudent = true;
  bool obscurePass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F4F8),
      body: Column(
        children: [
          // ================= TOP IMAGE AREA =================
          Expanded(
            flex: 6,
            child: Stack(
              children: [
                ClipRRect(
                  child: Image.asset(
                    "assets/images/Rectangle 3619.png",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  top: 83,
                  left: 88,
                  child: Image.asset(
                    "assets/images/Group 48914.png",
                    height: 70.15,
                    width: 253,
                  ),
                ),
              ],
            ),
          ),

          // ================= LOGIN UI START =================
          Expanded(
            flex: 16,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  // Log In Title
                  const Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ---------- STUDENT / TEACHER TOGGLE ----------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => setState(() => isStudent = true),
                        child: Column(
                          children: [
                            Text(
                              "Student",
                              style: TextStyle(
                                fontSize: 16,
                                color:
                                isStudent ? Color(0xff023F86) :Color(0xff727477),
                                fontWeight: isStudent
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              width: 70,
                              height: 2,
                              color: isStudent
                                  ? Color(0xff023F86)
                                  : Colors.transparent,
                            )
                          ],
                        ),
                      ),

                      const SizedBox(width: 40),

                      GestureDetector(
                        onTap: () => setState(() => isStudent = false),
                        child: Column(
                          children: [
                            Text(
                              "Teacher",
                              style: TextStyle(
                                fontSize: 16,
                                color: !isStudent
                                    ? Color(0xff023F86)
                                    : Color(0xff727477),
                                fontWeight: !isStudent
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              width: 70,
                              height: 2,
                              color: !isStudent
                                  ? Color(0xff023F86)
                                  : Colors.transparent,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // ---------- EMAIL FIELD ----------
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Email",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Color(0xffFFFFFF) ,// Border color
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: Color(0xffF1F4F8),
                              width: 1.5
                          ),
                        ),
                      ),

                    ),
                  ),

                  const SizedBox(height: 15),

                  // ---------- PASSWORD FIELD ----------
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      obscureText: obscurePass,
                      decoration: InputDecoration(
                        labelText: "Password",
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: Icon(obscurePass
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () =>
                              setState(() => obscurePass = !obscurePass),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Color(0xffFFFFFF) ,// Border color
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Color(0xffF1F4F8),
                            width: 1.5
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Forgot Password
                  Padding(
                    padding: const EdgeInsets.only(right: 30, top: 5),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color:Color(0xff008DE7,),fontSize: 14,fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // ---------- LOGIN BUTTON ----------
                  SizedBox(
                    width: 390,
                    height: 56,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff1153A0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Log In",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // ---------- GOOGLE LOGIN ----------
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xffF1F4F8)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/Google.png", height: 22),
                          const SizedBox(width: 10),
                          const Text("Login with Google"),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ---------- CREATE ACCOUNT ----------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("New to Learnova? "),
                      Text(
                        "Create an Account",
                        style: TextStyle(
                         color:Color(0xff008DE7),
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
