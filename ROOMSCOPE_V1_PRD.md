# RoomScope V1 Product Requirements

## Product decision

Proceed with **RoomScope** as the working product direction: an iOS/iPadOS-first room-by-room survey app for smart home, low-voltage, AV, security, lighting, networking, and automation professionals.

The app should replace Apple Notes for walkthroughs and complement, not replace, CompanyCam.

## Core problem

Current workflow:
- Apple Notes captures unstructured survey notes.
- CompanyCam captures job photos, especially pre-sheetrock conditions.
- Neither creates a structured room-by-room record of homeowner requests that an estimator can reliably use.

Pain:
- Owner-specific requests and preferences are easy to miss.
- Survey details do not reliably transfer to estimating.
- Photos are not enough; the missing layer is intent, scope, and room-level decisions.

## Target user

Primary:
- Home automation / smart home professionals.
- Low-voltage contractors.
- AV installers.
- Security/camera installers.
- Lighting/shade installers.
- Networking/Wi-Fi installers.
- Control4 dealers.

Primary downstream user:
- Estimator.

Secondary recipients:
- Homeowner/customer.
- Project manager.
- Installer/technician.
- Builder.

## Positioning

Short:
> Room-by-room site surveys for home technology pros.

Long:
> Capture homeowner requests, room options, photos, and estimator notes during a walkthrough, then generate a clean customer-facing survey summary and technical estimator appendix.

## V1 outcome

A user can:
1. Create a project.
2. Enter project-level infrastructure details.
3. Choose a template: New Construction Smart Home or Retrofit Smart Home.
4. Add/select rooms.
5. For each room, select relevant systems and answer simple prompts.
6. Capture owner requests and estimator flags.
7. Attach optional photos.
8. Generate a combined PDF:
   - Customer-facing summary first.
   - Technical estimator appendix second.

## Non-goals for V1

Do not build:
- CRM.
- Scheduling.
- Invoicing.
- Full estimating/pricing.
- Payment collection.
- Proposal signing.
- Team permissions.
- Cloud sync/backend.
- CompanyCam replacement.
- Drawing/floor-plan engine.

## Platform recommendation

Primary app:
- Native iOS/iPadOS.
- SwiftUI.
- SwiftData/local-first storage.
- PDF export.
- Share sheet.
- Photo attachment support.

Existing Rails `houseplan` project:
- Use as concept archive, landing page, future web dashboard, or backend later.
- Do not make it the primary MVP unless validation changes.

## Pricing hypothesis

Solo:
- $9/month or approximately $99/year.

Team/company:
- $49/month entry team plan.
- $99/month possible team/pro plan.

Validate willingness to pay with target users before adding billing.

## Project-level intake fields

Core fields:
- Customer name.
- Address.
- Builder.
- Project type: New Construction or Retrofit.
- Rack/equipment location.
- Internet provider location.
- Electrical panel location.
- Timeline.
- Homeowner priorities.
- Preferred control system.
- General notes.

Budget/proposal approach:
- Optional because homeowners are often reluctant to provide budget.
- Phrase as “Proposal approach” rather than direct budget.

Suggested options:
- Not discussed.
- Budget sensitive.
- Keep it minimal.
- Balanced recommendation.
- Best/future-ready system.
- Phased approach preferred.
- Customer has not shared budget.
- Custom note.

Preferred control system options:
- Control4.
- Lutron only.
- Sonos.
- Savant.
- Crestron.
- Apple Home.
- Home Assistant.
- Existing system.
- Unknown / to be determined.
- Other.

## Default rooms / areas

- Foyer.
- Kitchen.
- Dining Room.
- Living Room.
- Family Room.
- Office.
- Primary Bedroom.
- Bedroom.
- Bathroom.
- Theater/Media Room.
- Gym.
- Garage.
- Basement.
- Utility/Mechanical Room.
- Equipment Room / Rack.
- Patio / Outdoor.
- Pool Area.
- Driveway.
- Front Exterior.
- Rear Exterior.
- Left Side Exterior.
- Right Side Exterior.
- Custom Room / Area.

Must support adding custom rooms/areas.

## Room-level systems

Each room can have multiple systems selected.

Systems:
- Network / Wi-Fi.
- TV / Video.
- Cameras.
- Security.
- Life Safety.
- Lighting / Lutron.
- Shades.
- Audio.
- Surround Sound.
- Control4.
- Wiring / Prewire.
- Existing Equipment.
- General Owner Requests.
- Photos.

## Universal pattern for every system card

Every system card should include:
- Status: Not Needed, Requested, Future Phase, Needs Discussion.
- Customer-visible note.
- Internal estimator note.
- Owner request.
- Flag for estimator.
- Optional photo attachment.

Estimator flag is a core V1 feature.

## System prompts

### Network / Wi-Fi

Questions:
- Does this room require wiring for TV?
- Does this room require wiring/support for Wi-Fi?
- Data drop needed?
- Quantity/location note.
- Wi-Fi concern/problem area note.
- Estimator note.
- Flag for estimator.

### Cameras

Questions:
- Camera needed?
- Location type: Exterior or Interior.
- Coverage goal:
  - Front door.
  - Driveway.
  - Garage.
  - Backyard.
  - Pool.
  - Side yard.
  - Patio/deck.
  - Interior room.
  - Other.
- Mounting/location note.
- Visibility/privacy concern note.
- Estimator note.
- Flag for estimator.

### Security

Questions:
- Door contact needed?
- Window contact needed?
- Motion detector needed?
- Notes about specific doors/windows.
- Estimator note.
- Flag for estimator.

### Life Safety

Questions:
- Monitored smoke detector needed?
- Monitored CO detector needed?
- Combo smoke/CO?
- Location note.
- Estimator note.
- Flag for estimator.

### Lighting / Lutron

Questions:
- Lutron lighting control needed for this room?
- Control type:
  - Dimmer.
  - Switch.
  - Keypad.
  - Scene control.
  - Unknown / determine later.
- Keypad/control location note.
- Scene or homeowner preference note.
- Estimator note.
- Flag for estimator.

### Shades

Questions:
- Motorized shades needed?
- Quantity of windows/openings.
- Power/wiring needed?
- Future phase?
- Fabric/privacy/light-control notes.
- Estimator note.
- Flag for estimator.

### Audio

Questions:
- Audio zone needed?
- Speaker count:
  - 2-speaker zone.
  - 4-speaker zone.
  - Other.
- Zone type:
  - Indoor.
  - Outdoor.
- Speaker type/location note.
- Estimator note.
- Flag for estimator.

### Surround Sound

Questions:
- Surround sound needed?
- Setup type:
  - Sonos.
  - AVR.
  - Unknown.
- TV location note.
- Equipment location note.
- Speaker layout note.
- Estimator note.
- Flag for estimator.

### Control4

Questions:
- Control4 touch panel needed?
- Control4 remote needed?
- Control location note.
- Primary control preference:
  - App.
  - Remote.
  - Touch panel.
  - Keypad.
  - Voice.
  - Unknown.
- Estimator note.
- Flag for estimator.

## Notes visibility

Every note/request should support visibility:
- Include in customer summary.
- Internal only.
- Flag for estimator.

This is important because some notes should reassure the customer, while others are internal estimating/installation concerns.

## PDF output

V1 should generate one combined PDF with two sections.

### Section 1: Customer-facing summary

Purpose:
- Confirm what was discussed.
- Look professional.
- Avoid overly technical/internal details.

Content:
- Project overview.
- Customer name/address.
- Builder.
- Project type.
- Timeline.
- Homeowner priorities.
- Preferred control system.
- Rooms/areas reviewed.
- Requested systems summary.
- Room-by-room customer-visible requests.
- Open questions / next steps.

### Section 2: Technical estimator appendix

Purpose:
- Ensure estimator receives structured room-by-room scope details.
- Prevent missed owner-specific requests.

Content:
- Project infrastructure notes:
  - Rack/equipment location.
  - Internet provider location.
  - Electrical panel location.
- Estimator flags / “Do Not Miss”.
- Room-by-room systems and answers.
- Internal estimator notes.
- Future phase items.
- Needs discussion items.
- Photo appendix.
- Open questions.

## Key MVP differentiator

The killer feature is not generic notes or photos.

The killer feature is:
> Owner-specific requests captured by room/system and flagged for estimator handoff.

## First prototype screens

1. Project List.
2. New Project Intake.
3. Select Template.
4. Room List.
5. Room Detail with system cards.
6. System Detail form.
7. Estimator Flags / Review.
8. PDF Preview / Export.

## Validation script

Show the mockup to target users and ask:

1. Would this replace Apple Notes for your walkthroughs?
2. Would this make estimating easier?
3. What is missing from the room/system checklist?
4. Would you use the customer-facing PDF?
5. Would your estimator trust/use the technical appendix?
6. Would you pay $9/month solo?
7. Would your company pay $49/month for shared templates and reports?
8. What would stop you from using this?

## Build/no-build decision

Proceed to iOS MVP if 5 target users say:
- This would replace Apple Notes or their current unstructured notes workflow.
- Estimator handoff is valuable.
- The combined PDF would be useful.
- They would try a beta on real walkthroughs.

## Immediate next step

Create a clickable HTML mockup of the V1 flow in `/Users/daviddemers/Projects/houseplan/sketches/` before opening Xcode.
