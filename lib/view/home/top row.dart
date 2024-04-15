part of 'home_screen.dart';

class HomeTopRow extends StatefulWidget {
  const HomeTopRow({super.key});

  @override
  State<HomeTopRow> createState() => _HomeTopRowState();
}

class _HomeTopRowState extends State<HomeTopRow> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(
            children: [
              Text("Hey '",style: TextStyle(fontSize: 12,)),
              SizedBox(width: 2,),
              Text('Rahul',style: TextStyle(fontSize: 14,color: Colors.blueAccent),),
            ],
          ),
            Text('Welcome Back',style: TextStyle(fontSize: 20)),

          ],
        ),


        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage('https://images.pexels.com/photos/53581/bald-eagles-bald-eagle-bird-of-prey-adler-53581.jpeg?auto=compress&cs=tinysrgb&w=600'
          )        ),
      ],
    );
  }
}
