import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  final String  hinText;
  final Widget prefixIcon;
  const SearchInput({
    super.key, required this.hinText, required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 15),
      child: TextFormField(
        keyboardType: TextInputType.text,
        autocorrect: false,
        cursorColor: Colors.black,
        style: const TextStyle(
          color: Colors.black54,
          fontSize: 16.0,
          fontFamily: 'Lato',
          fontWeight: FontWeight.normal,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          prefixIconColor: Colors.black26,
          prefixIcon: prefixIcon,
          hintText: hinText,
          hintStyle: const TextStyle(
            color: Colors.black26,
            fontWeight: FontWeight.normal,
          ),
          filled: true,
          fillColor: const Color.fromARGB(20, 0, 0, 0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none
          ),
        ),
      ),
    );
  }
}
