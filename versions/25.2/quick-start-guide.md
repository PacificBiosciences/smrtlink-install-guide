---
layout: page
title: Quick Start Guide
nav_order: 1
---


# Quick Start Guide for SMRT Link v{{ smrt_link.version }} Installation

This guide provides a concise overview of the steps required to install SMRT Link v{{ smrt_link.version }} or SMRT Link Lite v{{ smrt_link.version }}. For detailed instructions, please refer to [Installing SMRT Link](installing-smrt-link.md) .

For detailed walkthrough, check out our [SMRT Link Install tutorial video](https://youtu.be/5vL_EXNbdrY).

!!! note
    This Quick Start Guide assumes that all prerequistes are met. Please reference [System Requirements](system-requirements.md) and ensure the checklist below is completed before proceeding with the installation.

---

## Installation/upgrade checklist
| | |
|-|-|
| ✅ | Appropriate hardware located and configuration chosen with Linux Rocky or Ubuntu OS. |
| ✅ | Installation root directory (`$SMRT_ROOT`) identified on shared (NFS) file system. |
| ✅ | Service account (`$SMRT_USER`) identified/created to install/run the SMRT Link services. |
| ✅ | `$SMRT_ROOT` base directory has appropriate rwx permissions for `$SMRT_USER`. |
| ✅ | Job Management System (JMS) and Singularity installed/setup (if using SMRT Analysis). |
| ✅ | Full path for SMRT Analysis database directory (`db_datadir`) chosen on the local file system on the install node. |
| ✅ | Full path for SMRT Analysis jobs output directory (`jobs_root`) chosen on shared (NFS) file system. |
| ✅ | Full path for SMRT Analysis temporary directory (`tmp_dir`) chosen on the local file system on each node. |
| ✅ | Ports 8243, 9243, and 9443 are available and open for SMRT Link web services. |
| ✅ | (Optional) LDAP settings. See [Advanced Topics](advanced-topics.md) for details. |
| ✅ | (Optional) SSL certificate for NGINX.  See [Advanced Topics](advanced-topics.md) for details. |

---

## Installation steps

| Step | Action                                                                              |
|------|-------------------------------------------------------------------------------------|
| 1    | **Log onto Install Host**: Access the server as `$SMRT_USER`.                      |
| 2    | **Download and Unzip the Installer**:<br>`curl -O https://downloads.pacbcloud.com/public/software/installers/smrtlink-release_25.2.0.266456.zip` <br><br> `unzip smrtlink-release_25.2.0.266456.zip`  |
| 3    | **Run the Installer**: Execute the following commands based on the installation type:<br><br>**Full SMRT Link**:<br>`./smrtlink_<version_number>.run --rootdir $SMRT_ROOT`<br><br>**SMRT Link Lite**:<br>`./smrtlink_<version_number>.run --lite true --jmstype NONE --rootdir $SMRT_ROOT --nworkers 4`<br><br> For most installations the default setup options can be accepted. See [Installing SMRT Link](installing-smrt-link.md) for more information on configuration options.|
| 4    | **Start Services**: Use the command:<br>`$SMRT_ROOT/admin/bin/services-start`      |
| 5    | **Run Site Acceptance Test (Optional)**:<br>`$SMRT_ROOT/admin/bin/run-sat-services` |

!!! note
    For additional post-installation managment options please see the [Post-Installation Steps](installing-smrt-link.md#post-installation-steps).

---

## Upgrade steps


| Step | Action                                                                 |
|------|------------------------------------------------------------------------|
| 1    | **Log onto Install Host**: Access the server as `$SMRT_USER`.                      |
| 2    | **Download and Unzip the Installer**:<br>`curl -O https://downloads.pacbcloud.com/public/software/installers/smrtlink-release_25.2.0.266456.zip` <br><br> `unzip smrtlink-release_25.2.0.266456.zip`  |
| 3    | **Stop Services**:<br>`$SMRT_ROOT/admin/bin/services-stop`            |
| 4    | **Run Installer with Upgrade Option**:<br>`./smrtlink_<version_number>.run --rootdir $SMRT_ROOT --upgrade` |
| 5    | **Start Services**:<br>`$SMRT_ROOT/admin/bin/services-start`          |
| 6    | **Run Site Acceptance Test (Optional)**:<br>`$SMRT_ROOT/admin/bin/run-sat-services` |
| 7    | **Clear Browser Cache (Recomended)**:<br>In Chrome, go to `More Tools > Clear Browsing Data`, select "All Time" for cached files, and clear. This ensures defualt settings are properly loaded.|
