![SMRT Link](./img/smrt-link-banner3.png)

<span style="color: #C2007B; font-weight: bold; px;">
    Welcome to the beta release of PacBio’s new SMRT Link documentation site. In a future release, the PDF guides will be retired and replaced by this online resource. We value your feedback, please email  your comments and suggestions to
    <a href="mailto:pacbiosoftwaredocs@pacb.com?subject=%5Binstall.smrtlink.how%5D" style="color: #C2007B; font-weight: bold; text-decoration: underline;">pacbiosoftwaredocs@pacb.com</a>.</span>

---
This site describes the procedure for installing SMRT Link v{{ smrt_link.version }} or SMRT Link Lite v{{ smrt_link_lite.version }}. This site is for IT or SMRT Link administrators.

!!! note
    SMRT Link v{{ smrt_link.version }} and SMRT Link Lite v{{ smrt_link.version }} support Vega™ and Revio® systems. Sequel® II systems, Sequel® IIe systems, and Sequel® systems are not supported.

## What is SMRT Link?
SMRT Link is a web-based end-to-end workflow manager. 

SMRT Link is free PacBio-provided software **required** for instrument management, sequencing run setup/monitoring, and viewing performance metrics. SMRT Link can also *optionally* be configured to run select analysis workflows – depending on compute resources available – by interfacing with existing job management systems (e.g., SLURM).

SMRT Link software operates as a web service hosted on a dedicated **Linux server**, a virtual machine (VM), or by PacBio in the cloud. After installation, users interact with PacBio instruments and analysis workflows through a graphical user interface (GUI). The service is network-accessible, meaning you can connect to it from any computer with a supported web browser on the same network.

![](img/smrtlink-overview-img1.png)

Visit [System Requirements](system-requirements.md) for more information on the prerequisites for installing SMRT Link including hardware (e.g., CPU, RAM, disk space), software (e.g., operating system), and network configurations.

## SMRT Link modules

![](img/smrtlink-overview-img2.png)

## SMRT Link options
SMRT Link is available for both local installation and cloud access, offering flexibility to work in different environments depending on your lab's needs. This guide covers the installation of SMRT Link and SMRT Link Lite, but noting that PacBio also offers a cloud-based solution for SMRT Link.

- **SMRT Link**: A fully-featured on-prem solution
	- Provides all the features of SMRT Link including push-button secondary analysis capabilities (SMRT Analysis)
- **SMRT Link Lite**: An is an on-prem solution with minimal hardware requirements
	- Ideal if there are network restrictions preventing cloud use
	- No push-button secondary analysis
- **SMRT Link Cloud**: A fully managed cloud solution
	- Provided and hosted by PacBio (free)
	- Enables quick setup for running the instrument
	- No push-button secondary analysis
- **SMRT Tools**: SMRT Tools are the command-line tools included with SMRT Link. These are developer tools for use by bioinformaticians working with secondary analysis results.

| **SMRT Link features**                                     | **SMRT Link**                              | **SMRT Link Lite**                          | **SMRT Link Cloud**      |
|------------------------------------------------------------|--------------------------------------------|---------------------------------------------|--------------------------|
| **Supported instruments¹**                                 | Revio, Vega, and Sequel IIe             | Revio, Vega, and Sequel IIe                 | Revio and Vega           |
| **Instrument monitoring**                                  | ✅                                          | ✅                                           | ✅                        |
| **Sample setup**                                           | ✅                                          | ✅                                           | ✅                        |
| **Run design**                                             | ✅                                          | ✅                                           | ✅                        |
| **Run monitoring/QC**                                      | ✅                                          | ✅                                           | ✅                        |
| **Push-button secondary analysis (SMRT® Analysis)**        | ✅                                          | ❌                                           | ❌                        |
| **3rd party and PacBio Compatible Partners analysis**      | ✅                                          | ✅                                           | ✅                        |
| **API access**                                             | ✅                                          | ✅                                           | ✅                        |

For more information, check out the [SMRT Link Application Brief](https://www.pacb.com/wp-content/uploads/Application-brief-SMRT-Link.pdf).

## Latest version

Version **{{ smrt_link.version }}**: [Release Notes](https://www.pacb.com/wp-content/uploads/SMRT-Link-v25.3-release-notes.pdf)

The latest version of SMRT Link can be downloaded from [PacBio's Software Downloads page](https://www.pacb.com/support/software-downloads/).

```
curl -O https://downloads.pacbcloud.com/public/software/installers/smrtlink-release_25.3.0.273777.zip
```

## What's new

Below are a few high-level updates to version {{ smrt_link.version }}. For the full set of updates, please see the [release notes](https://www.pacb.com/wp-content/uploads/SMRT-Link-v25.3-release-notes.pdf):

- Run design and analysis support for the PureTarget carrier screening panel and extended repeat expansion panel
- Single Sign-On (SSO) support for on-premises installations

## Getting started
Visit [Quick Start Guide](quick-start-guide.md) or check out our SMRT Link Install tutorial video!

<div style="text-align: center;">
  <a href="https://youtu.be/5vL_EXNbdrY" target="_blank">
    <img src="https://img.youtube.com/vi/5vL_EXNbdrY/hqdefault.jpg" style="max-width: 60%; height: auto; border: 0;" />
  </a>
</div>