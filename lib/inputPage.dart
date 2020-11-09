import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Card_Content.dart';
import 'ReusableCard.dart';
import 'const.dart';
import 'RoundButton.dart';
import 'ResultPage.dart';
import 'BottomButton.dart';
import 'Calculator_Brain.dart';
//import 'package:firebase_admob/firebase_admob.dart';

const String testDevice = 'Mobile_id';
enum gender { MALE, FEMALE }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    nonPersonalizedAds: true,
    keywords: <String>['Game', 'Marlo'],
  );

  BannerAd _bannerAd;

  BannerAd createBannerAd() {
    return BannerAd(
        adUnitId: BannerAd.testAdUnitId,
        size: AdSize.banner,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print("Banner $event");
        });
  }

  @override
  void initState() {
    FirebaseAdMob.instance.initialize(appId: BannerAd.testAdUnitId);
    _bannerAd = createBannerAd()
      ..load()
      ..show();
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

  gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        // centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReausableCard(
                    number: 22.0,
                    onPress: () {
                      setState(() {
                        selectedGender = gender.MALE;
                      });
                    },
                    colour: selectedGender == gender.MALE
                        ? kActiveColor
                        : kInactiveColor,
                    cardChild: CardContent(
                      gender: 'MALE',
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ReausableCard(
                    number: 22.0,
                    onPress: () {
                      setState(() {
                        selectedGender = gender.FEMALE;
                      });
                    },
                    colour: selectedGender == gender.FEMALE
                        ? kActiveColor
                        : kInactiveColor,
                    cardChild: CardContent(
                      gender: 'FEMALE',
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReausableCard(
                    number: 22.0,
                    colour: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: kStyleText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kMidStyleText,
                            ),
                            Text(
                              'cm',
                              style: kStyleText,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: kPinkColor,
                            inactiveTrackColor: kInTrackColor,
                            activeTrackColor: Colors.white,
                            overlayColor: kOverlayColor,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 25.0),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: kSliderMin,
                            max: kSliderMax,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReausableCard(
                    number: 22.0,
                    colour: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: kStyleText,
                        ),
                        Text(
                          weight.toString(),
                          style: kMidStyleText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              choosen: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              choosen: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReausableCard(
                    number: 22.0,
                    colour: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kStyleText,
                        ),
                        Text(
                          age.toString(),
                          style: kMidStyleText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              choosen: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              choosen: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomCard(
            text: 'CALCULATE',
            ontap: () {
              CalculatorBrain cal =
                  CalculatorBrain(height: height, weight: weight);
              cal.calculateBMI();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(cal.getResult(),
                          cal.calculateBMI(), cal.getInterpretation())));
            },
          ),
        ],
      ),
    );
  }
}
