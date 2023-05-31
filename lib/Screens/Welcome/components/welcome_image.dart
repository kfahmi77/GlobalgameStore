import 'package:flutter/material.dart';

import '../../../constants.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "WELCOME",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: defaultPadding * 2),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              // child: SvgPicture.asset(
              //   "assets/icons/chat.svg",
              // ),
              child: Image.asset(
                'assets/images/icon.png',
                height: 300,
              ),
            ),
            
            const Spacer(),
          ],
          
        ),
        const SizedBox(height: defaultPadding * 2),
        
      ],
      
    );
  }
}