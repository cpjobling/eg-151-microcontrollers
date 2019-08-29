# EG-151 Microcontrollers

## Assessment and Feedback Brief

Dr C.P. Jobling
Dr T. Davies
Dr B.R. Clifford

August 2019

(c) College of Engineering, Swansea University -- All Rights Reserved

## Introduction

EG-151 Microcontrollers is a 10-credit module running in the first semester. It is intended to give you a grounding in the use of an 8-bit microcontroller, and takes you from some simple assembly language programmes to a mini-project which addresses a real engineering task. Assessment is by means of lab exercises, a class test, and a mini-project.

Full documentation of practical component for each component are provided in the **Module Content** section of the **My Studies** (Blackboard) site for EG-151. Practice test questions will be made available in the **Assessment and Feedback** section of the module site.

## Summary of assessment

Laboratory Introduction (15%) + Class test (30%) + Laboratory work (20%) + Mini-project (35%)

----

## Delivery Method

### Laboratory Introduction

Laboratory sessions during induction week and the first three weeks of term will be used for a laboratory introduction exercise.

The laboratory introduction is **COMPULSORY** and must be passed by all students as a pre-condition to working in the Electronics laboratory.

Components of the laboratory introduction are as follows:

* Health and safety
* Breadboard construction exercise
* Circuit Simulation using National Instruments Multisim
* Soldering exercise

### Lectures and Lab Work

There will be one lecture a week on the architecture of the target microcontroller, in parallel with two lab sessions a week. The laboratory work will be assessed during lab sessions and up to 20% of the module mark is available for the successful completion of the lab exercises.

The lecture course and the laboratory work will be assessed by a computer-based class test worth 30%.

### Miniproject

You will use the knowledge gained in the lectures and lab work to develop a electronic measurement device with an external sensor for input, signal processing in the microcontroller and output of results via an LED display. The Mini-project will be assessed by a demonstration of the completed project and a short report.

----

## Intended Learning Outcomes

As a module in an IET Accredited Degree Scheme, the following AHEP 3 learning outcomes (LOs) [1] are addressed:
SM1, SM2, EA1-EA4, D3, EP2 and EP3.

After completing this module you should be able to:

| LO  | Learning Outcomes for lab introduction mapped to AHEP 3. |
|-----|----------------------------------------------------------|
| LO1 | Familiarisation with laboratory instruments and software. (EP2)
| LO2 | Experience in various construction techniques, including soldering. (EP3) |
| LO3 | Practice in recording and analysing laboratory measurements. (EP3) |
| LO4 | Describe the numerical systems used by microprocessors (SM2).  |
| LO5 | Describe and analyze the operation of a microcontroller in order to explain what different instructions are used for and how they are executed (EA1, SM1). |
| LO6 | Understand, modify, extend, execute and debug simple programs in both assembly language and C (EA2). |
| LO7 | Use a development environment to simulate, implement and commission an embedded system and the use of Electronic measurement equipment (EA3, EP2). |
| LO8 | apply the skills developed in the module to design the hardware and software for a simple application. (EA4, D3). |

## Types of assessment

| **Assessment** -> |  Practical | Laboratory | Mini-Project | Class Test 1 |
|-------------------|------------|------------|--------------|--------------|
| *Type* | Individual | Pair | Group | Individual |
| *Weighting* |  15% | 20% | 35% | 30% |
| *Learning Outcomes* | LO1-LO3 | LO6, LO7 | LO8 | L04, L05 |
| *Submission Date* | 17 October 2019 | 24 Oct-21 November | 9th and 12th December | 5th December |
| *Feedback Type* | Oral | Oral | Oral and Written | Electronic |
| *Feedback Date* | 7th November | Immediate | 2nd January | Immediate |


## Assessment details

### Laboratory induction

The maximum mark for laboratory introduction is 15 awarded as follows:

* Testing of circuit using plug-in breadboard and National Multisim – Max 5 marks.
* Answers to questions at the end of the laboratory introduction script – Max 5 marks.
* Construction of Tic-Tac box continuity tester – Max 5 marks.

Marking is done and feedback is given by the chief Electronics technician.

----

### Laboratory exercises

There are four laboratory exercises and each is marked out of 5 using the rubric given below. The marking is done by an oral interview at the workspace by module tutors and demonstrators. Feedback will be given immediately.

| Marks | Criteria |
|-------|----------|
| 2 Novice | Modified program is functioning. |
| 3 | Being able to explain the modified section with hint/help from tutor/demonstrator. |
| 4 | Being able to explain the modified section without prompting. |
| 5 Mastery | Demonstrate complete understanding of the modified program through Q/A |

### Miniproject

Assessment criteria for mini project (lab assessment, out of 10):

| Marks | Criteria |
|-------|----------|
| 4 | Project specifications achieved. |
| 5-7 |  Project specifications achieved and you are able to explain the program. |
|  8-10 | Project specifications achieved and you are able to explain the program and successfully answer detailed questions related to the project. |


Assessment for the mini project (report, out of 15)

| Marks | Criteria |
|-------|-------------|
| 6     | Report contains minimum details. It is difficult to repeat the project with the report. |
| 7-11  | Report is clear and concise. Some details are missing. |
| 12-15 | Report is clear and concise. It contains all details that are required to successfully repeat the project. |

## Timeline for EG-151

**Weeks 1-4**: Laboratory introduction. Students enrolling on the Electrical and Electronic degree programmes come from a wide range of backgrounds. Some students will have taken a technology based course in their previous education, and in consequence they will have some familiarity with electronic components and embedded microcontrollers. Other students will have little or no experience of practical electronics. The laboratory introduction gives everybody an experience of using electronic components in a practical circuit, use of laboratory instruments, and an introduction to simulation software. The laboratory introduction starts in induction week (week 1) and will continue for the first three weeks of teaching. It will make use of both the weekly timetable slots.  Assessment of the laboratory introduction is partly “on the spot” in the case of the Tic-Tac construction. The lab diary will be assessed at the end of the exercise. The laboratory introduction is worth 15% of the module.

**Weeks 2 to 12**: Formal lectures. There is one lecture per week, starting at 12 noon on Monday afternoons. This lecture includes the architecture of a typical 8-bit microcontroller, and how the internal registers permit different programming structures. Initially examples will be in assembly language, but will move towards embedded “C” as the module progresses. Review and preparation for the class test will be given in Week 10; feedback on the class test will be given in Week 12.

**Weeks 5 to 8**: Following the laboratory introduction, students will embark on a series of experiments designed to build experience in programming the target microcontroller, and the use of an Integrated Development Environment to debug their programmes. Assessment and feedback will be carried out at the laboratory bench by teaching staff and demonstrators. This part of the module is worth 20% of the total.

**Week 8**: Briefing about the Mini-Project. This will include assignment of project titles and grouping  of pairs of laboratory partners to form a team.

**Weeks 9 to 12**: Mini-Project. All mini-projects will be based on the same core components. This approach has been very successful in Micromouse, where the starting point is the same for all the teams. This year, each Mini Project team will be given a plug-in breadboard, a HCS08QG8 microcontroller and a LCD alphanumeric display, capable of two lines of 16 characters. A suggested layout will be provided, showing how to connect the microcontroller to the LCD using the minimum number of pins. A demonstration programme will also be provided to show how the LCD can be updated with ASCII characters.

Each Mini Project team must decide on an application for these core components, for example a digital multimeter, a frequency meter, an ultrasonic rangefinder, and so on. In each case, additional hardware and firmware must be connected to the core components to achieve the chosen application.

Starting from the demonstration programme, it is possible to write a programme which converts numeric data into ASCII characters. The data could come from the built-in ADC, or from some form of sensor such as an ultrasonic rangefinder. Each team will decide on the method of converting and presenting the information on the LCD.

**Week 11**: The **class test** carries 30% of the module mark. It will be based on the taught material from the lecture course and experience from the laboratory exercises. Many of the questions will be of the form, “what bits will be set on Port X if the following lines of code are executed” and will require detailed understanding of the operation of the microcontroller.  The class test will be delivered electronically via Blackboard and feedback will therefore be immediate aside from any text or essay questions that will have to be manually marked.

**Week 12**: Assessment of mini-project. Part of the assessment will be a demonstration at the laboratory bench. Teams will also be required to submit a short on-line report.

## Specific rules for passing this module:

This module is assessed by a combination of Class Test and practical assessment.  In order for the practical assessment marks to count, you must achieve at least 30% in the Class Test.  If you achieve less than 30% in the Class Test, then the module mark will be just the Class Test mark.

## Note

1. For a detailed explanation of AHEP 3 learning outcomes, see the references mentioned on page 5 of the Undergraduate Student Handbook for the BEng/MEng in Electronic and Electrical Engineering, 2019-2020.
