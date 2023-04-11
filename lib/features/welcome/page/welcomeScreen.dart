import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111B21),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Image.asset(
              'assets/Images/circle.png',
              color: const Color(0xFF00A884).withOpacity(0.4),
            ),
          )),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: Column(
              children: [
                const Text(
                  'Welcome To Lerob Whatsapp',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: 'Read our ',
                      style: TextStyle(color: Color(0xFF8696A0)),
                      children: [
                        TextSpan(
                          text: 'Privacy Policies. ',
                          style: TextStyle(
                              color: Color.fromARGB(255, 83, 235, 108)),
                        ),
                        TextSpan(
                            text: 'Tap "Agree and Continue" to accept the'),
                        TextSpan(
                          text: 'Terms of Services.',
                          style: TextStyle(
                              color: Color.fromARGB(255, 83, 235, 108)),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  height: 42,
                  child: ElevatedButton(
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00A884),
                      foregroundColor: const Color(0xFF111B21),
                      splashFactory: NoSplash.splashFactory,
                      elevation: 3.0,
                      shadowColor: Colors.transparent
                    ),
                    child:  const Text("AGREE AND CONTINUE"),
                  ),
                ),
                const SizedBox(height: 80,),
                Material(
                  color: const Color(0xFF182229),
                  borderRadius: BorderRadius.circular(20.0),
                  child: InkWell(
                    onTap: () => {},
                    borderRadius: BorderRadius.circular(20.0),
                    splashFactory: NoSplash.splashFactory,
                    highlightColor: const Color(0xFF09141A),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children:const [
                          Icon(
                            Icons.language,
                            color: Color(0xFF00A884),
                          ),
                          SizedBox(width: 10,),
                          Text('English'),
                           SizedBox(width: 5,),
                           Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Color(0xFF00A884),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
