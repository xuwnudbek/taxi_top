import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:taxi_top/pages/add_my_ride/provider/add_my_ride_provider.dart';
import 'package:taxi_top/utils/cp_indicator.dart';
import 'package:taxi_top/utils/function/input_formatter.dart';
import 'package:taxi_top/utils/rgb_colors.dart';
import 'package:taxi_top/utils/widgets/appbar_x.dart';
import 'package:taxi_top/utils/widgets/buttons/main_button.dart';
import 'package:taxi_top/utils/widgets/date_picker_line/date_picker_line.dart';

class AddMyRide extends StatelessWidget {
  const AddMyRide({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddMyRideProvider>(
      create: (context) => AddMyRideProvider(),
      builder: (context, snapshot) {
        return Consumer<AddMyRideProvider>(
          builder: (context, provider, _) {
            return Stack(
              children: [
                Scaffold(
                  extendBody: true,
                  appBar: AppBarX(
                    title: Text(
                      "add_ride".tr,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  bottomNavigationBar: MainButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "add".tr,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    onTap: () async {
                      if (provider.isValidated()) {
                        var res = await provider.addRide();
                        if (res) {
                          print(res);
                          Navigator.of(context).pop(true);
                        }
                      }
                    },
                  ),
                  resizeToAvoidBottomInset: false,
                  body: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(left: 5, right: 5, bottom: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Rider's car image
                          Container(
                            decoration: BoxDecoration(
                              color: RGBColors.grey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            constraints: BoxConstraints(maxHeight: 300),
                            child: Image.network(
                              "${provider.rider['car']?['photo']}",
                              fit: BoxFit.cover,
                              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: child,
                                );
                              },
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                } else {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: CPIndicator(),
                                  );
                                }
                              },
                            ),
                          ),
                          //Form ride
                          SizedBox(height: 10),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Title
                                title("ride_details".tr, style: Theme.of(context).textTheme.titleMedium),
                                title("from".tr),
                                _buildRegionDropdown(
                                  provider.regions,
                                  onChanged: (value) => provider.from = value,
                                  value: provider.from,
                                ),
                                //To
                                title("to".tr),
                                _buildRegionDropdown(
                                  provider.regions,
                                  onChanged: (value) => provider.to = value,
                                  value: provider.to,
                                ),
                                //Date

                                DatePickerLine(
                                  onChangeDate: (value) {
                                    provider.date = value;
                                  },
                                  onChangeTime: (value) {
                                    provider.time = value;
                                  },
                                ),

                                //Price
                                title("price".tr),
                                _buildInput(
                                  controller: provider.price,
                                ),
                                // Seats
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    title("seats".tr),
                                    SizedBox(width: 5),
                                    seatDropdown(provider),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CarSeats(
                                      provider: provider,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: Get.height * 0.1),
                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: provider.isLoading,
                  child: CPIndicator(),
                )
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildInput({
    required TextEditingController controller,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: RGBColors.grey,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: controller,
        // textDirection: TextDirection.rtl,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        inputFormatters: [
          //first number doesnt accept 0
          LengthLimitingTextInputFormatter(7),
          PriceInputFormatter(),
        ],
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "price".tr,
          hintStyle: TextStyle(
            color: RGBColors.lightColor.withOpacity(0.3),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          // hintTextDirection: TextDirection.rtl,
        ),
        cursorColor: RGBColors.lightColor,
        style: Theme.of(Get.context!).textTheme.bodyMedium,
      ),
    );
  }

  Widget title(String text, {var style}) {
    if (style == null) style = Theme.of(Get.context!).textTheme.titleSmall;

    return Padding(
      padding: EdgeInsets.only(left: 10.0, top: 10, bottom: 5),
      child: Text("$text", style: style),
    );
  }

  Widget _buildRegionDropdown(List<String> regions, {required Function onChanged, required value}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: DropdownButton(
        focusColor: RGBColors.lightColor,
        dropdownColor: RGBColors.grey,
        borderRadius: BorderRadius.circular(20),
        isExpanded: true,
        menuMaxHeight: Get.height * 0.7,
        isDense: true,
        value: value,
        iconDisabledColor: RGBColors.lightColor,
        items: regions
            .map(
              (e) => DropdownMenuItem(
                enabled: e != value,
                child: Text(
                  " $e",
                  style: Theme.of(Get.context!).textTheme.bodyMedium,
                ),
                value: e,
              ),
            )
            .toList(),
        onChanged: (value) => onChanged(value),
      ),
    );
  }

  Widget seatDropdown(AddMyRideProvider provider) {
    return DropdownButton(
      borderRadius: BorderRadius.circular(10),
      dropdownColor: RGBColors.grey,
      items: [3, 4]
          .map(
            (e) => DropdownMenuItem(
              child: Text("$e " + "ta".tr),
              value: e,
            ),
          )
          .toList(),
      value: provider.seatsCount,
      onChanged: (e) {
        provider.seatsCount = e;
      },
    );
  }
}

class CarSeats extends StatelessWidget {
  CarSeats({
    super.key,
    required this.provider,
  });
  AddMyRideProvider provider;

  @override
  Widget build(BuildContext context) {
    //Front seats
    Widget _buildFrontSeat(int index, {required Widget child}) {
      return GestureDetector(
        onTap: () {
          if (index == 0) return;
          var seat = provider.seatsStatus[index];
          if (seat == null) {
            provider.seatStatus = {
              index: true,
            };
          } else {
            provider.seatStatus = {
              index: !seat,
            };
          }
          print(provider.seatsStatus);
        },
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: RGBColors.grey,
            borderRadius: BorderRadius.only(
              topLeft: index == 0 ? Radius.circular(70) : Radius.circular(20),
              topRight: index == 1 ? Radius.circular(70) : Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Center(
            child: child,
          ),
        ),
      );
    }

    //Back seats
    Widget _buildBackSeat(int index, {required Widget child}) {
      return GestureDetector(
        onTap: () {
          var seat = provider.seatsStatus[index];
          if (seat == null) {
            provider.seatStatus = {
              index: true,
            };
          } else {
            provider.seatStatus = {
              index: !seat,
            };
          }
          print(provider.seatsStatus);
        },
        child: Container(
          height: 100,
          margin: EdgeInsets.only(left: 2, right: 2),
          decoration: BoxDecoration(
            color: RGBColors.grey,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: child,
          ),
        ),
      );
    }

    //
    return Container(
      width: Get.width * 0.5,
      padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        color: RGBColors.lightColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(80),
          bottom: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildFrontSeat(
                  0,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        "assets/images/rider.png",
                        width: 70,
                      ),
                      Positioned(
                        bottom: -25,
                        child: Image.asset(
                          "assets/images/wheel.png",
                          width: 50,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: _buildFrontSeat(
                  1,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        "assets/images/passenger.png",
                        width: 50,
                      ),
                      Positioned(
                        child: SvgPicture.asset(
                          "assets/images/${provider.seatsStatus[1] ?? false ? "check" : "cross"}.svg",
                          color: provider.seatsStatus[1] ?? false ? Colors.green : Colors.red,
                          width: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 2; i < provider.seatsCount + 1; i++) ...[
                Expanded(
                  child: _buildBackSeat(
                    i,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          "assets/images/passenger.png",
                          width: 50,
                        ),
                        Positioned(
                          child: SvgPicture.asset(
                            "assets/images/${provider.seatsStatus[i] ?? false ? "check" : "cross"}.svg",
                            color: provider.seatsStatus[i] ?? false ? Colors.green : Colors.red,
                            width: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
