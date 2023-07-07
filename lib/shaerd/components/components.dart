// ignore_for_file: non_constant_identifier_names, overridden_fields, avoid_types_as_parameter_names


import 'package:flutter/material.dart';

Widget BuildArticalItem(articles, [BuildContext? context]) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image:  DecorationImage(
                    image: NetworkImage(
                      '${articles['urlToImage'] ??'https://sis.gov.eg/Content/Upload/slider/520161814523505.jpg'}',
                    ),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            // ignore: sized_box_for_whitespace
            child: Container(
              height: 120.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${articles["title"]}',
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${articles["publishedAt"]}',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
          ),
       
       
        ],
      ),
    );


class CustomDivider extends Divider {
  @override
  final double height;
  @override
  final Color color;

  const CustomDivider({super.key, this.height = 1.0, this.color = Colors.grey})
      : super(height: height, color: color);
}


  Future  navigatto (context,Widget)=>Navigator.push(
    context, MaterialPageRoute(builder: (context)=>Widget));

