import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_demo/modules/home/controller/home_page_controller.dart';


import '../../../route/route_class.dart';

class MyHomePage extends GetView<HomePageController>{
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     drawer:  Drawer(
       backgroundColor: Colors.yellow[100],
       child: ListView(
         padding: EdgeInsets.zero,
         children: [
           DrawerHeader(child: Row(
             children: [
               SizedBox(
                 height: 70,
                 child: ClipRRect(
                     borderRadius: BorderRadius.circular(100),
                     child: Image.asset("assets/images/images.png")),
               ),
const SizedBox(
  width: 10,
),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Hello!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  Text(controller.user.value.substring(0,controller.user.value.indexOf("@")))
                ],
              )


             ],
           )),
        ListTile(
             title: const Text('Documents'),
             onTap: (){
               Get.toNamed(RouteClass.documentScreen);
             },
           ),
           ListTile(
             title: const Text('Log Out'),
             onTap: (){
 controller.logOut();
             },
           )
         ],
       ),
     ),
      backgroundColor: Colors.yellow[100],
      floatingActionButton:  FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
           Get.toNamed(RouteClass.addStudentDetail);
        },
         child: const Icon(Icons.add)
    ),
      appBar: AppBar(

        backgroundColor: Colors.orange,
        title: const Text("Students Data"),
      ),
      body:
      Container(
             padding: const EdgeInsets.all(15),

           child:
           // FutureBuilder(
           //   future: controller.getStudentsListFromDb(),
           //   builder: (context, snapshot) {
           //     print(snapshot.data);
           //     if (snapshot.connectionState == ConnectionState.waiting) {
           //       return const Center(
           //           child: CircularProgressIndicator()
           //       );
           //   }
           //     if(snapshot.hasData && snapshot.data != null){
           //       var data = snapshot.data as List<dynamic>;
           //
           //       return SingleChildScrollView(
           //         scrollDirection: Axis.horizontal,
           //         child: SizedBox(
           //           width: MediaQuery.of(context).size.width,
           //           child:
           //           DataTable(
           //             border: TableBorder.all(),
           //
           //               dividerThickness: 3,
           //               columns: const [
           //                 DataColumn(label: Text("Id")),
           //                 DataColumn(label: Text("Name")),
           //                 DataColumn(label: Text("PhnNo")),
           //                 DataColumn(label: Text("FName")),
           //                 DataColumn(label: Text("Address"))
           //               ],
           //               rows: List<DataRow>.generate(data.length, (index) =>DataRow(cells: [
           //                 DataCell(Text("${data![index].id}")),
           //                 DataCell(Text(data![index].name)),
           //                 DataCell(Text("${data[index].phnNumber}")),
           //                 DataCell(Text(data[index].fName)),
           //                 DataCell(Text(data[index].address))
           //               ]))
           //           ),
           //         ),
           //       );
           //
           //     }
           //     else{
           //       return const Text("no data present");
           //     }
           //   },
           // )


  SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width/0.6,
                  child:
                   Obx(()=>DataTable(
                       border: TableBorder.all(color: Colors.orange),

                       columns: const [
                         DataColumn(label: Text("Id")),
                         DataColumn(label: Text("Name")),
                         DataColumn(label: Text("PhnNo")),
                         DataColumn(label: Text("FName")),
                         DataColumn(label: Text("Address"))
                       ],
                       rows: List<DataRow>.generate(controller.getData.length, (index) =>DataRow(cells: [
                         DataCell(Text("${controller.getData![index].id}")),
                         DataCell(Text("${controller.getData![index].name}")),
                         DataCell(Text("${controller.getData![index].phnNumber}")),
                         DataCell(Text("${controller.getData![index].fName}")),
                         DataCell(Text("${controller.getData![index].address}"))
                       ]))
                   ),)
                ),
              ),


        ),

    );
  }
}


