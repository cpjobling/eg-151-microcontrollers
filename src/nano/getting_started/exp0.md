# Experiment 0: Getting Started

## 1. Introduction

Microcontrollers are an important topic for the Electronics Engineer. So
many modern devices have a microcontroller at their core, even
apparently "dumb" products such as toasters and electric fans.
Specifying the right microcontroller for a specific task is a useful
skill, so in our Electronic and Electrical Engineering degree programme
you will be exposed to a number of different microcontrollers.

As an introduction to the subject, we shall learn how to programme a
popular 8-bit microcontroller in the [C programming
language](<https://en.wikipedia.org/wiki/C_(programming_language)>){.instructure_file_link
.inline_disabled}. The specific microcontroller we shall be using is the
[Arduino
Nano](https://www.arduino.cc/en/pmwiki.php?n=Main/ArduinoBoardNano){.instructure_file_link
.inline_disabled}, a low-cost board with a range of useful features.
Before we can programme it, however, we shall have to install the
Arduino Integrated Development Environment (IDE) onto your computer.
Fortunately, the IDE has been produced in several versions, which can be
run on Linux, Windows, and Apple computers.

A vast amount of information about the Arduino project can be found on
their website,
[**Arduino**.cc](https://www.arduino.cc/){.instructure_file_link
.inline_disabled}, including downloads for the IDE.

Our friends in the Swansea Hackspace have an extensive web site, which
also offers guidance on getting started with Arduino projects. Their
website can be found at
"[swansea.hackspace.org.uk](https://swansea.hackspace.org.uk){.instructure_file_link
.inline_disabled}". If you click on "Activities" followed by "Learning"
you will be offered a range of tutorials, including one on the Arduino.
Click on "Introduction to Arduino"
\[[link](http://swansea.hackspace.org.uk/Tutorials/ArduinoIntro){.instructure_file_link
.inline_disabled}\] and you will find a detailed description of the
device. You may find it useful to read through some of these pages
before starting on the installation procedure detailed below.

2. Windows

---

Modern Windows 10 machines are capable of finding the necessary driver
for the CH340 interface chip automatically. A good strategy would be to
start the Windows 10 machine, and when it is ready plug in the Arduino
Nano board using the supplied lead. After a few minutes, type **Device
Manager** into the search box, and run the application offered to you.
You should see a list of devices, including "Ports (COM and LPT)". Click
on this item, and look at the lines following. One of these should read
"USB-SERIAL CH340 (COM5)" or similar. Make a note of the COM port number
and close the Device Manager.

Next, unplug the Arduino Nano board. Go to
**[Arduino.cc](https://arduino.cc){.instructure_file_link
.inline_disabled}** and select the tab "Software" followed by
"Downloads".

![Downloads menu selected from the main Arduino page:
https://www.arduino.cc.](https://canvas.swansea.ac.uk/courses/15930/files/1306068/preview)

This will bring up a new page of options.  Move past the instructions
for "Arduino Web Editor", and look at the section titled "Download the
Arduino IDE".

![Install software page (https://www.arduino.cc/en/Main/Software) with
installer options
highlighted.](https://canvas.swansea.ac.uk/courses/15930/files/1306083/preview)
Look on the right hand side, and click on "Windows Installer for Windows
7 and up", which is the first item in the list. When the installation
file has finished downloading return to the previous page using "back"
on your browser. In the section marked "Download the Arduino IDE" you
will see the words "Getting Started" in small blue text.

![Web page with getting started and installation instructions:
https://www.arduino.cc/en/Guide.](https://canvas.swansea.ac.uk/courses/15930/files/1306094/preview)
Click on this link, and then select "Windows" from the list. Follow the
detailed instructions to start the installer. There will follow quite a
lengthy installation procedure, during which you will be offered
additional drivers for other members of the Arduino family, including
the boards offered by the company Adafruit. We recommend installing
these additional drivers. When the installation is complete, plug in the
Arduino Nano board and click on the "Arduino IDE" icon that has appeared
on your desktop.

3. Linux

---

Fortunately, all Linux systems have the necessary drivers in place
already, so it is only necessary to install the Arduino IDE application.
Go to [**Arduino.cc**](https://arduino.cc){.instructure_file_link
.inline_disabled} and select the tab "Software" followed by "Downloads".
This will bring up a new page of options. Move past the instructions for
"Arduino Web Editor", and look at the section titled "Download the
Arduino IDE". Look on the right-hand side, and click on "Linux 32 bits"
or "Linux 64 bits" as appropriate. When the installation file has
finished downloading return to the previous page using "back" on your
browser. In the section marked "Download the Arduino IDE" you will see
the words "Getting Started" in small blue text. Click on this link, then
select "Linux" from the list. Follow the detailed instructions to start
the installer.

There will follow quite a lengthy installation procedure, involving
unpacking the **tar** file, and running the script "install.sh", either
from the command line or using "Run in terminal" from "Files". During
the installation, you will be offered additional drivers for other
members of the Arduino family, including the boards offered by the
company Adafruit. We recommend installing these additional drivers. When
the installation is complete, plug in the Arduino Nano board and click
on the "Arduino IDE" icon that has appeared on your desktop.

4. Apple Mac OS X

---

[Once again, go to
[**Arduino.cc**](https://arduino.cc){.instructure_file_link
.inline_disabled} and select the tab "Software" followed by "Downloads".
This will bring up a new page of options. Move past the instructions for
"Arduino Web Editor", and look at the section titled "Download the
Arduino IDE". Look on the right-hand side, and click on "Mac OS X".
Download the installation file. Then return to the previous page, locate
the words "Getting Started" in blue, and select "Mac OS X". Follow the
installation instructions carefully.
]{style="font-family: inherit; font-size: 1rem"}

5. On the Blink

---

[When you are satisfied that the Arduino IDE has been successfully
installed, run the application. Assuming that the installation procedure
described above has gone to plan, and after the splash screen, the
Arduino IDE main screen appears. Plugin the Arduino Nano using the
supplied lead. Next look at the commands on the top line. Identify
**tools**, and look at the drop-down menu. The settings should be as
follows: Board: "Arduino Nano". Processor: "Atmega328P". Port: depending
on the operating system, could be "/dev/ttyUSB0" (Linux) or "COM 5"
(Windows) or something along those lines. The selected port will be
ticked. Other settings in **tools** can remain the same.
]{style="font-family: inherit; font-size: 1rem"}

[The first programme we shall run rejoices in the unlikely name of
**Blink**. Click on **File** and select **Examples** from the drop-down
menu. A further menu appears, with all the example programmes. Select
**01.Basics**, followed by **Blink**. The programme appears in a new
dialogue box. The programme at this stage is just text. It needs to be
**compiled** in order to create an executable
file.]{style="font-family: inherit; font-size: 1rem"}

[Identify the icon for compiling the programme, this is a tick in a blue
circle which is called **Verify** on the Arduino IDE. Click this once,
and after a short period of time the message "Done compiling" should
appear near the bottom of the window. Hopefully, as we are compiling an
example programme, there will be no errors! If there are errors,
information on the type of error and where it has occurred in the
programme can be found in the dialogue box near the bottom of the
window.]{style="font-family: inherit; font-size: 1rem"}

[![Arduino editor open with Blink.c programme ready for compilation and
uploading.](https://canvas.swansea.ac.uk/courses/15930/files/1306098/preview)
]{style="font-family: inherit; font-size: 1rem"}

[Next, we need to transfer the executable file to the Arduino Nano
board. This is done by identifying the icon Upload, which is a right
arrow in a blue circle, and clicking it once. Annoyingly, the IDE
insists on re-compiling the programme. If all has gone to plan, the
message "Done Uploading" appears. Then after a few seconds, the
executable file starts running on the Nano board. One of the LEDs begins
flashing at a regular rate, one second on, one second off.
]{style="font-family: inherit; font-size: 1rem"}

6. Modifying Blink

---

So far, so good. Now, let us try changing the programme. Look at the
text screen, the "source code". You will find two instances of the
instruction "**delay(1000)**". Move the cursor and change the argument
of the two instructions to "100". Now, with your new-found knowledge,
re-compile the programme and upload it to the Nano. When the message
"Done Uploading" appears, look at the LED on the Nano. It should be
flashing at ten times the previous rate. Congratulations! You have
successfully edited the programme. If you like, you can save the edited
programme by clicking on **File**, selecting "**Save As**" and when the
dialogue appears, give the programme a new name, for example "myblink".

We are now ready to start the main part of the suite of experiments.
However, before we do, there is an additional task to perform. This is
the **Laboratory Introduction** or at least part of it. This will be
explained in [Experiment
1](https://canvas.swansea.ac.uk/courses/15930/files/1303288/download?wrap=1){#1303288
.instructure_file_link .instructure_scribd_file}.

7. Assessment of the Take-Away Laboratory

---

The Take-Away Laboratory consists of this introduction, plus five,
assessable experiments. The mark for each of the experiments is 5
maximum, making a total of 25 marks -- 25% of the assessment for the
whole module.

Assessment will be based on a Laboratory Diary. Many other lab based
modules are assessed this way, including EG-152 Electronic Circuits next
term, and the two practical abs in second year, EGA222 and EGA223.

What is a laboratory diary? In the "old days" this would have taken the
form of a hard-backed notebook, and all results, calculations, and other
details of the experiments would be meticulously written in the diary.
This is the 21st Century, and we now use an electronic lab diary. This
takes the form of a Word document or similar, in which all the details
of an experiment are recorded. This might include tables of results,
graphs or calculations based on the results, screenshots from the Lab PC
or the R&S oscilloscope, photos of the equipment, anything that helps
someone reading the diary to see what was done. In addition, if you are
asked to write a report on a particular subject (for example, in EG-152,
EGA222 and EGA223) then the lab diary is the source of information for
each experiment. You should not need to go back to the laboratory to
repeat parts of the experiment.

The script for each of the experiments will tell you what is required
for each experiment. In general, this will be programme listings
(properly formatted and with copious comments, of course!) and some
measurements and calculations based on the results. The lab diary will
be submitted later in the term for assessment. It is a good idea to
convert the final version of the diary to PDF, so that we see your
document without changes caused by printer drivers, different versions
of WORD, and so on.

Good luck with the Take-Away Laboratory!

Dr. Chris Jobling, Module Coordinator\
Dr. Timothy Davies, Module Lecturer\
Dr. Ben Clifford, Module Lecturer

8. The Arduino Nano mounted on an empty Plug-In Breadboard

---

**![The Arduino Nano mounted on an empty Plug-In
Breadboard.](https://canvas.swansea.ac.uk/courses/15930/files/1306062/preview)
Key**: \"Rx\", \"Tx\" are LED indicators for serial communication.
\"Pow\" is the power LED. \"L\" is an LED connected to digital port
\#13.
