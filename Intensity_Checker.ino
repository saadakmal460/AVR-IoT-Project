#include <WiFi.h>
#include <PubSubClient.h>
#include <ESP32Firebase.h>
#include "ThingSpeak.h"

WiFiClient wifiClient;
PubSubClient client;  // Pass the WiFi client to PubSubClient constructor
Firebase firebase("https://pelagic-cocoa-382522-default-rtdb.asia-southeast1.firebasedatabase.app/");

unsigned long myChannelNumber = 2;
const char * myWriteAPIKey = "CO6KKYSWDKXSQW11";

const int LDRPin = 4;
const char *ssid = "SAAD";
const char *password = "atzn2722";

void setup() {
  Serial.begin(9600);
  pinMode(LDRPin, INPUT);

  /*WiFi.mode(WIFI_STA);
  WiFi.disconnect();
  delay(1000);*/

  // Connect to WiFi
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.println("Connecting to WiFi...");
  }
  Serial.println("Connected to WiFi");

  // Connect to MQTT broker
  //connectToMQTT();

  ThingSpeak.begin(wifiClient);
}

void loop() {
  // put your main code here, to run repeatedly:
  /*if (!client.connected()) {
    // Reconnect to MQTT broker if connection is lost
    connectToMQTT();
  }*/

  int ldrValue = digitalRead(LDRPin);
  Serial.print("LDR Value: ");
  Serial.println(ldrValue);

  // Convert ldrValue to char array
  char buffer[10];
  itoa(ldrValue, buffer, 10);

  // Publish LDR value to MQTT
  /*if (client.publish("ashhad", buffer)) {
    Serial.println("Message sent successfully");
  } else {
    Serial.println("Failed to send message");
  }*/
  sendToTS(ldrValue);
  firebase.pushInt("Intensity", ldrValue);
  Serial.println("Value sent to Firebase");
  delay(1000);
}

void sendToTS(int ldrValue) {
  int x = ThingSpeak.writeField(myChannelNumber, 1, ldrValue, myWriteAPIKey);
  if(x == 200)
  {
    Serial.println("Channel update successful.");
  }
  else
  {
    Serial.println("Problem updating channel. HTTP error code " + String(x));
  }
}

void connectToMQTT() {

  client.setClient(wifiClient);
    client.setServer("test.mosquitto.org",1883);
  while (!client.connected()) {
    Serial.println("Attempting MQTT connection...");
    if (client.connect("b14d6440-8a03-46b3-963a-d3384e54e6d8")) {
      Serial.println("Connected to MQTT broker");
    } else {
      Serial.print("MQTT connection failed, rc=");
      Serial.print(client.state());
      Serial.println(" Retrying in 1 second...");
      delay(1000);
    }
  }
}