part of 'country_screen.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  late CountriesBloc countriesBloc;

  @override
  void initState() {
    super.initState();
    countriesBloc = context.read<CountriesBloc>();

    if (countriesBloc.state is! CountriesBloc) {
      countriesBloc.add(FetchCountries());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CountriesBloc, CountriesState>(
        builder: (context, state) {
          if (state is CountriesLoading) {
            // Show loading spinner while data is loading
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CountriesSuccess) {
            final List<CountriesModal> countries = state.countriesModal;
            if (countries.isNotEmpty) {
              return ListView.builder(
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  final country = countries[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          country.loc,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Total Confirmed: ${country.totalConfirmed}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              // Show a message or widget when there are no countries
              return const Center(
                child: Text('No countries data available'),
              );
            }
          } else {
            // Handle other states if needed
            return Container();
          }
        },
      ),
    );
  }
}