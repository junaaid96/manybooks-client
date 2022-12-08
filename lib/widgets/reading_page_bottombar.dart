import 'package:flutter/material.dart';

class PageScrollIndicator extends StatefulWidget {

  @override
  State<PageScrollIndicator> createState() => _PageScrollIndicatorState();
}

class _PageScrollIndicatorState extends State<PageScrollIndicator> {
  double _currentSliderValue = 20.0;

  @override
  Widget build(BuildContext context) {

    return Padding(
            padding: const EdgeInsets.symmetric(horizontal:12.0),
            child: Row(
// mainAxisAlignment: MainAxisAlignment.cen,
              children: [
                Icon(Icons.arrow_back_ios,size: 13),
                Expanded(
                  child: SliderTheme(
                    data: SliderThemeData(
                      trackHeight: 3,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 6.0,
// disabledThumbRadius: 6.0
                      ),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 0.0),
                      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                      valueIndicatorColor: Colors.black,
                      valueIndicatorTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    child: Slider(
                      thumbColor: Color(0xff263238),
                      activeColor: Color(0xff263238),
                      inactiveColor: Color(0xffAFAFAF),
                      value: _currentSliderValue,
                      min: 0.0,
                      max: 100.0,
                      // divisions: 5,
                      label: "${_currentSliderValue.round()}",
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                        });
                      },
                    ),
                  ),
                ),
                Icon(Icons.arrow_forward_ios,size: 13,),
              ],
            ),
          )
          ;
  }
}