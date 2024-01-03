# Environment Light Intensity Meter

## Overview

The Environment Light Intensity Meter is an IoT project designed to measure the amount of light in a room and provide real-time data to both local and remote platforms. The project consists of two modules: the AVR Module and the IoT Module.

### AVR Module

The AVR Module is responsible for locally measuring the light intensity and displaying the results on a 16x2 LCD. Additionally, it dynamically controls a Green LED based on the detected light levels. If the light intensity is high, the Green LED is turned on; if it is dark, the Green LED is turned off, and a Red LED is activated.

### IoT Module

The IoT Module extends the functionality by sending the light intensity readings from the LDR (Light Dependent Resistor) module to a smartphone using the MQTT (Message Queuing Telemetry Transport) protocol. The readings are also logged in the Firebase Realtime Database, enabling historical data tracking and analysis. Furthermore, the IoT Module sends the LDR sensor values to the ThingSpeak cloud for additional storage and visualization.

## Usage

Learn how to interact with both the AVR and IoT modules for effective light intensity monitoring.

### AVR Module Usage

1. [Power on the AVR Module]
2. [Observe the 16x2 LCD for real-time light intensity readings]
3. [Monitor the Green and Red LEDs based on ambient light conditions]

### IoT Module Usage

1. [Receive light intensity readings on your smartphone using MQTT]
2. [Access historical data in the Firebase Realtime Database]
3. [Visualize and analyze light intensity trends on ThingSpeak Cloud]

## Contributors

- Mian Muhammad Ashhad
- Muhammad Abdullah
- Muhammad Saad Akmal
- Robass Atif
