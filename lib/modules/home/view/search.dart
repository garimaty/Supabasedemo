
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:supabase_demo/modules/home/controller/home_page_controller.dart';


class CustomSearchDelegate extends SearchDelegate{
  
  //first to clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {

    return [

      IconButton(
          onPressed: (){
            query='';
          },
          icon: const Icon(Icons.clear)
      )
    ];
  }

  //second to pop up search menu
  @override
  Widget? buildLeading(BuildContext context) {
   return IconButton(
       onPressed: (){
         close(context,null);
       }, 
       icon: const Icon(Icons.arrow_back)
   );
  }

  // to show query result
  @override
  Widget buildResults(BuildContext context) {

    Get.find<HomePageController>().searchData(query);
   var matchQuery = Get.find<HomePageController>().searchDataList;
   return
     Obx(()=>

    DataTable(
       border: TableBorder.all(color: Colors.orange),

       columns: const [
         DataColumn(label: Text("Id")),
         DataColumn(label: Text("Name")),
         DataColumn(label: Text("PhnNo")),
         DataColumn(label: Text("FName")),
         DataColumn(label: Text("Address"))
       ],
       rows: List<DataRow>.generate(matchQuery.length, (index) =>DataRow(cells: [
         DataCell(Text("${matchQuery[index].id}")),
         DataCell(Text("${matchQuery[index].name}}")),
         DataCell(Text("${matchQuery[index].phnNumber}")),
         DataCell(Text("${matchQuery[index].fName}")),
         DataCell(Text("${matchQuery[index].address}"))
       ]))
   )
    ,);
  }

  //show quering process at run time
  @override
  Widget buildSuggestions(BuildContext context)  {


  Get.find<HomePageController>().searchData(query);
     var matchQuery = Get.find<HomePageController>().searchDataList;
    return
      Obx(()=>

    Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.yellow[100]
      ),
       padding: const EdgeInsets.all(12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
            border: TableBorder.all(color: Colors.orange),
            columns: const [
              DataColumn(label: Text("Id")),
              DataColumn(label: Text("Name")),
              DataColumn(label: Text("PhnNo")),
              DataColumn(label: Text("FName")),
              DataColumn(label: Text("Address"))
            ],
            rows: List<DataRow>.generate(matchQuery.length, (index) =>DataRow(cells: [
              DataCell(Text("${matchQuery[index].id}")),
              DataCell(Text("${matchQuery[index].name}")),
              DataCell(Text("${matchQuery[index].phnNumber}")),
              DataCell(Text("${matchQuery[index].fName}")),
              DataCell(Text("${matchQuery[index].address}"))
            ]))
        ),
      ),
    )
    ,);
  }
  
}