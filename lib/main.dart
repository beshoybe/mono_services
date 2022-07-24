import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Mono Services',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
      child: HomeScreen(),
    );
  }
}

int currentIndex = 0;
int curoselIndex = 0;
List<String> names = [
  "تصميم المطابخ",
  "تصميم الحمام",
  "الكهرباء",
  "النقاشة",
  "السباكة",
  "التنظيف",
  "التصميم الداخلي",
  "الحدائق"
];
List<String> images = [
  "assets/garden.png",
  "assets/design.png",
  "assets/cleaning.png",
  "assets/water.png",
  "assets/draw.png",
  "assets/elec.png",
  "assets/bath.png",
  "assets/kit.png",
];
CarouselController controller = CarouselController();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            showUnselectedLabels: true,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            backgroundColor: Colors.black,
            unselectedItemColor: Color.fromARGB(255, 135, 135, 135),
            selectedItemColor: Color.fromARGB(255, 243, 176, 82),
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  icon: ImageIcon(AssetImage("assets/HomeIcon.png")),
                  label: "الرئيسيه"),
              BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  icon: ImageIcon(AssetImage("assets/GalleryIcon.png")),
                  label: "المعرض"),
              BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  icon: ImageIcon(AssetImage("assets/ServicesIcon.png")),
                  label: "خدماتي"),
              BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  icon: ImageIcon(AssetImage("assets/OrdersIcon.png")),
                  label: "طلباتي"),
              BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  icon: ImageIcon(AssetImage("assets/ProfileIcon.png")),
                  label: "حسابي")
            ]),
        body: Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      color: Color.fromARGB(255, 58, 131, 248),
                      icon: ImageIcon(AssetImage("assets/chat.png")),
                      onPressed: () {},
                    ),
                    Container(
                      width: 228.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.r, color: Color.fromARGB(10, 0, 0, 0)),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Padding(
                        padding: EdgeInsets.only(right: 19.25.w),
                        child: Row(
                          children: [
                            ImageIcon(
                              AssetImage("assets/SearchIcon.png"),
                              color: Color.fromARGB(255, 135, 135, 135),
                            ),
                            SizedBox(
                              width: 7.25.w,
                            ),
                            Text(
                              "ابحث عن خدماتك",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color.fromARGB(255, 135, 135, 135)),
                            )
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      color: Color.fromARGB(255, 58, 131, 248),
                      icon: ImageIcon(AssetImage("assets/Vector.png")),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Container(
                height: 170.h,
                margin: EdgeInsets.only(top: 20.h),
                child: Stack(alignment: Alignment.bottomCenter, children: [
                  CarouselSlider(
                    carouselController: controller,
                    items: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.0.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0.r),
                          image: DecorationImage(
                            image: AssetImage("assets/Ad.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.0.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0.r),
                          image: DecorationImage(
                            image: AssetImage("assets/Ad.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.0.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0.r),
                          image: DecorationImage(
                            image: AssetImage("assets/Ad.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                        height: 170.0.h,
                        enlargeCenterPage: false,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            curoselIndex = 2 - index;
                          });
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 12.0.h),
                    child: CarouselIndicator(
                      count: 3,
                      activeColor: Colors.white,
                      index: curoselIndex,
                      width: 7.w,
                      height: 7.w,
                      space: 9.w,
                    ),
                  )
                ]),
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "اختار خدمتك بسهوله",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: Color.fromARGB(255, 53, 53, 53)),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "عرض الكل",
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Color.fromARGB(255, 53, 53, 53)),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 168.h,
                child: ListView.separated(
                    reverse: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.asset(
                              images[7 - index],
                              height: 134.h,
                              width: 156.w,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r)),
                          ),
                          Text(names[index])
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 15.w);
                    },
                    itemCount: 8),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "العروض و الباقات",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: Color.fromARGB(255, 53, 53, 53)),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "عرض الكل",
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Color.fromARGB(255, 53, 53, 53)),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
