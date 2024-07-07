import 'package:awesome_portfolio/constants/data.dart';
import 'package:awesome_portfolio/provider/current_state.dart';
import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CurrentState currentState =
        Provider.of<CurrentState>(context, listen: false);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                colors: [
                  Colors.blue,
                  Colors.black45,
                ],
              ),
            ),
          ),
          SvgPicture.asset(
            'images/cloudy.svg',
            height: size.height,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(),
                  SizedBox(
                    height: size.height - 100,
                    child: Consumer<CurrentState>(builder: (
                      context,
                      _,
                      __,
                    ) {
                      return DeviceFrame(
                        device: currentState.currentDevice,
                        screen: Container(
                          color: Colors.red,
                          child: Center(
                            child: Text(
                              'Hello',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List.generate(
                    devices.length,
                    (index) => Selector<CurrentState, DeviceInfo>(
                        selector: (context, provider) => provider.currentDevice,
                        builder: (context, _, __) {
                          return CustomButton(
                            height: 38,
                            width: 38,
                            borderRadius: 100,
                            backgroundColor: Colors.black,
                            shadowColor: Colors.white,
                            animate: true,
                            onPressed: () {
                              currentState.changeSelectedDevice(
                                devices[index].device,
                              );
                            },
                            pressed: currentState.currentDevice ==
                                    devices[index].device
                                ? Pressed.pressed
                                : Pressed.notPressed,
                            isThreeD: true,
                            child: Center(
                              child: Icon(
                                devices[index].data,
                                color: Colors.white,
                              ),
                            ),
                          );
                        }),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
