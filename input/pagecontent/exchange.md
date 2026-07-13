### Exchange Overview

This guide uses standard FHIR RESTful interactions. It does not define a custom
operation. Senders may submit resources individually or in a standard transaction
Bundle conforming to `MenstrualDataSubmissionBundle`.

### Patient App Sender

A patient-facing app may use SMART App Launch to obtain patient-authorized
access to the receiver's FHIR endpoint. Typical access includes permission to
create or update Observation and Provenance resources, optionally Device
resources, and optionally read ServiceRequest resources.

The patient app must determine the receiver's Patient logical id through launch
context, patient selection, or another receiver-supported workflow before
submitting data.

### Cloud Sender

A cloud sender uses an organization-to-organization authorization model such as
SMART Backend Services. Patient identity and authorization are established by
preconfiguration or another out-of-band process.

The same content profiles apply to patient app and cloud senders.

### Submission Bundles

`MenstrualDataSubmissionBundle` is a FHIR transaction Bundle. Bundle entries may
include:

* `MenstrualPeriodObservation`
* `MenstrualFlowObservation`
* Optional temperature Observations
* Optional `CycleTrackingDevice`
* Optional `MenstrualDataProvenance`

The receiver may reject a bundle or individual entry according to standard FHIR
transaction processing rules and local policy.

### Duplicate Handling

Each Observation must carry a stable source `identifier`. Senders should use
conditional create or update where supported. Receivers should document whether
conditional create and conditional update are supported, which search parameters
are accepted, and how client-supplied identifiers are retained.

### Corrections

Corrections should update the same logical resource when possible. If a receiver
requires replacement rather than update, the sender should mark the incorrect
resource `entered-in-error` or follow the receiver's documented correction
workflow.

### Technical Acceptance

Successful submission confirms technical acceptance only. Receivers may route
accepted data to a patient-generated-data queue, reconciliation workflow, direct
clinical storage, or another documented intake path.

### Error Handling

Receivers should return an `OperationOutcome` when rejecting data. Common reasons
include invalid patient reference, unsupported profile, missing identifier,
invalid flow code, misuse of body temperature codes for wearable baseline
deviation, and unsupported authorization scope.
