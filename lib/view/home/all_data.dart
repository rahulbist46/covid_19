part of 'home_screen.dart';

class AllData extends StatelessWidget {

   const AllData({super.key, });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        BlocBuilder<UnofficialSummeryBloc, UnofficialSummeryState>(
          builder: (context, unofficialSummeryState) {
            if (unofficialSummeryState is UnofficialSummeryLoading) {
              return const SpinKitFadingCircle(
                color: Colors.white,
                size: 40,
              );
            } else if (unofficialSummeryState is UnofficialSummerySuccess) {
              final unofficialSummaryModal = unofficialSummeryState.unofficialSummaryModal;

              return Card(
                child: Column(
                  children:  [
                    ReusableRow(
                      title: 'Total',
                      value: unofficialSummaryModal.total.toString(),
                    ),
                    ReusableRow(
                      title: 'Deaths',
                      value: unofficialSummaryModal.deaths.toString(),
                    ),
                    ReusableRow(
                      title: 'Recovered',
                      value: unofficialSummaryModal.recovered.toString(),
                    ),
                    ReusableRow(
                      title: 'Active',
                      value: unofficialSummaryModal.active.toString(),
                    ),

                  ],
                ),
              );
            }
            // Handle other states if needed
            return Container();
          },
        ),
      ],
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String title;
  final String value;
  const ReusableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          const SizedBox(height: 5),
          const Divider(),
        ],
      ),
    );
  }
}