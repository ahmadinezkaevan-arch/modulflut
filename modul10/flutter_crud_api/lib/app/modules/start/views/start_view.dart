import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_crud_api/app/utils/app_color.dart';
import 'package:flutter_crud_api/app/widgets/auto_load.dart';
import 'package:flutter_crud_api/app/routes/app_pages.dart';
import '../controllers/start_controller.dart';

class StartView extends GetView<StartController> {
  const StartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StartController>(
      builder: (controller) => AutoLoad(
        onInit: () async {
          await new Future.delayed(const Duration(seconds: 3));
          await controller.autoLogin();
        },
        child: Scaffold(
          body: GetBuilder<StartController>(
            builder: (controller) => controller.startScreen == false
                ? Container(
                    color: AppColor.primary,
                    width: double.infinity,
                    height: double.infinity,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        Icon(
                          Icons.account_tree_outlined,
                          size: 48,
                          color: Colors.white,
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Post app",
                          style: GoogleFonts.tajawal(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffffca54),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Column(
                            children: [
                              Text(
                                "Belajar Bersama",
                                style: GoogleFonts.cairo(color: Colors.white),

                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Building the Nation Through Education",
                                style: GoogleFonts.cairo(color: Colors.white),

                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Text(
                          "Hummasoft. V1",
                          style: GoogleFonts.cairo(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                   )
                 : (controller.loginScreen == false 
                     ? SizedBox.expand(
                         child: Container(
                           color: AppColor.primary,
                           alignment: Alignment.center,
                           child: CircularProgressIndicator(color: Colors.white),
                         ),
                       )
                     : GestureDetector(
                         onTap: () {
                           Get.toNamed(Routes.LOGIN);
                         },
                         child: Container(
                           color: Colors.white,
                           alignment: Alignment.center,
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Icon(Icons.error_outline, size: 64, color: Color(0xffffca54)),
                               SizedBox(height: 20),
                               Text(
                                 'Validasi Token Gagal',
                                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                               ),
                               SizedBox(height: 10),
                               Text(
                                 'Silakan login kembali',
                                 style: TextStyle(fontSize: 14, color: Colors.grey),
                               ),
                               SizedBox(height: 30),
                               ElevatedButton(
                                 onPressed: () {
                                   Get.toNamed(Routes.LOGIN);
                                 },
                                 child: Text('Pergi ke Login'),
                               ),
                             ],
                           ),
                         ),
                       )),
          ),
        ),
      ),
    );
  }
}
