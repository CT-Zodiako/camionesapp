import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.43,
      child: Swiper(
        itemCount: 3,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.9,
        itemHeight: size.height * 0.9,
        itemBuilder: (_, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: FadeInImage(
              placeholder: NetworkImage('https://via.placeholder.com/800x800'),
              image: NetworkImage('https://via.placeholder.com/800x800'),
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
