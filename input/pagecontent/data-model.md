### Overview

The data model separates reported diary facts from measured or vendor-derived
temperature data. This prevents a wearable skin-temperature signal or baseline
deviation from being interpreted as basal body temperature.

### Period Diary

A menstrual period is represented by `MenstrualPeriodObservation`.

* `effectivePeriod.start` is the first reported calendar day of bleeding.
* `effectivePeriod.end` is the last reported calendar day when known.
* `status` may be `preliminary` while the episode is ongoing.
* `status` is normally `final` after the end date is known.
* `hasMember` references one or more `MenstrualFlowObservation` resources.

Daily flow is represented by `MenstrualFlowObservation`.

* `effectiveDateTime` is the diary date.
* `valueCodeableConcept` is one of `spotting`, `light`, `moderate`, or `heavy`.
* These values are patient-selected descriptions, not clinical interpretations.

### ServiceRequest Context

When menstrual tracking is ordered or managed in FHIR, each Observation may
reference `MenstrualCycleTrackingServiceRequest` through `Observation.basedOn`.
When enrollment is established outside FHIR, `basedOn` is omitted and the
Observation remains conformant.

`ServiceRequest` provides workflow context. It does not itself represent patient
authorization or consent.

### Temperature Data

Temperature data is optional. The guide defines three separate profiles because
these values are not clinically interchangeable.

#### Basal Body Temperature

`BasalBodyTemperatureObservation` represents an absolute body temperature
explicitly collected under basal resting conditions. It is appropriate for a
manual basal thermometer or another source that explicitly asserts basal
measurement conditions.

The profile is based on the FHIR R4 Body Temperature profile and uses LOINC
`8310-5`. It also requires the SNOMED CT basal body temperature code as an
additional coding. Oral temperature may be represented with LOINC `8331-1` when
the site is known.

#### Absolute Skin Temperature

`WearableSkinTemperatureObservation` represents an absolute skin temperature
from a wearable device. For nightly or sleep-associated values, senders should
use `effectivePeriod` when the collection interval is available.

This profile does not assert core body temperature or basal body temperature.

#### Temperature Baseline Deviation

`TemperatureBaselineDeviationObservation` represents a temperature difference
relative to an individual's personal baseline. Examples include Oura and Fitbit
nightly relative temperature values.

Temperature deltas use UCUM `K` for Celsius-sized differences. `Cel` must not be
used for deltas because Celsius is an offset scale. Fahrenheit-sized differences
may use UCUM `[degF]`.

### Devices

`CycleTrackingDevice` is optional. `Observation.device` is optional for all
temperature observations.

If a Device resource is sent, it identifies the wearable or thermometer when the
source can provide useful metadata. Serial number and UDI are optional and should
not be required because many consumer APIs do not expose them and because they
can increase re-identification risk.

`Device.patient` may be used for a personally assigned wearable. It should be
omitted for a shared thermometer.

### Provenance

`Observation.performer` identifies who asserted an observation when applicable.
For patient diary entries and manual basal temperature readings, the performer is
normally the patient.

`MenstrualDataProvenance` can identify the patient author and the application or
vendor that transmitted the data. Vendor-derived temperature observations should
include provenance when no Device is supplied.
