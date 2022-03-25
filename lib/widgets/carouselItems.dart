// import 'package:flutter/material.dart';

// import '../constants/colors.dart';

// class CarouselItem extends StatelessWidget {
//   String TitleText;
//   String ImageAdress;

//   CarouselItem({required this.TitleText, required this.ImageAdress});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.32,
//           width: MediaQuery.of(context).size.height * 0.25,
//           child: Center(
//             child: Text(
//               TitleText,
//               style: const TextStyle(
//                 color: AppColors.black,
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.3,
//           width: MediaQuery.of(context).size.height * 0.25,
//           child: Image.asset(
//             ImageAdress,
//             fit: BoxFit.cover,
//           ),
//         )
//       ],
//     );
//   }
// }
