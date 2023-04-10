import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BookItem extends StatelessWidget {
  final url;
  final name;
  final author;
  final cost;
  BookItem({this.url, this.author, this.cost, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 2),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            GridTile(
              child: Image.network(url, fit: BoxFit.fill),
              footer: GridTileBar(
                backgroundColor: Colors.white,
                leading: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 5.w,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                    Text(
                      author,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 3.w,
                      ),
                    ),
                    Text(
                      '\$${cost}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 4.w,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                // trailing: Text('djgdjg'),
              ),
            ),
            Positioned(
              right: 5,
              top: 5,
              child: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.white,
                  child: Center(
                    child: Icon(
                      Icons.favorite_border_rounded,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
