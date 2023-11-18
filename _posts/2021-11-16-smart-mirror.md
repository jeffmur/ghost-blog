---
layout: post
current: post
cover:  assets/images/mirror-cover.png
navigation: True
title: Smart Mirror
date: 2021-11-16 10:00:00
tags: [project]
class: post-template
subclass: 'post'
author: jeffmur
---
DIY Google Assistant Smart Mirror with Facial Recognition

Demo video on [YouTube](https://www.youtube-nocookie.com/embed/5QshXc3VS9g?si=4Gim9wFBZNtskzex)


<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/5QshXc3VS9g?si=4Gim9wFBZNtskzex" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>


## Overview

The goal of this project was to develop a system that combines open-source tools for a customizable interface and adds a security layer for sensitive data access. The Smart Mirror features Facial Recognition to identify users in front of the device and allows customization of content with voice control. This product ensures privacy by performing facial recognition locally and using a local wake word engine to activate the assistant.

Through the integration with Google Cloud Platform, the mirror quickly authenticates users and displays their personalized interface. The hardware chosen for this project offers a competitive price compared to similar products, and the software is designed to be compatible with various devices to reduce overall costs. The project stands out for its ability to process voice commands, control screen and volume settings, and provide fast responses via its speaker system.

In summary, the Smart Mirror is an innovative and cost-effective solution that offers enhanced security and personalized user experiences.

## Source Control

This project contains 6 components split amongst two devices, Jetson Nano 2GB and Raspberry Pi 4. The project root, [Smart Mirror](https://github.com/jeffmur/Smart-Mirror), provides a high level overview of the system.

| Component | Purpose | Device
| --- | --- | --- |
| [face_recog](https://github.com/jeffmur/Smart-Mirror/tree/main/face_recog) | Facial Recognition event publisher | Jetson Nano
| [firebase-smarthome](https://github.com/jeffmur/Smart-Mirror/tree/main/firebase-smarthome) | Firebase Configuration and Sync Node | Raspberry Pi
| [MagicMirror](https://github.com/MichMich/MagicMirror) | User Interface | Raspberry Pi
| [MMM-DeviceControl](https://github.com/jeffmur/MMM-DeviceControl) | Smart TV - Volume & Display control | Raspberry Pi
| [MMM-GoogleAssistant](https://github.com/jeffmur/MMM-GoogleAssistant) | Embedded Assistant api v2 | Raspberry Pi
| [MMM-ProfileSwitcher](https://github.com/jeffmur/MMM-ProfileSwitcher) | Google Pub/Sub subscriber for events | Raspberry Pi


## Whitepaper
For CSS 532, Internet of Things, a research component was required to justify the design, compare to other products in the market, and analyze the performance of our system.

<object data="/assets/pdf/532-smart-mirror.pdf" type="application/pdf" width="800px" height="800px">
    <embed src="/assets/pdf/532-smart-mirror.pdf" type="application/pdf">
        <p>This browser does not support PDFs. Please download the PDF to view it: <a href="/assets/pdf/532-smart-mirror.pdf">Download PDF</a>.</p>
    </embed>
</object>
