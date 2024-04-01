import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(1, 2),
            colors: [Color(0xFF3B9EE6), Color(0x82FEFEFE)],
          ),
        ),
        child: Center(
          child: Container(
            width: 400.0,
            child: ListView(
              children: [
                SizedBox(height: 20.0), // Spasi sebelum gambar
                Image.asset( // Tambahkan gambar di atas inputan
                  'assets/images/equalreads-high-resolution-logo-transparent.png', // Sesuaikan dengan path gambar Anda
                  height: 277.0,
                  width: 257.0,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 50.0),
                Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align text and input fields to the left
                    children: [
                      Text(
                        'USERNAME',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: controller.usernameController,
                        textAlign: TextAlign.left, // Align text input to the left
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white.withOpacity(0.55)),
                            borderRadius: BorderRadius.circular(10.15),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white.withOpacity(0.55)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "username tidak boleh kosoeng";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 12.5),
                      Text(
                        'EMAIL',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: controller.emailController,
                        textAlign: TextAlign.left, // Align text input to the left
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white.withOpacity(0.55)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white.withOpacity(0.55)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email tidak boleh kosong";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 12.5),
                      Text(
                        'PASSWORD',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: controller.passwordController,
                        textAlign: TextAlign.left, // Align text input to the left
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white.withOpacity(0.55)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white.withOpacity(0.55)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password tidak boleh kosong";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 27.0),
                      ElevatedButton(
                        onPressed: () {
                          controller.registerpost();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFE52222), // Red color
                          minimumSize: Size(double.infinity, 50), // Set the width to double.infinity
                        ),
                        child: Text("Sign Up"),
                      ),
                      SizedBox(height: 10.0),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.LOGIN);
                        },
                        child: Text(
                          'Do you have an account? Sign In',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
