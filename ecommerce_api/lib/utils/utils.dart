import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Utils{

 static cachedImageNetwork(String imageURL,double height,double width){
   return CachedNetworkImage(
     imageUrl: imageURL,
     height: height,
     width: width,
     placeholder: (context, url) => Center(child: CircularProgressIndicator()),
     errorWidget: (context, url, error) => Icon(Icons.error),
   );
 }
}