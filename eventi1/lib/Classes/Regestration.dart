// ignore_for_file: file_names

import 'package:eventi1/Classes/Places/Chalet.dart';
import 'package:eventi1/Classes/Places/Place.dart';
import 'package:eventi1/Classes/Places/Wadding_hall.dart';
import 'package:flutter/material.dart';

class Regestraion with ChangeNotifier {
  final List<Place> populer = [
    WaddingHall(
        "WaddingHall_1",
        4.5,
        "Riyadh, Aqiq",
        "The room is located in the center of Paris. "
            "There is a terrace on site."
            "The room is located in the center of Paris. "
            "There is a terrace on site."
            "The room is located in the center of Paris. "
            "There is a terrace on site.",
        '125.25',
        "https://firebasestorage.googleapis.com/v0/b/eventi-9e670.appspot.com/o/hall1.jpg?alt=media&token=455d2bce-cc3d-43e4-ae22-a800678515f7",
        "123",
        <String>[
          "https://firebasestorage.googleapis.com/v0/b/eventi-9e670.appspot.com/o/hall1.jpg?alt=media&token=455d2bce-cc3d-43e4-ae22-a800678515f7",
          "http://go.microsoft.com/fwlink/p/?LinkId=255141",
          "https://cdn.pixabay.com/photo/2021/08/27/01/33/bedroom-6577523_960_720.jpg",
        ],
        '',
        'WeddingHall'),
    WaddingHall(
        "WaddingHall_1",
        4.5,
        "Riyadh, Aqiq",
        "The room is located in the center of Paris. "
            "There is a terrace on site."
            "The room is located in the center of Paris. "
            "There is a terrace on site."
            "The room is located in the center of Paris. "
            "There is a terrace on site.",
        '125.25',
        "https://cdn.pixabay.com/photo/2014/12/27/14/37/living-room-581073__340.jpg",
        "123",
        <String>[
          "https://firebasestorage.googleapis.com/v0/b/eventi-9e670.appspot.com/o/hall2.jpg?alt=media&token=6ec4c929-2129-4ee9-a618-1d1c1b43a11f",
          "https://cdn.pixabay.com/photo/2019/05/28/00/15/indoors-4234071_960_720.jpg",
          "https://firebasestorage.googleapis.com/v0/b/eventi-9e670.appspot.com/o/hall1.jpg?alt=media&token=455d2bce-cc3d-43e4-ae22-a800678515f7",
        ],
        '',
        'WeddingHall'),
    WaddingHall(
        "WaddingHall_1",
        4.5,
        "Riyadh, Aqiq",
        "The room is located in the center of Paris. "
            "There is a terrace on site."
            "The room is located in the center of Paris. "
            "There is a terrace on site."
            "The room is located in the center of Paris. "
            "There is a terrace on site.",
        '125.25',
        "https://firebasestorage.googleapis.com/v0/b/eventi-9e670.appspot.com/o/hall1.jpg?alt=media&token=455d2bce-cc3d-43e4-ae22-a800678515f7",
        "123",
        <String>[
          "https://cdn.pixabay.com/photo/2016/11/18/22/21/restaurant-1837150_960_720.jpg",
          "https://firebasestorage.googleapis.com/v0/b/eventi-9e670.appspot.com/o/hall1.jpg?alt=media&token=455d2bce-cc3d-43e4-ae22-a800678515f7",
          "https://firebasestorage.googleapis.com/v0/b/eventi-9e670.appspot.com/o/hall2.jpg?alt=media&token=6ec4c929-2129-4ee9-a618-1d1c1b43a11f",
        
        ],
        '',
        'WeddingHall'),
    WaddingHall(
        "WaddingHall_1",
        4.5,
        "Riyadh, Aqiq",
        "The room is located in the center of Paris. "
            "There is a terrace on site."
            "The room is located in the center of Paris. "
            "There is a terrace on site."
            "The room is located in the center of Paris. "
            "There is a terrace on site.",
        '125.25',
        "https://firebasestorage.googleapis.com/v0/b/eventi-9e670.appspot.com/o/hall2.jpg?alt=media&token=6ec4c929-2129-4ee9-a618-1d1c1b43a11f",
        "123",
        <String>[
          
          "https://firebasestorage.googleapis.com/v0/b/eventi-9e670.appspot.com/o/hall1.jpg?alt=media&token=455d2bce-cc3d-43e4-ae22-a800678515f7",
          "https://cdn.pixabay.com/photo/2016/11/18/22/21/restaurant-1837150_960_720.jpg",
        ],
        '',
        'WeddingHall'),
   
  ];
  final List<Place> featured = [
    WaddingHall(
        "WaddingHall_1",
        4.5,
        "Riyadh, Aqiq",
        "The room is located in the center of Paris. "
            "There is a terrace on site."
            "The room is located in the center of Paris. "
            "There is a terrace on site."
            "The room is located in the center of Paris. "
            "There is a terrace on site.",
        '125.25',
        "https://firebasestorage.googleapis.com/v0/b/eventi-9e670.appspot.com/o/hall2.jpg?alt=media&token=6ec4c929-2129-4ee9-a618-1d1c1b43a11f",
        "123",
        <String>[
          "https://cdn.pixabay.com/photo/2016/11/18/22/21/restaurant-1837150_960_720.jpg",
          "https://firebasestorage.googleapis.com/v0/b/eventi-9e670.appspot.com/o/hall2.jpg?alt=media&token=6ec4c929-2129-4ee9-a618-1d1c1b43a11f",
          "https://cdn.pixabay.com/photo/2021/08/27/01/33/bedroom-6577523_960_720.jpg",
          "https://firebasestorage.googleapis.com/v0/b/eventi-9e670.appspot.com/o/hall2.jpg?alt=media&token=6ec4c929-2129-4ee9-a618-1d1c1b43a11f",
        ],
        '',
        'WeddingHall'),
    WaddingHall(
        "WaddingHall_1",
        4.5,
        "Riyadh, Aqiq",
        "The room is located in the center of Paris. "
            "There is a terrace on site."
            "The room is located in the center of Paris. "
            "There is a terrace on site."
            "The room is located in the center of Paris. "
            "There is a terrace on site.",
        '125.25',
        "https://cdn.pixabay.com/photo/2014/12/27/14/37/living-room-581073__340.jpg",
        "123",
        <String>[
          "https://cdn.pixabay.com/photo/2016/11/18/22/21/restaurant-1837150_960_720.jpg",
          "https://cdn.pixabay.com/photo/2019/05/28/00/15/indoors-4234071_960_720.jpg",
          "https://firebasestorage.googleapis.com/v0/b/eventi-9e670.appspot.com/o/hall2.jpg?alt=media&token=6ec4c929-2129-4ee9-a618-1d1c1b43a11f",
         
        ],
        '',
        'WeddingHall'),
    WaddingHall(
        "WaddingHall_1",
        4.5,
        "Riyadh, Aqiq",
        "The room is located in the center of Paris. "
            "There is a terrace on site."
            "The room is located in the center of Paris. "
            "There is a terrace on site."
            "The room is located in the center of Paris. "
            "There is a terrace on site.",
        '125.25',
        "https://firebasestorage.googleapis.com/v0/b/eventi-9e670.appspot.com/o/hall2.jpg?alt=media&token=6ec4c929-2129-4ee9-a618-1d1c1b43a11f",
        "123",
        <String>[
          "https://cdn.pixabay.com/photo/2016/11/18/22/21/restaurant-1837150_960_720.jpg",
          "https://firebasestorage.googleapis.com/v0/b/eventi-9e670.appspot.com/o/hall2.jpg?alt=media&token=6ec4c929-2129-4ee9-a618-1d1c1b43a11f",

        ],
        '',
        'WeddingHall'),
    WaddingHall(
        "WaddingHall_1",
        4.5,
        "Riyadh, Aqiq",
        "The room is located in the center of Paris. "
            "There is a terrace on site."
            "The room is located in the center of Paris. "
            "There is a terrace on site."
            "The room is located in the center of Paris. "
            "There is a terrace on site.",
        '125.25',
        "https://cdn.pixabay.com/photo/2014/12/27/14/37/living-room-581073__340.jpg",
        "123",
        <String>[
          "https://cdn.pixabay.com/photo/2016/11/18/22/21/restaurant-1837150_960_720.jpg",

          "https://cdn.pixabay.com/photo/2021/08/27/01/33/bedroom-6577523_960_720.jpg",
          "https://cdn.pixabay.com/photo/2016/11/18/22/21/restaurant-1837150_960_720.jpg",
        ],
        '',
        'WeddingHall'),
    WaddingHall(
        "WaddingHall_1",
        4.5,
        "Riyadh, Aqiq",
        "The room is located in the center of Paris. "
            "There is a terrace on site."
            "The room is located in the center of Paris. "
            "There is a terrace on site."
            "The room is located in the center of Paris. "
            "There is a terrace on site.",
        '125.25',
        "https://cdn.pixabay.com/photo/2014/12/27/14/37/living-room-581073__340.jpg",
        "123",
        <String>[
          "https://cdn.pixabay.com/photo/2016/11/18/22/21/restaurant-1837150_960_720.jpg",
          "https://cdn.pixabay.com/photo/2019/05/28/00/15/indoors-4234071_960_720.jpg",
          "https://cdn.pixabay.com/photo/2021/08/27/01/33/bedroom-6577523_960_720.jpg",
          "https://cdn.pixabay.com/photo/2016/11/18/22/21/restaurant-1837150_960_720.jpg",
        ],
        '',
        'WeddingHall'),
  ];
  List<Chalet> chalets = <Chalet>[
    Chalet(
        "WaddingHall_1",
        4.5,
        "Riyadh, Aqiq",
        "The room is located in the center of Paris. "
            "There is a terrace on site."
            "The room is located in the center of Paris. "
            "There is a terrace on site."
            "The room is located in the center of Paris. "
            "There is a terrace on site.",
        '125.25',
        "https://firebasestorage.googleapis.com/v0/b/eventi-9e670.appspot.com/o/hall4.jpg?alt=media&token=3410cd41-3cbe-4601-aebb-e07bd3394c39",
        "123",
        <String>[
          "https://firebasestorage.googleapis.com/v0/b/eventi-9e670.appspot.com/o/rest2.jpg?alt=media&token=b2cf6241-7e41-49ff-86b0-5c904879655b",
          "https://cdn.pixabay.com/photo/2019/05/28/00/15/indoors-4234071_960_720.jpg",
          "https://cdn.pixabay.com/photo/2021/08/27/01/33/bedroom-6577523_960_720.jpg",
          "https://firebasestorage.googleapis.com/v0/b/eventi-9e670.appspot.com/o/rest2.jpg?alt=media&token=b2cf6241-7e41-49ff-86b0-5c904879655b",
        ],
        '',
        'Chalet'),
    Chalet(
        "WaddingHall_1",
        4.5,
        "Riyadh, Aqiq",
        "The room is located in the center of Paris. "
            "There is a terrace on site."
            "The room is located in the center of Paris. "
            "There is a terrace on site."
            "The room is located in the center of Paris. "
            "There is a terrace on site.",
        '125.25',
        "https://firebasestorage.googleapis.com/v0/b/eventi-9e670.appspot.com/o/rest2.jpg?alt=media&token=b2cf6241-7e41-49ff-86b0-5c904879655b",
        "123",
        <String>[
          "https://cdn.pixabay.com/photo/2016/11/18/22/21/restaurant-1837150_960_720.jpg",
          "https://firebasestorage.googleapis.com/v0/b/eventi-9e670.appspot.com/o/rest2.jpg?alt=media&token=b2cf6241-7e41-49ff-86b0-5c904879655b",
          "https://cdn.pixabay.com/photo/2021/08/27/01/33/bedroom-6577523_960_720.jpg",

        ],
        '',
        'Chalet'),
  ];
  List<WaddingHall> waddingHalls = <WaddingHall>[
    WaddingHall(
        "WaddingHall_1",
        4.5,
        "Riyadh, Aqiq",
        "The room is located in the center of Paris. "
            "There is a terrace on site."
            "The room is located in the center of Paris. "
            "There is a terrace on site."
            "The room is located in the center of Paris. "
            "There is a terrace on site.",
        '125.25',
        "https://firebasestorage.googleapis.com/v0/b/eventi-9e670.appspot.com/o/hall4.jpg?alt=media&token=3410cd41-3cbe-4601-aebb-e07bd3394c39",
        "123",
        <String>[
          "https://cdn.pixabay.com/photo/2016/11/18/22/21/restaurant-1837150_960_720.jpg",
          "https://cdn.pixabay.com/photo/2019/05/28/00/15/indoors-4234071_960_720.jpg",
          "https://firebasestorage.googleapis.com/v0/b/eventi-9e670.appspot.com/o/rest2.jpg?alt=media&token=b2cf6241-7e41-49ff-86b0-5c904879655b",
          
        ],
        '',
        'WeddingHall'),
    WaddingHall(
        "WaddingHall_1",
        4.5,
        "Riyadh, Aqiq",
        "The room is located in the center of Paris. "
            "There is a terrace on site."
            "The room is located in the center of Paris. "
            "There is a terrace on site."
            "The room is located in the center of Paris. "
            "There is a terrace on site.",
        '125.25',
        "https://firebasestorage.googleapis.com/v0/b/eventi-9e670.appspot.com/o/hall3.jpg?alt=media&token=5e2aab43-91e4-4246-9b02-d3ebf4a1d4f9",
        "123",
        <String>[
          "https://firebasestorage.googleapis.com/v0/b/eventi-9e670.appspot.com/o/rest2.jpg?alt=media&token=b2cf6241-7e41-49ff-86b0-5c904879655b",
          "https://cdn.pixabay.com/photo/2019/05/28/00/15/indoors-4234071_960_720.jpg",
        ],
        '',
        'WeddingHall'),
    WaddingHall(
        "WaddingHall_1",
        4.5,
        "Riyadh, Aqiq",
        "The room is located in the center of Paris. "
            "There is a terrace on site."
            "The room is located in the center of Paris. "
            "There is a terrace on site."
            "The room is located in the center of Paris. "
            "There is a terrace on site.",
        '125.25',
        "https://firebasestorage.googleapis.com/v0/b/eventi-9e670.appspot.com/o/rest2.jpg?alt=media&token=b2cf6241-7e41-49ff-86b0-5c904879655b",
        "123",
        <String>[
          "https://cdn.pixabay.com/photo/2016/11/18/22/21/restaurant-1837150_960_720.jpg",
          "https://firebasestorage.googleapis.com/v0/b/eventi-9e670.appspot.com/o/rest2.jpg?alt=media&token=b2cf6241-7e41-49ff-86b0-5c904879655b",
          "https://cdn.pixabay.com/photo/2021/08/27/01/33/bedroom-6577523_960_720.jpg",
          "https://firebasestorage.googleapis.com/v0/b/eventi-9e670.appspot.com/o/rest2.jpg?alt=media&token=b2cf6241-7e41-49ff-86b0-5c904879655b",
        ],
        '',
        'WeddingHall'),
  ];
  

  // int search(Place p) {
  //   for (int i = 0; i < _places.length; i++) {
  //     if (_places[i].getName.contains(p.getName)) {
  //       return i;
  //     }
  //   }
  //   return -1;
  // }

  // bool addPlace(Place p) {
  //   int index = search(p);
  //   if (index == -1) {
  //     if (p is Chalet) {
  //       _places.add(Chalet.copy(p));
  //     } else if (p is WaddingHall) {
  //       _places.add(WaddingHall.copy(p));
  //     }
  //     notifyListeners();
  //     return true;
  //   }
  //   return false;
  // }

  // bool removePlace(Place p) {
  //   int index = search(p.getName);
  //   if (index == -1) {
  //     return false;
  //   }
  //   if (p is Chalet) {
  //     _places.remove(Chalet.copy(p));
  //   } else if (p is WaddingHall) {
  //     _places.remove(WaddingHall.copy(p));
  //   }
  //   notifyListeners();
  //   return true;
  // }

  // void splitPlace() {
  //   for (int i = 0; i < _places.length; i++) {
  //     if (_places[i] is Chalet) {
  //       chalets.add(Chalet.copy(_places[i]));
  //     } else if (_places[i] is WaddingHall) {
  //       waddingHalls.add(WaddingHall.copy(_places[i]));
  //     }
  //   }
  // }

// //not in place
//   //staple
//   //the worst case time O(n log n) and worst case space O(n)
//   List<int> mergeSort(List<int> array) {
//     // Stop recursion if array contains only one element
//     if (array.length <= 1) {
//       return array;
//     }
//     // split in the middle of the array
//     int splitIndex = array.length ~/ 2;
//     // recursively call merge sort on left and right array
//     List<int> leftArray = mergeSort(array.sublist(0, splitIndex));
//     List<int> rightArray = mergeSort(array.sublist(splitIndex));
//     return merge(leftArray, rightArray);
//   }
//   List<int> merge(left_array, right_array) {
//     List<int> result = [];
//     int? i = 0;
//     int? j = 0;
//     // Search for the smallest eleent in left and right arrays
//     // array and insert it into result
//     // After the loop only one array has remaining elements
//     while (i! < left_array.length && j! < right_array.length) {
//       if (left_array[i] <= right_array[j]) {
//         result.add(left_array[i]);
//         i++;
//       } else {
//         result.add(right_array[j]);
//         j++;
//       }
//     }
//     // Insert remaining elements of left array into result
//     // as long as there are remaining elements
//     while (i! < left_array.length) {
//       result.add(left_array[i]);
//       i++;
//     }
//     // Insert remaining elements of right array into result
//     // as long as there are remaining elements
//     while (j! < right_array.length) {
//       result.add(right_array[j]);
//       j++;
//     }
//     return result;
//   }
}
