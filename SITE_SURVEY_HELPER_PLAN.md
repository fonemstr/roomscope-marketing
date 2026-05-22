# Site Survey Helper / HousePlan Direction

## Recommendation

Turn `houseplan` into an iOS-first product concept for room-by-room site surveys used by home technology professionals.

Working product direction:

> Walk a home room by room, capture what the homeowner wants for audio, video, lighting, shades, networking, Wi-Fi, security, cameras, and control, then generate a clean scope/proposal handoff.

## Why this is attractive

- Founder-market fit: the user has direct domain expertise in home automation, networking, security, lighting, and surveillance.
- Real business pain: missed scope, messy notes, scattered photos, poor sales-to-install handoff, and underquoted work.
- Better pricing potential than consumer iPhone apps: likely $19–$99/month depending solo vs team.
- Existing tools are mostly generic field forms, inspection tools, punch lists, or contractor CRMs; the wedge is vertical-specific room/system templates.

## Existing `houseplan` state

As of this note, the Rails app is a mostly fresh Rails 8 skeleton:

- No root route.
- No app-specific models.
- No app-specific controllers/views.
- No database schema yet.
- No commits yet on `main`.

Use it as a scratchpad/back-office or web companion if needed, not as the primary product foundation.

## Product positioning

Do not position this as a generic survey app.

Better positioning:

- “Room-by-room site surveys for home technology pros.”
- “The walkthrough app for AV, security, lighting, networking, and smart home projects.”
- “Capture homeowner intent before the quote.”

## Target buyers

Start narrow:

1. Home automation / smart home dealers.
2. AV installers.
3. Low-voltage contractors.
4. Security/camera installers.
5. Lighting and shade installers.
6. Networking/Wi-Fi installers.

Expand later to electricians, builders, designers, commercial AV, and other room-by-room estimating workflows.

## MVP scope

The MVP should not include full CRM, estimating, payments, scheduling, or project management.

Build only:

1. Projects
   - customer name
   - address
   - project type: retrofit, remodel, new construction
   - notes

2. Rooms
   - predefined room list
   - custom rooms
   - room-level notes and photos

3. Systems per room
   - audio
   - video/TV
   - lighting
   - shades
   - networking/data
   - Wi-Fi
   - security
   - cameras
   - access control
   - climate/control
   - wiring/prewire

4. System-specific prompts
   - desired features
   - must-have / nice-to-have / future phase
   - existing equipment
   - mounting/wiring notes
   - photos

5. Output
   - internal room-by-room scope summary
   - unanswered questions list
   - photo appendix
   - PDF export
   - CSV/JSON export later

## Recommended architecture

Primary app: native iOS/iPadOS using SwiftUI + SwiftData.

Why:

- Field capture should be fast, offline-capable, camera-friendly, and iPad-friendly.
- iPhone/iPad is more natural during walkthroughs than a web form.
- SwiftData can support a simple local-first MVP.

Possible later web app:

- Use Rails for account/team management, templates, reports, and sync.
- Do not start with full Rails SaaS unless validation demands team/cloud workflows.

## Suggested pricing hypothesis

Solo:
- $19/month or $199/year
- unlimited projects
- room/system templates
- PDF export
- company branding

Small team:
- $49–$99/month
- shared templates
- multiple users
- team project library
- branded exports

Validation should test willingness to pay before implementation.

## Validation sprint

Goal: confirm that people in the trade recognize the pain and would pay for a focused tool.

Interview 10 target users:

- 3 home automation / AV people
- 2 security/camera installers
- 2 low-voltage/networking people
- 1 lighting/shade person
- 1 electrician or GC
- 1 sales/designer/project manager

Questions:

1. How do you currently document walkthroughs/site surveys?
2. What tools do you use: paper, notes, photos, spreadsheets, CRM, forms?
3. What gets missed most often?
4. Who receives the survey output after the walkthrough?
5. What does the estimator/installer need that sales often fails to capture?
6. How are photos tied to rooms/items today?
7. Do you use room-by-room templates?
8. Would a guided room/system checklist save time or reduce mistakes?
9. What export would be most useful: internal scope, customer-facing PDF, equipment count, unanswered questions?
10. Would you pay $19/month as a solo user? $49–$99/month for a team?

Success criteria:

- 7/10 users recognize the workflow pain.
- 5/10 ask to see the prototype or try it.
- 3/10 say they would plausibly pay at least $19/month.
- At least 2 teams say PDF/export/handoff would solve a real problem.

## Prototype before code

Before building the iOS app, create a clickable mockup with these screens:

1. Project list.
2. New project setup.
3. Room list.
4. Room detail with system chips.
5. System checklist with photos/notes.
6. Review/unanswered questions.
7. Generated PDF/report preview.

## First implementation milestone

If validation is positive, build an iOS MVP with:

- SwiftUI app named HousePlan or SiteSurvey Helper.
- SwiftData models: Project, Room, SurveySystem, SurveyItem, PhotoAttachment, Template.
- Local-only storage first.
- PDF export using native iOS PDF rendering.
- Share sheet for sending report via email/messages/files.

No authentication or backend in the first prototype.

## Founder workflow notes from user interview — 2026-05-21

Current workflow:
- User currently uses Apple Notes for site survey notes.
- Photos are captured in CompanyCam, but CompanyCam mainly documents room conditions before sheetrock and does not solve structured room-by-room scope capture.

Primary consumer of survey output:
- The estimator. The first product output should optimize for estimator handoff.

Main pain:
- Many things can be missed, but the most important gap is owner-specific requests and preferences being missed or not clearly transferred to estimating.

Room/system scope:
- All previously listed room/system categories are valid: TV/video, audio/speakers, lighting, shades, networking/data, Wi-Fi, cameras, security, access control, climate/control, power/electrical, wiring/prewire, existing equipment, notes/photos.
- Each room can have multiple options/systems selected.
- App must support default rooms plus custom rooms.

Photos:
- Photos would be valuable even if CompanyCam remains in use.
- Treat photos as supporting survey/report context, not as a full CompanyCam replacement in MVP.

Customer details:
- Customer-specific preferences/details are valuable and should be first-class.

Output:
- A customer-facing PDF summary of the survey would be highly valuable.
- Because the estimator is the main internal recipient, the PDF/report should likely have both customer-facing and estimator/handoff sections or export modes.

Templates:
- Templates are key.

Primary job types:
- New construction.
- Retrofit.
- Full smart home projects including networking, Wi-Fi, cameras, security, life safety, lighting, shades, Control4 automation, and whole-home audio.

Pricing hypothesis from user:
- Solo: approximately $9/month feels reasonable.
- Company/team: approximately $49–$99/month, still to validate.

Implication:
- MVP should prioritize fast room-by-room capture, owner-specific requests, estimator handoff, templates, and a polished customer-facing PDF.

## Initial room checklist details from user — 2026-05-21

These are the first concrete system prompts to encode into the iOS MVP templates.

### Networking / Wi-Fi

For each room, capture:
- Does this room require wiring for a TV?
- Does this room require wiring/support for Wi-Fi?

### Cameras / Security / Life Safety

Cameras:
- Cameras are typically exterior.
- Some projects request interior cameras; app should support interior camera requests by room.

Security:
- Door contacts.
- Window contacts.
- Motion detectors.

Life safety:
- Monitored smoke detectors.
- Monitored CO detectors.

### Lighting / Shades

For each room, capture:
- Is Lutron lighting control needed for this room?
- Are motorized shades needed for this room?

### Audio / Video / Control4

Audio:
- Is this a 2-speaker zone?
- Is this a 4-speaker zone?
- Is the zone indoor or outdoor?

Video / surround:
- Does this room need surround sound?
- If surround is needed, is it Sonos-based or AVR-based?

Control4:
- Does this room need a Control4 touch panel?
- Does this room need a Control4 remote?

Product implication:
- V1 can use simple room-level system cards with yes/no/toggle fields rather than complex freeform forms.
- Every answer should allow an optional note and estimator flag.

## Project-level intake fields from user — 2026-05-21

For a new survey/project, capture:

Required/core:
- Customer name.
- Address.
- Builder.
- Rack/equipment location.
- Internet provider location.
- Electrical panel location.
- Timeline.
- Homeowner priorities.
- Preferred control system.

Budget:
- Budget range is useful but homeowners are often reluctant to answer.
- Treat budget range as optional and phrase carefully.

Product implication:
- New project intake should include these fields before room-by-room survey.
- Rack/equipment, ISP, and electrical panel are project-level infrastructure locations, not just room notes.
- Homeowner priorities should appear prominently in estimator handoff and optionally in the customer-facing PDF.

