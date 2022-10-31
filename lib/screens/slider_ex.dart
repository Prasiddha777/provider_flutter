import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/provider/slider_provider.dart';

class SliderExampler extends StatefulWidget {
  const SliderExampler({super.key});

  @override
  State<SliderExampler> createState() => _SliderExamplerState();
}

class _SliderExamplerState extends State<SliderExampler> {
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<SliderProvider>(context, listen: false);
    print('builder');
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Example'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<SliderProvider>(builder: (context, value, child) {
            return Slider(
                value: value.value,
                onChanged: (val) {
                  value.setValue(val);
                });
          }),
          Consumer<SliderProvider>(builder: (context, value, child) {
            return Row(
              children: [
                //1
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                      ),
                      color: Colors.green.withOpacity(value.value),
                    ),
                    child: const Center(
                      child: Text('Container 1'),
                    ),
                  ),
                ),
                //2
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                        ),
                        color: Colors.red.withOpacity(value.value)),
                    child: const Center(
                      child: Text('Container 2'),
                    ),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
