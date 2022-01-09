import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/helper.dart';

class PeerQrLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Material(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'assets/logo.png',
            height: 80,
            width: 80,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            'PeerQr',
            style:
                GoogleFonts.poppins(fontSize: 36, fontWeight: FontWeight.w500),
          )
        ]),
      );
}
