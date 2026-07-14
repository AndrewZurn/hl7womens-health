Instance: example-patient
InstanceOf: Patient
Title: "Example Patient"
Description: "Example patient used by the menstrual cycle data examples."
Usage: #example
* identifier.system = "https://example.org/patients"
* identifier.value = "patient-001"
* name.family = "Avery"
* name.given = "Jordan"
* gender = #female
* birthDate = "1990-06-15"

Instance: example-vendor-organization
InstanceOf: Organization
Title: "Example Vendor Organization"
Description: "Example organization representing an app or vendor service that transmits patient-generated data."
Usage: #example
* name = "Example Cycle App"

Instance: example-cycle-tracking-request
InstanceOf: MenstrualCycleTrackingServiceRequest
Title: "Example Menstrual Cycle Tracking Service Request"
Description: "Example clinician request to collect and share menstrual period diary data."
Usage: #example
* status = #active
* intent = #order
* subject = Reference(example-patient)
* authoredOn = "2026-07-01"
* patientInstruction = "Track menstrual period start, end, and daily flow. Optional temperature data may be shared when available."

Instance: example-flow-day-1
InstanceOf: MenstrualFlowObservation
Title: "Example Menstrual Flow Day 1"
Description: "Patient-reported moderate menstrual flow for the first day of a period."
Usage: #example
* identifier.system = "https://example-cycle-app.example/events"
* identifier.value = "flow-2026-07-03"
* status = #final
* subject = Reference(example-patient)
* basedOn = Reference(example-cycle-tracking-request)
* effectiveDateTime = "2026-07-03"
* performer = Reference(example-patient)
* valueCodeableConcept = MenstrualCycleDataCS#moderate

Instance: example-flow-day-2
InstanceOf: MenstrualFlowObservation
Title: "Example Menstrual Flow Day 2"
Description: "Patient-reported heavy menstrual flow for the second day of a period."
Usage: #example
* identifier.system = "https://example-cycle-app.example/events"
* identifier.value = "flow-2026-07-04"
* status = #final
* subject = Reference(example-patient)
* basedOn = Reference(example-cycle-tracking-request)
* effectiveDateTime = "2026-07-04"
* performer = Reference(example-patient)
* valueCodeableConcept = MenstrualCycleDataCS#heavy

Instance: example-flow-day-3
InstanceOf: MenstrualFlowObservation
Title: "Example Menstrual Flow Day 3"
Description: "Patient-reported light menstrual flow for the third day of a period."
Usage: #example
* identifier.system = "https://example-cycle-app.example/events"
* identifier.value = "flow-2026-07-05"
* status = #final
* subject = Reference(example-patient)
* basedOn = Reference(example-cycle-tracking-request)
* effectiveDateTime = "2026-07-05"
* performer = Reference(example-patient)
* valueCodeableConcept = MenstrualCycleDataCS#light

Instance: example-flow-day-4
InstanceOf: MenstrualFlowObservation
Title: "Example Menstrual Flow Day 4"
Description: "Patient-reported spotting for the final day of a period."
Usage: #example
* identifier.system = "https://example-cycle-app.example/events"
* identifier.value = "flow-2026-07-06"
* status = #final
* subject = Reference(example-patient)
* effectiveDateTime = "2026-07-06"
* performer = Reference(example-patient)
* valueCodeableConcept = MenstrualCycleDataCS#spotting

Instance: example-period-complete
InstanceOf: MenstrualPeriodObservation
Title: "Example Completed Menstrual Period"
Description: "A completed menstrual period grouped with daily menstrual flow observations."
Usage: #example
* identifier.system = "https://example-cycle-app.example/periods"
* identifier.value = "period-2026-07"
* status = #final
* subject = Reference(example-patient)
* basedOn = Reference(example-cycle-tracking-request)
* effectivePeriod.start = "2026-07-03"
* effectivePeriod.end = "2026-07-06"
* performer = Reference(example-patient)
* hasMember[+] = Reference(example-flow-day-1)
* hasMember[+] = Reference(example-flow-day-2)
* hasMember[+] = Reference(example-flow-day-3)
* hasMember[+] = Reference(example-flow-day-4)

Instance: example-period-open
InstanceOf: MenstrualPeriodObservation
Title: "Example Ongoing Menstrual Period"
Description: "An ongoing menstrual period before the end date is known."
Usage: #example
* identifier.system = "https://example-cycle-app.example/periods"
* identifier.value = "period-2026-08"
* status = #preliminary
* subject = Reference(example-patient)
* effectivePeriod.start = "2026-08-01"
* performer = Reference(example-patient)
* hasMember = Reference(example-flow-day-1)

Instance: example-manual-thermometer
InstanceOf: CycleTrackingDevice
Title: "Example Manual Basal Thermometer"
Description: "Example basal thermometer used for a manual basal body temperature measurement."
Usage: #example
* type = MenstrualCycleDataCS#basal-thermometer
* manufacturer = "Acme Health"
* deviceName.name = "Acme Basal Thermometer"
* deviceName.type = #user-friendly-name
* modelNumber = "BBT-100"

Instance: example-oura-ring
InstanceOf: CycleTrackingDevice
Title: "Example Oura Ring"
Description: "Example smart ring used for a vendor-calculated temperature baseline deviation."
Usage: #example
* type = MenstrualCycleDataCS#smart-ring
* manufacturer = "Oura"
* deviceName.name = "Oura Ring"
* deviceName.type = #user-friendly-name
* patient = Reference(example-patient)

Instance: example-whoop-device
InstanceOf: CycleTrackingDevice
Title: "Example WHOOP Device"
Description: "Example wearable used for absolute skin temperature."
Usage: #example
* type = MenstrualCycleDataCS#fitness-tracker
* manufacturer = "WHOOP"
* deviceName.name = "WHOOP wearable"
* deviceName.type = #user-friendly-name
* patient = Reference(example-patient)

Instance: example-fitbit-device
InstanceOf: CycleTrackingDevice
Title: "Example Fitbit Device"
Description: "Example wearable used for a vendor-calculated temperature baseline deviation."
Usage: #example
* type = MenstrualCycleDataCS#fitness-tracker
* manufacturer = "Fitbit"
* deviceName.name = "Fitbit wearable"
* deviceName.type = #user-friendly-name
* patient = Reference(example-patient)

Instance: example-basal-temperature-manual
InstanceOf: BasalBodyTemperatureObservation
Title: "Example Manual Basal Body Temperature"
Description: "An oral basal body temperature manually recorded by the patient."
Usage: #example
* identifier.system = "https://example-cycle-app.example/events"
* identifier.value = "bbt-2026-07-03"
* status = #final
* code.coding[+] = $LNC#8331-1 "Oral temperature"
* code.coding[+] = $SCT#300076005 "Basal body temperature"
* subject = Reference(example-patient)
* basedOn = Reference(example-cycle-tracking-request)
* effectiveDateTime = "2026-07-03T06:20:00-05:00"
* performer = Reference(example-patient)
* device = Reference(example-manual-thermometer)
* valueQuantity.value = 36.52
* valueQuantity.unit = "Cel"
* valueQuantity.system = $UCUM
* valueQuantity.code = #Cel
* method = MenstrualCycleDataCS#basal-resting-measurement
* bodySite = $SCT#21082005 "Entire mouth region"

Instance: example-basal-temperature-no-device
InstanceOf: BasalBodyTemperatureObservation
Title: "Example Basal Body Temperature Without Device"
Description: "A basal body temperature where the thermometer is not represented as a Device resource."
Usage: #example
* identifier.system = "https://example-cycle-app.example/events"
* identifier.value = "bbt-2026-07-04"
* status = #final
* code.coding[+] = $SCT#300076005 "Basal body temperature"
* subject = Reference(example-patient)
* effectiveDateTime = "2026-07-04T06:15:00-05:00"
* performer = Reference(example-patient)
* valueQuantity.value = 36.61
* valueQuantity.unit = "Cel"
* valueQuantity.system = $UCUM
* valueQuantity.code = #Cel
* method = MenstrualCycleDataCS#basal-resting-measurement

Instance: example-whoop-skin-temperature
InstanceOf: WearableSkinTemperatureObservation
Title: "Example WHOOP Skin Temperature"
Description: "An absolute skin temperature associated with a sleep interval. It is not basal or core body temperature."
Usage: #example
* identifier.system = "https://example-whoop.example/recovery"
* identifier.value = "whoop-skin-temp-2026-07-03"
* status = #final
* subject = Reference(example-patient)
* effectivePeriod.start = "2026-07-03T23:10:00-05:00"
* effectivePeriod.end = "2026-07-04T06:45:00-05:00"
* performer = Reference(example-vendor-organization)
* device = Reference(example-whoop-device)
* valueQuantity.value = 33.8
* valueQuantity.unit = "Cel"
* valueQuantity.system = $UCUM
* valueQuantity.code = #Cel
* method = MenstrualCycleDataCS#nightly-wearable-aggregate

Instance: example-oura-temperature-deviation
InstanceOf: TemperatureBaselineDeviationObservation
Title: "Example Oura Temperature Baseline Deviation"
Description: "A nighttime skin-temperature deviation from personal baseline. It is not an absolute body temperature."
Usage: #example
* identifier.system = "https://example-oura.example/daily"
* identifier.value = "oura-temp-dev-2026-07-03"
* status = #final
* subject = Reference(example-patient)
* effectivePeriod.start = "2026-07-03T22:50:00-05:00"
* effectivePeriod.end = "2026-07-04T06:30:00-05:00"
* performer = Reference(example-vendor-organization)
* device = Reference(example-oura-ring)
* valueQuantity.value = 0.28
* valueQuantity.unit = "K"
* valueQuantity.system = $UCUM
* valueQuantity.code = #K
* method = MenstrualCycleDataCS#vendor-baseline-deviation

Instance: example-fitbit-temperature-deviation
InstanceOf: TemperatureBaselineDeviationObservation
Title: "Example Fitbit Temperature Baseline Deviation"
Description: "A Fitbit nightly relative skin-temperature value represented as deviation from personal baseline."
Usage: #example
* identifier.system = "https://example-fitbit.example/temperature"
* identifier.value = "fitbit-temp-dev-2026-07-03"
* status = #final
* subject = Reference(example-patient)
* effectiveDateTime = "2026-07-04"
* performer = Reference(example-vendor-organization)
* device = Reference(example-fitbit-device)
* valueQuantity.value = -0.17
* valueQuantity.unit = "K"
* valueQuantity.system = $UCUM
* valueQuantity.code = #K
* method = MenstrualCycleDataCS#vendor-baseline-deviation

Instance: example-patient-app-provenance
InstanceOf: MenstrualDataProvenance
Title: "Example Patient App Provenance"
Description: "Provenance for patient-authored diary and basal temperature data transmitted by a patient app."
Usage: #example
* target[+] = Reference(example-period-complete)
* target[+] = Reference(example-flow-day-1)
* target[+] = Reference(example-flow-day-2)
* target[+] = Reference(example-flow-day-3)
* target[+] = Reference(example-flow-day-4)
* target[+] = Reference(example-basal-temperature-manual)
* recorded = "2026-07-07T14:30:00Z"
* agent[author].who = Reference(example-patient)
* agent[transmitter].who = Reference(example-vendor-organization)

Instance: example-vendor-provenance
InstanceOf: MenstrualDataProvenance
Title: "Example Vendor Provenance"
Description: "Provenance for vendor-calculated wearable temperature data transmitted by a cloud service."
Usage: #example
* target[+] = Reference(example-oura-temperature-deviation)
* target[+] = Reference(example-whoop-skin-temperature)
* target[+] = Reference(example-fitbit-temperature-deviation)
* recorded = "2026-07-04T12:00:00Z"
* agent[author].who = Reference(example-vendor-organization)
* agent[transmitter].who = Reference(example-vendor-organization)

Instance: example-patient-app-bundle-provenance
InstanceOf: MenstrualDataProvenance
Title: "Example Patient App Bundle Provenance"
Description: "Bundle-local provenance using transaction fullUrl references."
Usage: #inline
* target[0].reference = "urn:uuid:11111111-1111-4111-8111-111111111111"
* target[1].reference = "urn:uuid:11111111-1111-4111-8111-111111111112"
* target[2].reference = "urn:uuid:11111111-1111-4111-8111-111111111113"
* target[3].reference = "urn:uuid:11111111-1111-4111-8111-111111111114"
* target[4].reference = "urn:uuid:11111111-1111-4111-8111-111111111115"
* target[5].reference = "urn:uuid:11111111-1111-4111-8111-111111111117"
* recorded = "2026-07-07T14:30:00Z"
* agent[author].who = Reference(example-patient)
* agent[transmitter].who = Reference(example-vendor-organization)

Instance: example-cloud-bundle-provenance
InstanceOf: MenstrualDataProvenance
Title: "Example Cloud Bundle Provenance"
Description: "Bundle-local provenance using transaction fullUrl references."
Usage: #inline
* target[0].reference = "urn:uuid:22222222-2222-4222-8222-222222222224"
* target[1].reference = "urn:uuid:22222222-2222-4222-8222-222222222225"
* target[2].reference = "urn:uuid:22222222-2222-4222-8222-222222222226"
* recorded = "2026-07-04T12:00:00Z"
* agent[author].who = Reference(example-vendor-organization)
* agent[transmitter].who = Reference(example-vendor-organization)

Instance: example-patient-app-submission-bundle
InstanceOf: MenstrualDataSubmissionBundle
Title: "Example Patient App Submission Bundle"
Description: "A transaction Bundle containing a completed period, daily flow entries, a manual basal temperature, and provenance."
Usage: #example
* type = #transaction
* timestamp = "2026-07-07T14:30:00Z"
* entry[+].fullUrl = "urn:uuid:11111111-1111-4111-8111-111111111111"
* entry[=].resource = example-period-complete
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"
* entry[=].request.ifNoneExist = "identifier=https://example-cycle-app.example/periods|period-2026-07"
* entry[+].fullUrl = "urn:uuid:11111111-1111-4111-8111-111111111112"
* entry[=].resource = example-flow-day-1
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"
* entry[=].request.ifNoneExist = "identifier=https://example-cycle-app.example/events|flow-2026-07-03"
* entry[+].fullUrl = "urn:uuid:11111111-1111-4111-8111-111111111113"
* entry[=].resource = example-flow-day-2
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"
* entry[=].request.ifNoneExist = "identifier=https://example-cycle-app.example/events|flow-2026-07-04"
* entry[+].fullUrl = "urn:uuid:11111111-1111-4111-8111-111111111114"
* entry[=].resource = example-flow-day-3
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"
* entry[=].request.ifNoneExist = "identifier=https://example-cycle-app.example/events|flow-2026-07-05"
* entry[+].fullUrl = "urn:uuid:11111111-1111-4111-8111-111111111115"
* entry[=].resource = example-flow-day-4
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"
* entry[=].request.ifNoneExist = "identifier=https://example-cycle-app.example/events|flow-2026-07-06"
* entry[+].fullUrl = "urn:uuid:11111111-1111-4111-8111-111111111116"
* entry[=].resource = example-manual-thermometer
* entry[=].request.method = #POST
* entry[=].request.url = "Device"
* entry[+].fullUrl = "urn:uuid:11111111-1111-4111-8111-111111111117"
* entry[=].resource = example-basal-temperature-manual
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"
* entry[=].request.ifNoneExist = "identifier=https://example-cycle-app.example/events|bbt-2026-07-03"
* entry[+].fullUrl = "urn:uuid:11111111-1111-4111-8111-111111111118"
* entry[=].resource = example-patient-app-bundle-provenance
* entry[=].request.method = #POST
* entry[=].request.url = "Provenance"

Instance: example-cloud-submission-bundle
InstanceOf: MenstrualDataSubmissionBundle
Title: "Example Cloud Submission Bundle"
Description: "A transaction Bundle containing vendor-derived wearable temperature observations and provenance."
Usage: #example
* type = #transaction
* timestamp = "2026-07-04T12:00:00Z"
* entry[+].fullUrl = "urn:uuid:22222222-2222-4222-8222-222222222221"
* entry[=].resource = example-oura-ring
* entry[=].request.method = #POST
* entry[=].request.url = "Device"
* entry[+].fullUrl = "urn:uuid:22222222-2222-4222-8222-222222222222"
* entry[=].resource = example-whoop-device
* entry[=].request.method = #POST
* entry[=].request.url = "Device"
* entry[+].fullUrl = "urn:uuid:22222222-2222-4222-8222-222222222223"
* entry[=].resource = example-fitbit-device
* entry[=].request.method = #POST
* entry[=].request.url = "Device"
* entry[+].fullUrl = "urn:uuid:22222222-2222-4222-8222-222222222224"
* entry[=].resource = example-oura-temperature-deviation
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"
* entry[=].request.ifNoneExist = "identifier=https://example-oura.example/daily|oura-temp-dev-2026-07-03"
* entry[+].fullUrl = "urn:uuid:22222222-2222-4222-8222-222222222225"
* entry[=].resource = example-whoop-skin-temperature
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"
* entry[=].request.ifNoneExist = "identifier=https://example-whoop.example/recovery|whoop-skin-temp-2026-07-03"
* entry[+].fullUrl = "urn:uuid:22222222-2222-4222-8222-222222222226"
* entry[=].resource = example-fitbit-temperature-deviation
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"
* entry[=].request.ifNoneExist = "identifier=https://example-fitbit.example/temperature|fitbit-temp-dev-2026-07-03"
* entry[+].fullUrl = "urn:uuid:22222222-2222-4222-8222-222222222227"
* entry[=].resource = example-cloud-bundle-provenance
* entry[=].request.method = #POST
* entry[=].request.url = "Provenance"
