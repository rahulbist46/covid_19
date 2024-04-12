
part of 'country_screen.dart';
class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        TextFormField(

          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11.0),
            ),
            hintText: 'Search with country name',
            suffixIcon:  const Icon(Icons.search) ,


        ),
        ),
      ],
    );
  }
}
