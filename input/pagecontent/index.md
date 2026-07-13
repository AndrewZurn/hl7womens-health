### Introduction

The Menstrual Cycle Data Exchange Implementation Guide defines a small FHIR R4
model for exchanging patient-generated menstrual period diary data and optional
temperature observations with a FHIR server. The first release focuses on
reported period episodes, daily flow intensity, and source attribution.

This draft intentionally uses a temporary `example.org` canonical URL and package
identifier. It is not published by HL7 and does not use an HL7 namespace.
Licensing is unresolved.

### Scope

The required data model supports:

* A menstrual period represented as a grouped episode.
* Daily patient-reported flow intensity values.
* Optional linkage to a clinician-authored or program-authored
  `ServiceRequest`.
* Optional transaction Bundle submission.
* Optional provenance identifying the patient author and app or vendor
  transmitter.

Optional temperature profiles support:

* Basal body temperature measured under basal resting conditions.
* Absolute skin temperature from a wearable device.
* Temperature deviation from a personal baseline, such as a vendor-calculated
  nightly wearable result.
* Optional wearable or thermometer metadata using the Cycle Tracking Device
  profile.

### Actors

#### Patient App Sender

A patient-facing application authorized by the patient to submit diary and
optional temperature data to a FHIR server.

#### Cloud Sender

A vendor or integration service pre-authorized to submit patient-generated data
to a FHIR server after patient association has been established.

#### Menstrual Data Receiver

A FHIR server, such as an EHR FHIR endpoint, that receives conformant menstrual
cycle data resources.

### Non-Goals

This guide does not define:

* Prediction of future periods, fertile windows, or ovulation.
* Diagnosis of abnormal uterine bleeding or other conditions.
* Pregnancy, fetal, or newborn data exchange.
* Patient matching workflows.
* Required clinical reconciliation or legal-record incorporation behavior.
* A custom FHIR operation.
* A requirement to exchange device identifiers, serial numbers, or UDI values.

### Technical Acceptance

A successful FHIR create, update, or transaction response means the receiver
technically accepted the submitted resource. It does not mean the data has been
reviewed by a clinician or incorporated into the legal health record. Receivers
remain responsible for documenting local intake, review, display, reconciliation,
and retention policies.

### IG Dependencies

This guide is based on FHIR R4 and uses terminology from the FHIR specification,
HL7 Terminology, LOINC, SNOMED CT, and UCUM.

{% include dependency-table-short.xhtml %}

### Global Profiles

{% include globals-table.xhtml %}

### Copyrights

{% include ip-statements.xhtml %}

### Package Downloads

{% include cross-version-analysis.xhtml %}
