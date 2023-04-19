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
          borderRadius: BorderRadius.all(Radius.circular(3.w))),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            GridTile(
              child: Image.network(url, fit: BoxFit.fill),
              footer: Container(
                height: 6.5.h,
                child: GridTileBar(
                  backgroundColor: Colors.white,
                  leading: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 2.3.h,
                        width: 35.w,
                        child: Text(
                          name,
                          style: TextStyle(
                            // overflow: TextOverflow.ellipsis,
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                          // textAlign: TextAlign.center,
                          // softWrap: true,\
                          // overflow: TextOverflow.fade,
                        ),
                      ),
                      Container(
                        height: 1.5.h,
                        width: 35.w,
                        child: Text(
                          author,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 0.1.h,
                      ),
                      Container(
                        height: 2.h,
                        width: 35.w,
                        child: Text(
                          '\$${cost}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // trailing: Text('djgdjg'),
                ),
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
