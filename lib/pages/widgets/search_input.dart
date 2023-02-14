import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  final String hinText;
  final Widget prefixIcon;
  final void Function(String)? onChanged;
  const SearchInput(
      {super.key,
      required this.hinText,
      required this.prefixIcon,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 15),
      child: TextFormField(
        keyboardType: TextInputType.text,
        autocorrect: false,
        onChanged: onChanged,
        style: const TextStyle(
          fontSize: 16.0,
          fontFamily: 'Lato',
          fontWeight: FontWeight.normal,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: prefixIcon,
          hintText: hinText,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.normal,
          ),
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
