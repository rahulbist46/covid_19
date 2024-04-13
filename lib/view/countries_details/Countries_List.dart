part of 'country_screen.dart';

class CountriesList extends StatelessWidget {
  const CountriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CountriesBloc, CountriesState>(
        builder: (context, state) {
          if (state is CountriesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CountriesSuccess) {
            final countries = state.countriesModal;
            if (countries.isNotEmpty) {
              return ListView.builder(
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  final country = countries[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigate to CountryDetailsScreen and pass the selected country as argument
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CountryDetailsScreen(country: country),
                        ),
                      );
                    },
                    child: Container(
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
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text('No countries data available'),
              );
            }
          } else if (state is CountriesError) {
            return Center(
              child: Text('Error: ${state.casesTimeError}'),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}