import 'package:specialico/index.dart';

class DescriptionSkelton extends StatelessWidget {
  const DescriptionSkelton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 14,
          color: Colors.grey.withOpacity(0.5),
        ),
        const SizedBox(height: 8.0),
        Container(
          width: double.infinity,
          height: 14,
          color: Colors.grey.withOpacity(0.5),
        ),
        const SizedBox(height: 8.0),
        Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 14,
          color: Colors.grey.withOpacity(0.5),
        ),
      ],
    );
  }
}
