CodeSystem: MenstrualCycleDataCS
Id: menstrual-cycle-data
Title: "Menstrual Cycle Data Code System"
Description: "Temporary codes used by the Menstrual Cycle Data Exchange Implementation Guide where an appropriate standard code has not been identified."
* ^caseSensitive = true
* ^experimental = true
* ^status = #draft
* #menstrual-period "Menstrual period" "A menstrual bleeding episode represented by its reported start and end dates and daily flow observations."
* #menstrual-flow "Menstrual flow" "Patient-reported menstrual flow for a calendar day."
* #menstrual-cycle-tracking "Menstrual cycle tracking" "A request to collect and exchange menstrual cycle data."
* #temperature-deviation-personal-baseline "Temperature deviation from personal baseline" "A vendor-calculated temperature difference relative to an individual's baseline."
* #device-data "Device data" "An observation generated or calculated from data collected by a device."
* #basal-resting-measurement "Basal resting measurement" "A temperature measured under basal resting conditions."
* #nightly-wearable-aggregate "Nightly wearable aggregate" "A result aggregated from wearable measurements collected during a sleep interval."
* #vendor-baseline-deviation "Vendor baseline deviation" "A result calculated by a vendor algorithm relative to an individual's baseline."
* #spotting "Spotting" "Patient-reported spotting."
* #light "Light" "Patient-reported light menstrual flow."
* #moderate "Moderate" "Patient-reported moderate menstrual flow."
* #heavy "Heavy" "Patient-reported heavy menstrual flow."
* #smart-ring "Smart ring" "A finger-worn consumer device with one or more sensors."
* #fitness-tracker "Fitness tracker" "A consumer wearable used to collect fitness or health measurements."
* #wearable-temperature-sensor "Wearable temperature sensor" "A wearable device capable of collecting temperature data."
* #basal-thermometer "Basal thermometer" "A thermometer intended to support basal body temperature measurement."
* #thermometer "Thermometer" "A general-purpose temperature measurement device."

ValueSet: MenstrualFlowIntensityVS
Id: menstrual-flow-intensity
Title: "Menstrual Flow Intensity"
Description: "Patient-selected descriptions of menstrual flow intensity. These values are not clinical interpretations or diagnoses."
* ^experimental = true
* MenstrualCycleDataCS#spotting
* MenstrualCycleDataCS#light
* MenstrualCycleDataCS#moderate
* MenstrualCycleDataCS#heavy

ValueSet: CycleTrackingDeviceTypeVS
Id: cycle-tracking-device-type
Title: "Cycle Tracking Device Type"
Description: "Device types used to collect optional menstrual cycle temperature data."
* ^experimental = true
* MenstrualCycleDataCS#smart-ring
* MenstrualCycleDataCS#fitness-tracker
* MenstrualCycleDataCS#wearable-temperature-sensor
* MenstrualCycleDataCS#basal-thermometer
* MenstrualCycleDataCS#thermometer

ValueSet: TemperatureMeasurementMethodVS
Id: temperature-measurement-method
Title: "Temperature Measurement Method"
Description: "Methods used to collect or calculate temperature information in this guide."
* ^experimental = true
* MenstrualCycleDataCS#basal-resting-measurement
* MenstrualCycleDataCS#nightly-wearable-aggregate
* MenstrualCycleDataCS#vendor-baseline-deviation

ValueSet: TemperatureDifferenceUnitVS
Id: temperature-difference-unit
Title: "Temperature Difference Units"
Description: "UCUM units permitted for temperature differences."
* ^experimental = true
* $UCUM#K "kelvin"
* $UCUM#"[degF]" "degree Fahrenheit"
