import 'package:coffee_app/common/app_routes.dart';
import 'package:coffee_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class Item extends StatefulWidget {
  final String image;
  final String name;
  final String description;
  final double price;
  final Function(Map<String, dynamic>) onTap;

  const Item({
    Key? key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.onTap,
  }) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.detail,
        );
        widget.onTap({
          'image': widget.image,
          'name': widget.name,
          'description': widget.description,
          'price': widget.price,
        });
      },
      child: Container(
        height: 239,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              blurRadius: 8.0,
              color: Colors.grey.shade300,
              offset: Offset(1, 1),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 13,
            right: 13,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 10.0),
                      width: 122,
                      height: 122,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(widget.image),
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.center,
                          scale: 1,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    left: -1,
                    child: Container(
                      width: 51,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.transparent.withOpacity(0.5),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Iconsax.star1,
                            color: Color(0xfffFBBE21),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            "4.9",
                            style: GoogleFonts.sora(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Text(
                  widget.name,
                  style: GoogleFonts.sora(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff2F2D2C),
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              // Text(
              //   widget.description,
              //   style: GoogleFonts.sora(
              //     fontSize: 10,
              //     fontWeight: FontWeight.w400,
              //     color: const Color(0xff9B9B9B),
              //   ),
              // ),
              const SizedBox(
                height: 11,
              ),
              Center(
                child: Text(
                  NumberFormat.currency(
                    locale: 'id',
                    symbol: 'Rp ',
                    decimalDigits: 0,
                  ).format(widget.price),
                  style: GoogleFonts.sora(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: brownColor,
                  ),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       "\$ ${widget.price.toStringAsFixed(2)}",
              //       style: GoogleFonts.sora(
              //         fontSize: 16,
              //         fontWeight: FontWeight.w600,
              //         color: const Color(0xff2F4B4E),
              //       ),
              //     ),
              //     GestureDetector(
              //       onTap: () => Navigator.pushNamed(
              //         context,
              //         Routes.detail,
              //       ),
              //       child: Container(
              //         width: 28,
              //         height: 28,
              //         decoration: BoxDecoration(
              //           color: const Color(0xffC67C4E),
              //           borderRadius: BorderRadius.circular(10),
              //         ),
              //         child: const Icon(
              //           Icons.add,
              //           color: Colors.white,
              //         ),
              //       ),
              //     )
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
