import 'package:blood_donation/controller/location_controller.dart';
import 'package:blood_donation/controller/reqst_blood_controller.dart';
import 'package:blood_donation/utility/const.dart';
import 'package:blood_donation/widget/subheading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RqstBldScreen extends StatelessWidget {
  var bloodgrouplist = ["A+", "B+", "0+", "AB+", "A-", "B-", "0-", "AB-"];
  String defaultvalue="loading";
  RqstBldScreen({super.key});

  LocationController loc_controller = Get.put(LocationController());
  RequestBlood_Controller rqst_controller = Get.put(RequestBlood_Controller());

  @override
  Widget build(BuildContext context) {
    loc_controller.onInit;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.error_outline_outlined))
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 17,
            )),
        title: Column(
          children: [
            Text(
              "Your Location",
              style: TextStyle(fontSize: 14),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  color: bdprimaryclr,
                ),
                Obx(() =>  Text(
                  loc_controller.adress.value,
                  style: TextStyle(fontSize: 18),
                ),),
               
               
              ],
            )
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          subHeading(headtxt: "Blood Type"),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              height: 220,
              child: GridView.builder(
                  itemCount: 8,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 25,
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          rqst_controller.selectBlood(index,bloodgrouplist);
                        },
                        child: Obx(
                          () => Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: rqst_controller.selectedIndex == index
                                    ? bdprimaryclr
                                    : whiteclr,
                                border: Border.all(color:rqst_controller.selectedIndex.value==index?whiteclr: bdprimaryclr),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              bloodgrouplist[index],
                              style: GoogleFonts.prompt(
                                  color: rqst_controller.selectedIndex.value==index?whiteclr:bdprimaryclr,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ));
                  }),
            ),
          ),
          subHeading(headtxt: "Near From You"),
          
        ],
      ),
    );
  }
}
