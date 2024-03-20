
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_shuru/services/input_decoration.dart';
import 'package:football_shuru/views/base/common_button.dart';
import 'package:football_shuru/views/base/custom_image.dart';

import '../../../../services/theme.dart';

class AddGround extends StatefulWidget {
  const AddGround({super.key});

  @override
  State<AddGround> createState() => _AddGroundState();
}

class _AddGroundState extends State<AddGround> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
        leading: Padding(
          padding: const EdgeInsets.all(16),
          child: Image.asset(
            color: Colors.black,
            Assets.imagesArrowLeft,
            height: 24,
            width: 24,
          ),
        ),
        title: Text("Add Ground",style: Theme.of(context).textTheme.titleLarge!.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF40424E)
        ),),
        bottom: PreferredSize(
          preferredSize: Size(size.width, 1),
          child: Container(
            color: Colors.grey.shade200,
            height: 1,
            width: size.width,
          ),
        ),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: CustomDecoration.inputDecoration(
                    icon: const Icon(Icons.location_on_outlined),
                    floating: true,
                    label: "Enter pincode",
                    hint: "Ex. 4143905",
                    hintStyle: const TextStyle(
                        fontSize: 14
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: CustomDecoration.inputDecoration(
                      icon: const Icon(Icons.person_add_alt_1_outlined),
                      floating: true,
                      label: "Name of ground",
                      hint: "Ex. Taloja mallonium ground",
                    hintStyle: const TextStyle(
                      fontSize: 14
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  maxLines: 3,
                  decoration: CustomDecoration.inputDecoration(
                      floating: true,
                      label: "Ground Description",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: CustomDecoration.inputDecoration(
                    icon: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: CustomImage(
                          height: 24,
                          width: 24,
                          path: Assets.imagesMap),
                    ),
                    floating: true,
                    label: "Map Location (Lat/Long)",
                    hint: "4i94.554.44/4933.333.233",
                    hintStyle: const TextStyle(
                        fontSize: 14
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Ground Images",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onTap: (){

                  },
                  enabled: false,
                  decoration: CustomDecoration.inputDecoration(
                    suffix: const Icon(
                        color: Colors.red,
                        Icons.disabled_by_default_outlined),
                    icon: const Icon(Icons.image_outlined),
                    floating: true,
                    label: "Main Images",
                    hint: "logo/image.png",
                    hintStyle: const TextStyle(
                        fontSize: 14
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Icon(Icons.add,color: primaryColor,),
                    const SizedBox(width: 10,),
                    Text("Add Other Images",style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: primaryColor
                    ),),

                  ],
                ),
                Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xFFEBEBEB).withOpacity(0.1)),
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFEBEBEB).withOpacity(0.1)
                          ),
                        ),
                        const Positioned(
                            top: 25,
                            left: 25,
                            child: Icon(Icons.image_outlined,color: Color(0xFFA5A5A5),))
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(Icons.add)
                  ],
                ),
                const SizedBox(height: 50,),
                CustomButton(
                    elevation: 0,
                    radius: 50,
                  color: const Color(0xFF263238),
                    child: Text("Submit",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                      color: Colors.white
                ),),onTap: (){})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
