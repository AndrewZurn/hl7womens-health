Instance: menstrual-data-receiver
InstanceOf: CapabilityStatement
Usage: #definition
Title: "Menstrual Data Receiver Capability Statement"
Description: "Requirements for a FHIR server that receives menstrual cycle data using standard FHIR transactions."
* url = "https://example.org/fhir/uv/menstrual-cycle/CapabilityStatement/menstrual-data-receiver"
* name = "MenstrualDataReceiver"
* title = "Menstrual Data Receiver Capability Statement"
* status = #draft
* experimental = true
* date = "2026-07-13"
* kind = #requirements
* fhirVersion = #4.0.1
* format = #json
* rest.mode = #server
* rest.documentation = "The receiver accepts standard FHIR transaction Bundles. Technical acceptance does not imply clinical review or incorporation into the legal health record."
* rest.security.service = $RestfulSecurityService#SMART-on-FHIR "SMART-on-FHIR"
* rest.security.description = "User-facing applications use SMART App Launch. Headless vendor services use a pre-authorized backend service flow."
* rest.interaction.code = #transaction
* rest.interaction.documentation = "Accept a Menstrual Data Submission Bundle at the FHIR base endpoint."
* rest.resource[+].type = #Observation
* rest.resource[=].supportedProfile[+] = Canonical(MenstrualPeriodObservation)
* rest.resource[=].supportedProfile[+] = Canonical(MenstrualFlowObservation)
* rest.resource[=].supportedProfile[+] = Canonical(BasalBodyTemperatureObservation)
* rest.resource[=].supportedProfile[+] = Canonical(WearableSkinTemperatureObservation)
* rest.resource[=].supportedProfile[+] = Canonical(TemperatureBaselineDeviationObservation)
* rest.resource[=].interaction[+].code = #create
* rest.resource[=].interaction[+].code = #update
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].conditionalCreate = true
* rest.resource[=].conditionalUpdate = true
* rest.resource[+].type = #Device
* rest.resource[=].supportedProfile = Canonical(CycleTrackingDevice)
* rest.resource[=].interaction[+].code = #create
* rest.resource[=].interaction[+].code = #update
* rest.resource[=].interaction[+].code = #read
* rest.resource[+].type = #Provenance
* rest.resource[=].supportedProfile = Canonical(MenstrualDataProvenance)
* rest.resource[=].interaction[+].code = #create
* rest.resource[=].interaction[+].code = #read
* rest.resource[+].type = #ServiceRequest
* rest.resource[=].supportedProfile = Canonical(MenstrualCycleTrackingServiceRequest)
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[+].code = #search-type

Instance: menstrual-patient-app-sender
InstanceOf: CapabilityStatement
Usage: #definition
Title: "Menstrual Patient App Sender Capability Statement"
Description: "Requirements for a patient-authorized application that submits menstrual cycle data to a FHIR server."
* url = "https://example.org/fhir/uv/menstrual-cycle/CapabilityStatement/menstrual-patient-app-sender"
* name = "MenstrualPatientAppSender"
* title = "Menstrual Patient App Sender Capability Statement"
* status = #draft
* experimental = true
* date = "2026-07-13"
* kind = #requirements
* fhirVersion = #4.0.1
* format = #json
* rest.mode = #client
* rest.documentation = "The patient app submits standard FHIR transaction Bundles using patient-authorized SMART access. Device resources are optional."
* rest.security.service = $RestfulSecurityService#SMART-on-FHIR "SMART-on-FHIR"
* rest.interaction.code = #transaction
* rest.resource[+].type = #Observation
* rest.resource[=].supportedProfile[+] = Canonical(MenstrualPeriodObservation)
* rest.resource[=].supportedProfile[+] = Canonical(MenstrualFlowObservation)
* rest.resource[=].supportedProfile[+] = Canonical(BasalBodyTemperatureObservation)
* rest.resource[=].supportedProfile[+] = Canonical(WearableSkinTemperatureObservation)
* rest.resource[=].supportedProfile[+] = Canonical(TemperatureBaselineDeviationObservation)
* rest.resource[=].interaction[+].code = #create
* rest.resource[=].interaction[+].code = #update
* rest.resource[+].type = #Device
* rest.resource[=].supportedProfile = Canonical(CycleTrackingDevice)
* rest.resource[=].interaction[+].code = #create
* rest.resource[=].interaction[+].code = #update
* rest.resource[+].type = #Provenance
* rest.resource[=].supportedProfile = Canonical(MenstrualDataProvenance)
* rest.resource[=].interaction.code = #create
* rest.resource[+].type = #ServiceRequest
* rest.resource[=].supportedProfile = Canonical(MenstrualCycleTrackingServiceRequest)
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[+].code = #search-type

Instance: menstrual-cloud-sender
InstanceOf: CapabilityStatement
Usage: #definition
Title: "Menstrual Cloud Sender Capability Statement"
Description: "Requirements for a pre-authorized vendor cloud service that submits menstrual cycle data to a FHIR server."
* url = "https://example.org/fhir/uv/menstrual-cycle/CapabilityStatement/menstrual-cloud-sender"
* name = "MenstrualCloudSender"
* title = "Menstrual Cloud Sender Capability Statement"
* status = #draft
* experimental = true
* date = "2026-07-13"
* kind = #requirements
* fhirVersion = #4.0.1
* format = #json
* rest.mode = #client
* rest.documentation = "The cloud sender submits standard FHIR transaction Bundles using pre-established organization-to-organization authorization and patient mapping. Device resources are optional."
* rest.security.service = $RestfulSecurityService#SMART-on-FHIR "SMART-on-FHIR"
* rest.interaction.code = #transaction
* rest.resource[+].type = #Observation
* rest.resource[=].supportedProfile[+] = Canonical(MenstrualPeriodObservation)
* rest.resource[=].supportedProfile[+] = Canonical(MenstrualFlowObservation)
* rest.resource[=].supportedProfile[+] = Canonical(BasalBodyTemperatureObservation)
* rest.resource[=].supportedProfile[+] = Canonical(WearableSkinTemperatureObservation)
* rest.resource[=].supportedProfile[+] = Canonical(TemperatureBaselineDeviationObservation)
* rest.resource[=].interaction[+].code = #create
* rest.resource[=].interaction[+].code = #update
* rest.resource[+].type = #Device
* rest.resource[=].supportedProfile = Canonical(CycleTrackingDevice)
* rest.resource[=].interaction[+].code = #create
* rest.resource[=].interaction[+].code = #update
* rest.resource[+].type = #Provenance
* rest.resource[=].supportedProfile = Canonical(MenstrualDataProvenance)
* rest.resource[=].interaction.code = #create
* rest.resource[+].type = #ServiceRequest
* rest.resource[=].supportedProfile = Canonical(MenstrualCycleTrackingServiceRequest)
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[+].code = #search-type
