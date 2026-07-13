# Menstrual Cycle Data Exchange Implementation Guide

This repository contains a draft FHIR R4 Implementation Guide for exchanging
patient-generated menstrual period diary and optional temperature data with a
FHIR server.

The package ID and canonical URL use `example.org` and are temporary. They must
be replaced before publication. Licensing is also unresolved and no license is
granted by this draft repository.

## Prerequisites

- Java 17 or newer
- SUSHI
- HL7 FHIR IG Publisher

The development container uses the `hl7fhir/ig-publisher-base` image. This
workspace also expects the Publisher JAR at `../publisher.jar`.

## Build

```sh
sushi .
java -jar ../publisher.jar -ig .
```

The generated guide is written to `output/`. Review `output/qa.html` after each
Publisher build.
