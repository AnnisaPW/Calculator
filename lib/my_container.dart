import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerScreen extends StatelessWidget {
  final String labelScreen;
  const ContainerScreen({
    Key? key,
    required this.labelScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.infinity,
        margin: const EdgeInsets.all(3),
        color: Colors.grey.shade300,
        child: Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              labelScreen,
              textScaleFactor: 2.5,
              textAlign: TextAlign.end,
            ),
          ),
        ),
      ),
    );
  }
}

class ContainerTombol extends StatelessWidget {
  final String labelTombol;
  final Function funChar;
  const ContainerTombol({
    Key? key,
    required this.labelTombol,
    required this.funChar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        child: Container(
          height: double.infinity,
          margin: const EdgeInsets.all(5),
          color: Colors.grey,
          child: Center(
            child: Text(
              labelTombol,
              textScaleFactor: 2,
              style: const TextStyle(
                // color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        onTap: () {
          funChar();
        },
      ),
    );
  }
}

class ContainerOps extends StatelessWidget {
  final String labelOps;
  final Function funOps;
  final Color colorsOps;
  const ContainerOps({
    Key? key,
    required this.labelOps,
    required this.funOps,
    required this.colorsOps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        child: Container(
          height: double.infinity,
          margin: const EdgeInsets.all(5),
          color: colorsOps,
          child: Center(
            child: Text(labelOps,
                textScaleFactor: 2,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                )),
          ),
        ),
        onTap: () {
          funOps();
        },
      ),
    );
  }
}
