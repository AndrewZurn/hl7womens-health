RuleSet: CycleObservationBase
* identifier 1..* MS
  * ^short = "Stable identifier assigned by the source"
* status MS
* subject 1..1 MS
* subject only Reference(Patient)
* basedOn 0..1 MS
* basedOn only Reference(MenstrualCycleTrackingServiceRequest)

RuleSet: QuantityWithUCUM
* value[x] only Quantity
* valueQuantity 1..1 MS
* valueQuantity.value 1..1 MS
* valueQuantity.unit 1..1 MS
* valueQuantity.system 1..1 MS
* valueQuantity.system = $UCUM (exactly)
* valueQuantity.code 1..1 MS

Invariant: basal-body-temperature-code
Description: "Basal body temperature must include the SNOMED CT basal body temperature code in addition to the FHIR body temperature code."
Expression: "code.coding.where(system = 'http://snomed.info/sct' and code = '300076005').exists()"
Severity: #error

Profile: MenstrualPeriodObservation
Parent: Observation
Id: menstrual-period-observation
Title: "Menstrual Period Observation"
Description: "A patient-reported menstrual bleeding episode represented by a date range and its daily menstrual flow observations."
* insert CycleObservationBase
* category 1..1 MS
* category = $ObservationCategory#survey
* code = MenstrualCycleDataCS#menstrual-period
* effective[x] 1..1 MS
* effective[x] only Period
* effectivePeriod.start 1..1 MS
  * ^short = "First reported calendar day of menstrual bleeding"
* effectivePeriod.end 0..1 MS
  * ^short = "Last reported calendar day of menstrual bleeding"
* value[x] 0..0
* performer 1..1 MS
* performer only Reference(Patient)
* hasMember 1..* MS
* hasMember only Reference(MenstrualFlowObservation)
  * ^short = "Daily menstrual flow observations in this period"

Profile: MenstrualFlowObservation
Parent: Observation
Id: menstrual-flow-observation
Title: "Menstrual Flow Observation"
Description: "A patient's description of menstrual flow intensity for one calendar day."
* insert CycleObservationBase
* category 1..1 MS
* category = $ObservationCategory#survey
* code = MenstrualCycleDataCS#menstrual-flow
* effective[x] 1..1 MS
* effective[x] only dateTime
  * ^short = "Calendar date for the diary entry"
* performer 1..1 MS
* performer only Reference(Patient)
* value[x] only CodeableConcept
* valueCodeableConcept 1..1 MS
* valueCodeableConcept from MenstrualFlowIntensityVS (required)

Profile: CycleTrackingDevice
Parent: Device
Id: cycle-tracking-device
Title: "Cycle Tracking Device"
Description: "An optional wearable or thermometer used to collect temperature data exchanged under this guide."
* type 1..1 MS
* type from CycleTrackingDeviceTypeVS (extensible)
* identifier MS
* status MS
* manufacturer MS
* deviceName MS
* modelNumber MS
* serialNumber MS
* udiCarrier MS
* patient 0..1 MS
* patient only Reference(Patient)

Profile: BasalBodyTemperatureObservation
Parent: $BodyTemperatureProfile
Id: basal-body-temperature-observation
Title: "Basal Body Temperature Observation"
Description: "An absolute body temperature explicitly measured under basal resting conditions."
* insert CycleObservationBase
* obeys basal-body-temperature-code
* effective[x] only dateTime
* effectiveDateTime 1..1 MS
* insert QuantityWithUCUM
* valueQuantity.code from $BodyTemperatureUnits (required)
* method 1..1 MS
* method = MenstrualCycleDataCS#basal-resting-measurement
* bodySite MS
* device 0..1 MS
* device only Reference(CycleTrackingDevice)
* performer 1..* MS
* performer only Reference(Patient or Organization)

Profile: WearableSkinTemperatureObservation
Parent: Observation
Id: wearable-skin-temperature-observation
Title: "Wearable Skin Temperature Observation"
Description: "An absolute skin temperature collected by a wearable device. This result is not a basal or core body temperature."
* insert CycleObservationBase
* category 1..1 MS
* category = MenstrualCycleDataCS#device-data
* code = $SCT#364537001 "Temperature of skin (observable entity)"
* effective[x] 1..1 MS
* effective[x] only dateTime or Period
* insert QuantityWithUCUM
* valueQuantity.code from $BodyTemperatureUnits (required)
* method 0..1 MS
* method from TemperatureMeasurementMethodVS (extensible)
* bodySite MS
* device 0..1 MS
* device only Reference(CycleTrackingDevice)
* performer MS

Profile: TemperatureBaselineDeviationObservation
Parent: Observation
Id: temperature-baseline-deviation-observation
Title: "Temperature Baseline Deviation Observation"
Description: "A vendor-calculated temperature difference relative to an individual's personal baseline. This result is not an absolute temperature or vital sign."
* insert CycleObservationBase
* category 1..1 MS
* category = MenstrualCycleDataCS#device-data
* code = MenstrualCycleDataCS#temperature-deviation-personal-baseline
* effective[x] 1..1 MS
* effective[x] only dateTime or Period
* insert QuantityWithUCUM
* valueQuantity.code from TemperatureDifferenceUnitVS (required)
* method 1..1 MS
* method = MenstrualCycleDataCS#vendor-baseline-deviation
* bodySite MS
* device 0..1 MS
* device only Reference(CycleTrackingDevice)
* derivedFrom MS

Profile: MenstrualCycleTrackingServiceRequest
Parent: ServiceRequest
Id: menstrual-cycle-tracking-service-request
Title: "Menstrual Cycle Tracking Service Request"
Description: "An optional request to collect and exchange menstrual period diary or temperature data. Enrollment may instead be established outside FHIR."
* status MS
* intent MS
* code 1..1 MS
* code = MenstrualCycleDataCS#menstrual-cycle-tracking
* subject 1..1 MS
* subject only Reference(Patient)
* occurrence[x] MS
* authoredOn MS
* requester MS
* patientInstruction MS

Profile: MenstrualDataProvenance
Parent: Provenance
Id: menstrual-data-provenance
Title: "Menstrual Data Provenance"
Description: "Provenance identifying the author and, when applicable, the application or vendor that transmitted menstrual cycle data."
* target 1..* MS
* recorded MS
* agent ^slicing.discriminator.type = #pattern
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #open
* agent contains
    author 1..* MS and
    transmitter 0..* MS
* agent[author].type = $ProvenanceParticipantType#author
* agent[author].who only Reference(Patient or Practitioner or Organization or Device)
* agent[transmitter].type = $ProvenanceParticipantType#transmitter
* agent[transmitter].who only Reference(Organization or Device)
* entity MS

Profile: MenstrualDataSubmissionBundle
Parent: Bundle
Id: menstrual-data-submission-bundle
Title: "Menstrual Data Submission Bundle"
Description: "A standard FHIR transaction Bundle used to submit menstrual period diary and optional temperature data."
* type = #transaction
* timestamp 1..1 MS
* entry 1..* MS
* entry.fullUrl 1..1 MS
* entry.resource 1..1 MS
* entry.resource only MenstrualPeriodObservation or MenstrualFlowObservation or BasalBodyTemperatureObservation or WearableSkinTemperatureObservation or TemperatureBaselineDeviationObservation or CycleTrackingDevice or MenstrualDataProvenance
* entry.request 1..1 MS
* entry.request.method MS
* entry.request.url MS
* entry.request.ifNoneExist MS
