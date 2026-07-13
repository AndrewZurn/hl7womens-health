### Privacy and Security

Menstrual cycle data is sensitive reproductive-health information. Implementers
should minimize collected data, preserve source attribution, and avoid inferring
diagnoses or predictions from diary entries.

### Data Minimization

Senders should submit only the observations needed for the user's configured
exchange purpose. Predictions, fertility windows, and inferred diagnoses are out
of scope for this release.

### Source Attribution

Patient-entered diary data, manually measured basal body temperature, wearable
measurements, and vendor-derived baseline deviations have different reliability
and interpretation. Provenance and method information should preserve those
distinctions.

### Device Identifiers

Device identifiers, serial numbers, and UDI values are optional. Senders should
avoid sending durable device identifiers unless they are necessary for the use
case and permitted by user authorization and applicable policy.

### Authorization

SMART authorization scopes determine technical API access. They do not replace
patient consent, data-sharing agreements, or receiver policy for clinical review
and storage.

### Receiver Policy

Receivers are responsible for documenting how accepted patient-generated data is
reviewed, displayed, incorporated into records, retained, or deleted. A
successful API response does not imply clinical review.
