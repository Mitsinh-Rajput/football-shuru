
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_shuru/views/base/custom_image.dart';


class PlayerListScreen extends StatefulWidget {
  const PlayerListScreen({super.key});

  @override
  State<PlayerListScreen> createState() => _PlayerListScreenState();
}

class _PlayerListScreenState extends State<PlayerListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
        titleSpacing: 0.0,
        title:  Transform(
          // you can forcefully translate values left side using Transform
          transform:  Matrix4.translationValues(-20.0, 0.0, 0.0),
          child: RichText(
            text: TextSpan(
                text: "List of players",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,),
                children: [
                  TextSpan(
                    text: "\nYear 2024",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,),
                  ),
                ]
            ),
          )
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: const Icon(
                color: Colors.black,
                Icons.close)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context,index){
          return Column(
            children: [
              ListTile(
                leading: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          offset: const Offset(0, 4),
                          color: Colors.black.withOpacity(0.25),
                        ),
                      ]
                  ),
                  child: const CustomImage(
                    radius: 50,
                    path: "https://s3-alpha-sig.figma.com/img/edbc/827e/ddd9eb8d1b1f8a34ea7de88255893a11?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=L33otg20rmNDjbv2godV47V2VKD4bEukiEVlI0FAICF2D9vNJwX7HfLaWAJ1vfLzFeMPrMqP4lIpanRlxkvL6ayojKlAqsfWlzGzAKsg0NfGPjDrYmpnIsnvBOC3pQh8yy2HwEABL9tuszzm3vQPqW4WM2THrgjgyEu4SVPv0xA12IpmPpSUU2Gr5N2MLAloiEm43dNrdxbwWbVWqnfusKUybziAqaN89X4yECYFEQTSF5lwj1zx~RnOYf5-O48vKnh3QdgjGeoD2paa7mMYC8d9IPsC3vKOMV9~pBcKjz3uYYyygvqTbTB7Lw7-0jm259hn~BVtt5C-YkpAeFxPvA__",),
                ),
              title: Text("Ground Member",style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 8,
                        fontWeight: FontWeight.w400
                      ),),
                subtitle: Text("Albert Flores, 26 age",style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w700
                ),),
                trailing: Text("Soccer",style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 8,
                          fontWeight: FontWeight.w400,
                  color: const Color(0xFFFF9100),
                        ),),
              ),
              const Divider(
                color: Color(0xFFE0E0E0),
              ),
            ],
          );
        }),
      ),
    );
  }
}
