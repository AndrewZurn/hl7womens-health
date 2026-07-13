# Menstrual Cycle Data Exchange Implementation Guide

This repository contains a draft FHIR R4 Implementation Guide for exchanging
patient-generated menstrual period diary and optional temperature data with a
FHIR server.

## Status and Disclaimer

This is **not an official Implementation Guide**. It has not been approved,
published, balloted, or endorsed by HL7, Caliper Accelerator, or any other
standards development organization.

This repository is a work-in-progress technical draft intended to support
exploration and discussion for potential Caliper Accelerator-related work
groups. It is also being used as a personal learning exercise to better
understand the FHIR IG publishing lifecycle, including FSH authoring, SUSHI,
the IG Publisher, generated artifacts, and QA review. It should not be cited as
a consensus standard, implementation requirement, procurement requirement,
certification criterion, or official Caliper Accelerator work product.

The package ID and canonical URL use `example.org` and are temporary. They must
be replaced before any formal publication path is pursued. Licensing is also
unresolved and no license is granted by this draft repository.

## Current Status

This IG has an initial SUSHI/FSH implementation for the agreed MVP scope:

- Required menstrual period diary exchange.
- Optional basal body temperature, wearable skin temperature, and vendor baseline-deviation temperature observations.
- Optional wearable or thermometer Device metadata.
- Optional ServiceRequest linkage when tracking is ordered or managed in FHIR.
- Optional Provenance to distinguish patient authorship from app/vendor transmission.
- Patient app, cloud sender, and receiver capability statements.
- Example resources and transaction Bundles for patient-app and cloud-submission paths.

SUSHI has been run successfully with `0 Errors / 0 Warnings`. The full IG Publisher build still needs to be allowed to complete and the generated `output/qa.html` still needs review.

This repository is intentionally structured to provide hands-on experience with
the IG publishing workflow. Some choices may therefore prioritize clarity and
learning value over production-ready governance or publication readiness.

## Prerequisites

- Java 17 or newer.
- SUSHI.
- HL7 FHIR IG Publisher.
- Jekyll, unless using the devcontainer.

The development container uses the `hl7fhir/ig-publisher-base` image and should contain SUSHI, Jekyll, and the IG Publisher JAR at `input-cache/publisher.jar`.

## Build

From the IG root, using the devcontainer:

```sh
devcontainer exec --workspace-folder . /bin/bash -lc 'sushi . && java -jar input-cache/publisher.jar -ig .'
```

If building directly on the host and `../publisher.jar` is available:

```sh
sushi .
java -jar ../publisher.jar -ig .
```

The generated guide is written to `output/`. Review `output/qa.html` after each
Publisher build.

## Implemented Content

### Configuration and Pages

- `sushi-config.yaml`: draft IG metadata, temporary canonical/package, page menu, and Publisher parameters.
- `ig.ini`: points Publisher to the generated ImplementationGuide resource and uses `fhir.base.template#current` so the draft can keep a non-HL7 package ID.
- `input/pagecontent/index.md`: scope, actors, non-goals, and draft caveats.
- `input/pagecontent/data-model.md`: diary grouping, temperature distinctions, optional Device, and Provenance guidance.
- `input/pagecontent/exchange.md`: patient-app and cloud submission workflows, transaction Bundles, duplicate handling, corrections, and error handling.
- `input/pagecontent/privacy.md`: reproductive-health sensitivity, data minimization, source attribution, and receiver-policy boundaries.

### Terminology

- `MenstrualCycleDataCS`: temporary local code system for concepts without verified standard codes.
- `MenstrualFlowIntensityVS`: `spotting`, `light`, `moderate`, `heavy`.
- `CycleTrackingDeviceTypeVS`: smart ring, fitness tracker, wearable temperature sensor, basal thermometer, general thermometer.
- `TemperatureMeasurementMethodVS`: basal resting measurement, nightly wearable aggregate, vendor baseline deviation.
- `TemperatureDifferenceUnitVS`: UCUM `K` and `[degF]` for temperature differences.

### Profiles

- `MenstrualPeriodObservation`: grouped menstrual period episode using `effectivePeriod` and `hasMember` links to daily flow entries.
- `MenstrualFlowObservation`: patient-selected flow intensity for one calendar day.
- `CycleTrackingDevice`: optional wearable or thermometer metadata.
- `BasalBodyTemperatureObservation`: absolute body temperature measured under basal resting conditions.
- `WearableSkinTemperatureObservation`: absolute skin temperature from a wearable device.
- `TemperatureBaselineDeviationObservation`: vendor-calculated temperature deviation from personal baseline.
- `MenstrualCycleTrackingServiceRequest`: optional workflow context for ordered or program-managed tracking.
- `MenstrualDataProvenance`: author and transmitter provenance for diary and temperature submissions.
- `MenstrualDataSubmissionBundle`: standard FHIR transaction Bundle for submission.

### Capability Statements

- `menstrual-data-receiver`.
- `menstrual-patient-app-sender`.
- `menstrual-cloud-sender`.

### Examples

The example set includes:

- Patient and vendor organization.
- ServiceRequest-linked tracking request.
- Completed and ongoing periods.
- Daily flow examples for all flow values.
- Manual thermometer, Oura Ring, WHOOP, and Fitbit devices.
- Basal body temperature with and without Device.
- WHOOP absolute skin temperature.
- Oura and Fitbit temperature baseline deviations.
- Patient-app and vendor-cloud Provenance.
- Patient-app and vendor-cloud transaction Bundles.

## Open Items

### 1. Run Publisher to Completion

Run the devcontainer build command above and let Publisher finish. Then review:

- `output/index.html` for rendered content.
- `output/artifacts.html` for expected generated artifacts.
- `output/qa.html` for validation errors, warnings, broken links, terminology issues, and template issues.

Do not add broad warning suppressions. If a warning is intentionally accepted, document why before suppressing it.

### 2. Resolve Template Strategy

The draft currently uses `fhir.base.template#current` because `hl7.fhir.template#current` requires an HL7-style package ID. Publisher warns that `fhir.base.template` is no longer considered secure.

Before broader use, decide whether to:

- Keep this as a local-only draft with the current template.
- Move to an approved non-HL7 template.
- Convert to an HL7, Caliper Accelerator, or other formal package/canonical only after governance, sponsorship, ownership, and publication path are agreed.

### 3. Replace Placeholder Identity

The following values are placeholders and must be replaced before publication or external distribution. Replacing them does not by itself make this an official IG; formal governance approval would still be required.

- Canonical URL: `https://example.org/fhir/uv/menstrual-cycle`.
- Package ID: `org.example.fhir.uv.menstrual-cycle`.
- Publisher: `Menstrual Cycle Data Exchange Project`.
- Example URLs such as `https://example-cycle-app.example`.

### 4. Decide License

This repository intentionally does not grant a license yet. Before sharing or publishing, select and add an explicit license and confirm that terminology usage is permitted.

### 5. Review Period Grouping Rules

`MenstrualPeriodObservation.hasMember` is currently `1..*`. This works for grouped period episodes with at least one daily flow entry, but may be too strict if implementations need to create an open period before any daily flow entry exists.

Decision needed:

- Keep `hasMember 1..*` to require at least one daily flow observation.
- Relax to `0..*` for an initially open period shell.

### 6. Review Bundle Contents

`MenstrualDataSubmissionBundle` currently permits Observations, optional Device, and Provenance resources. It does not permit submitting the `ServiceRequest` itself.

Decision needed:

- Keep ServiceRequest as a pre-existing receiver-managed resource only.
- Allow ServiceRequest entries in the transaction Bundle for externally created tracking requests.

### 7. Confirm Temperature Semantics

The draft intentionally separates:

- Basal body temperature.
- Absolute skin temperature.
- Temperature deviation from personal baseline.

Review examples and profile constraints against intended Oura, WHOOP, Fitbit, and manual thermometer integrations. In particular, confirm whether the guide should keep Oura/Fitbit values strictly as baseline deviations and never allow them to validate as body temperature.

### 8. Tighten Provenance Requirements

Current Provenance modeling distinguishes author and transmitter, but future review should decide whether Provenance should be required for all submissions or only for vendor/cloud-derived data and app-transmitted bundles.

### 9. Add Negative Test Fixtures

Useful invalid examples or test cases would include:

- Flow observation with a non-allowed flow intensity code.
- Temperature baseline deviation encoded as LOINC `8310-5` body temperature.
- Temperature delta using UCUM `Cel` instead of `K`.
- Basal body temperature missing the basal method.
- Observation without a stable source identifier.

These should be used for local validation/testing but may not belong in the published example set unless clearly marked as invalid examples.

### 10. Governance and Clinical Review

The current IG is a technical work-in-progress for potential Caliper Accelerator-related work group discussion. It is not an official IG and should not be interpreted as representing Caliper Accelerator consensus or direction.

It still needs review by clinical, privacy, patient advocate, app/vendor, EHR implementation, and relevant Caliper Accelerator stakeholders before being considered fit for implementation or any formal standards-development path.

Key review topics:

- Whether the flow value set is sufficient and culturally/clinically appropriate.
- Whether period start/end semantics are clear enough for irregular bleeding.
- Whether receiver policy language is adequate for patient-generated reproductive-health data.
- Whether any jurisdiction-specific reproductive-health privacy rules need explicit guidance.
