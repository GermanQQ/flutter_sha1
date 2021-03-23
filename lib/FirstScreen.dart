

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}



// class FirstScreen extends StatefulWidget {
//   @override
//   createState() => FirstScreenState();
// }
//
//
// class FirstScreenState extends State<FirstScreen> {
//   var arr = [];
//
//   TextEditingController codeController = new TextEditingController();
//   TextEditingController descriptionController = new TextEditingController();
//   TextEditingController commentController = new TextEditingController();
//
//   bool _isVisible = false;
//
//   bool _isVisibleComment = false;
//
//   String comment = '';
//
//   @override
//   Widget build(BuildContext context) {
//     //Отрисовывает виджет один раз
//     return MaterialApp(
//         title: "Товари",
//         home: Scaffold(
//           appBar: AppBar(
//             title: Text("Товари"),
//             centerTitle: true,
//             backgroundColor: Colors.black,
//           ),
//           body: Column(
//             children: [
//               Stack(
//                 children: [
//                   Visibility(
//                     visible: _isVisibleComment,
//                     child: Container(
//                       margin: EdgeInsets.fromLTRB(60, 10, 60, 10),
//                       padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: Colors.yellow[200]),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               IconButton(
//                                   iconSize: 20,
//                                   icon: Icon(Icons.close),
//                                   onPressed: () => setState(() {
//                                     _isVisibleComment = !_isVisibleComment;
//                                     commentController.text = '';
//                                     comment = '';
//                                   })),
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Text(
//                                 '$comment',
//                                 style: TextStyle(fontSize: 20),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           TextField(
//                             controller: commentController,
//                             decoration: InputDecoration(
//                               hintText: 'Коментар до товару',
//                               fillColor: Colors.white,
//                               filled: true,
//                               border: OutlineInputBorder(),
//                             ),
//                             maxLines: 2,
//                           ),
//                           IconButton(
//                               alignment: Alignment.topRight,
//                               icon: Icon(Icons.add),
//                               onPressed: () => setState(() {
//                                 comment = commentController.text;
//                                 commentController.text = '';
//                               })),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               Padding(
//                 padding: EdgeInsets.fromLTRB(80, 20, 80, 20),
//                 child: Visibility(
//                   visible: _isVisible,
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color: Colors.green,
//                         borderRadius: BorderRadius.circular(10)),
//                     padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             IconButton(
//                                 alignment: Alignment.topRight,
//                                 icon: Icon(Icons.close),
//                                 onPressed: () => setState(() {
//                                   _isVisible = !_isVisible;
//                                 })),
//                           ],
//                         ),
//                         TextField(
//                           controller: codeController,
//                           decoration: InputDecoration(
//                             hintText: '224322345223',
//                             labelText: 'Штрих-код:',
//                             fillColor: Colors.white,
//                             filled: true,
//                             border: OutlineInputBorder(),
//                           ),
//                           keyboardType: TextInputType.number,
//                           maxLength: 12,
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         TextField(
//                           controller: descriptionController,
//                           decoration: InputDecoration(
//                             hintText: 'Молоко, "Молокія", 2%',
//                             labelText: 'Опис товару:',
//                             fillColor: Colors.white,
//                             filled: true,
//                             border: OutlineInputBorder(),
//                           ),
//                           maxLength: 30,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             IconButton(
//                                 iconSize: 35,
//                                 icon: Icon(Icons.add_circle_outline),
//                                 onPressed: () => setState(() {
//                                   if (codeController.text.length > 1 &&
//                                       descriptionController.text.length >
//                                           1) {
//                                     var tovar = <String, String>{
//                                       'code': '${codeController.text}',
//                                       'description':
//                                       '${descriptionController.text}',
//                                       'comment': '${commentController.text}',
//                                     };
//                                     arr.add(tovar);
//                                     codeController.text = '';
//                                     descriptionController.text = '';
//                                   }
//                                   _isVisible = !_isVisible;
//                                 })),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   child: ListView.builder(
//                     padding: EdgeInsets.all(10),
//                     itemCount: arr.length,
//                     itemBuilder: (_, index) => Card(
//                       child: Padding(
//                         padding: EdgeInsets.all(15),
//                         child: ListTile(
//                           title: Text(
//                             'Штрих-код:',
//                             style: TextStyle(
//                                 fontSize: 22, fontWeight: FontWeight.bold),
//                           ),
//                           subtitle: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 arr[index]['code'],
//                                 style: TextStyle(fontSize: 20),
//                               ),
//                               Text(
//                                 arr[index]['description'],
//                                 style: TextStyle(
//                                     fontSize: 18, color: Colors.red[200]),
//                               ),
//                             ],
//                           ),
//                           onTap: () => setState(() {
//                             _isVisibleComment = !_isVisibleComment;
//                             _isVisible = false;
//                             comment = '';
//                           }),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           floatingActionButton: FloatingActionButton(
//             child: Text(
//               '+',
//               style: TextStyle(color: Colors.black, fontSize: 35),
//             ),
//             backgroundColor: Colors.green,
//             onPressed: () {
//               setState(() {
//                 _isVisible = !_isVisible;
//                 _isVisibleComment = false;
//               });
//             },
//           ),
//         ));
//   }
// }

