import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItem extends StatefulWidget {
  final int index;
  final String title;
  final String image;
  final Function() onClick;
  final int selectedCategory;

  const CategoryItem({
    super.key,
    required this.index,
    required this.title,
    required this.image,
    required this.onClick,
    required this.selectedCategory,
  });

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onClick(),
      child: Container(
        width: 100,
        height: 38,
        margin: const EdgeInsets.only(
          right: 3,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.index == widget.selectedCategory
                ? const Color(0xffC67C4E)
                : Colors.white,
            width: 1,
          ),
          color: widget.index == widget.selectedCategory
              ? const Color(0xffC67C4E).withOpacity(0.2)
              : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.9),
              spreadRadius: 1,
              blurRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              widget.image,
              width: 16,
              height: 16,
            ),
            SizedBox(width: 4),
            Text(
              widget.title,
              style: GoogleFonts.sora(
                color: widget.index == widget.selectedCategory
                    ? Color(0xffC67C4E)
                    : Colors.black,
                fontSize: 12,
                fontWeight: widget.index == widget.selectedCategory
                    ? FontWeight.w500
                    : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
