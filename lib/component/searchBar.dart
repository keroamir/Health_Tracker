import 'package:flutter/material.dart';

import '../constant.dart';
import 'customText.dart';

class SearchBars extends StatelessWidget {
  const SearchBars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            child: Row(
              children: [
                CustomText(
                    text: "تصفية",
                    color: black,
                    size: 20,
                    weight: FontWeight.normal),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.filter_alt_sharp,
                  color: black,
                  size: 30,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          TextFormField(
            style: const TextStyle(
              fontSize: 16,
              color: black,
              fontWeight: FontWeight.w500,
            ),
            textDirection: TextDirection.rtl,
            maxLines: 1,
            decoration: InputDecoration(
              hintText: "بحث عن طبيب",
              fillColor: white,
              filled: true,
              hintStyle: const TextStyle(
                fontSize: 20,
              ),
              hintTextDirection: TextDirection.rtl,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              border: OutlineInputBorder(
                gapPadding: 3,
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20),
              ),
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 2 / 3),
              prefixIcon: const Icon(
                Icons.search,
                color: subText,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}
