import 'package:aptovegan/src/widgets/report_product.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatefulWidget {
  @override
  _ProductTileState createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  bool _liked = false;
  final _buttonTextStyle = TextStyle(fontSize: 12, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image(
                    width: 100,
                    height: 100,
                    image: NetworkImage('https://i.pinimg.com/originals/dc/eb/9d/dceb9d0b8f7bfbc078b4bf4d54e6bd0d.jpg'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Cerezas al cognac', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                      SizedBox(height: 10),
                      Text('Bariloche', style: TextStyle(fontWeight: FontWeight.w300)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Divider(
              height: 0,
              indent: 10,
              endIndent: 10,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () => setState(() => _liked = !_liked),
                  icon: Icon(_liked ? Icons.favorite : Icons.favorite_border, color: Colors.red),
                  label: Text(_liked ? 'Quitar de favoritos' : 'Agregar a favoritos', style: _buttonTextStyle),
                ),
                TextButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (_) => ReportProduct(),
                  ),
                  child: Text('Reportar', style: _buttonTextStyle),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
