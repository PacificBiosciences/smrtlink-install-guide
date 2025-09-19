---
layout: page
title: Installing SMRT Link
nav_order: 3
---


# Installation Guide for SMRT Link v{{ smrt_link.version }}

This guide provides comprehensive instructions for installing SMRT Link v{{ smrt_link.version }}. 

---

!!! note
    Before getting started please ensure all [System Requirements](system-requirements.md) are met.

---

## Installation steps

| Step | Action                                                                              |
|------|-------------------------------------------------------------------------------------|
| 1    | **Download and Unzip the Installer**: `curl -O https://downloads.pacbcloud.com/public/software/installers/smrtlink-release_25.3.0.273777.zip` <br><br> `unzip smrtlink-release_25.3.0.273777.zip` |
| 2    | **Log onto Install Host**: Access the server as `$SMRT_USER`.                      |
| 3    | **Run the Installer**: Execute the following commands based on the installation type:<br><br>**Full SMRT Link**:<br>`./smrtlink_<version_number>.run --rootdir $SMRT_ROOT`<br><br>**SMRT Link Lite**:<br>`./smrtlink_<version_number>.run --lite true --jmstype NONE --rootdir $SMRT_ROOT --nworkers 4`<br><br> For most installations the default setup options shown below can be accepted. |
|      | **Part 1 of 10: SMRT Link User**: It is recommended to run this script as a designated SMRT Link user (e.g. smrtanalysis) who will own all smrtpipe jobs and daemon processes. <br><br> Current user is xxx. Use the xxx as the SMRT Link user? [Y/n] |
|      | **Part 2 of 10: SMRT Link Server DNS**: The DNS name of the SMRT Link host server is used for creating SMRT Link URLs (e.g. http://smrtlink.example.com:9090), ensuring an SSL certificate will validate.  If the Domain Name System (DNS) does not resolve to the expected address, then an IP address must be used. <br><br> Detecting DNS names... Pick an option... |
|      | **Part 3 of 10: SMRT Link Setup**: The SMRT Link UI and SMRT Link Services require one port each for proper operation.  The SMRT Link UI port serves to redirect from an unencrypted http connection to the login page using secure https. The SMRT Link Services port is needed for internal access to the SMRT Link webservices API.  Select port numbers which do not conflict with any other process. <br><br> Enter the SMRT Link UI (http) port [9090]  <br> Enter the SMRT Link Services port [9091] <br><br> Memory settings must be preset for SMRT Link.  By default, the initial (-Xms) and maximum (-Xmx) Java heap sizes are set to the same values.  The default for SMRT Link services is 25% of the total memory with a maximum of 32768 MB.  **Using the default value is recommended**. <br><br> Enter the SMRT Link Services initial memory (in MB) <br> Enter the SMRT Link Services maximum memory (in MB) <br> Enter the SMRT Link ICS Services initial memory (in MB) <br> Enter the SMRT Link ICS Services maximum memory (in MB) |
|      | **Part 4 of 10: Database Setup**: The SMRT Link Services use a database which need access to a network port and a directory to store database data files. The port will only be used to access the database from the SMRT Link install host (localhost).  Select a port number which does not conflict with any other process. The database data directory should be located on a high performance file system.  Typically, a local (not shared) disk partition. <br><br> Enter the SMRT Link Database port [9095]: *Recommend default value 9095* <br> Enter the full path to the 'db_datadir' directory |
|      | **Part 5 of 10: Cromwell Server Setup**: The Cromwell Workflow Engine Server manages the workflow for SMRT Analysis jobs.  It requires a single port for proper operation. Select a port number which does not conflict with any other process. <br><br> Enter the Cromwell Server port [9096] *Recommend default value 9096* |
|      | **Part 6 of 10: Site-specific Directories Setup**: SMRT Link makes use of the following site-specific directories: `jobs_root` and `tmp_dir`. <br> `jobs_root` stores job output from the SMRT Analysis module of SMRT Link.  This directory may require a large amount of disk space (> 15TB, for example). <br><br> Enter the full path to the `jobs_root` directory <br><br>  `tmp_dir` - is used for fast I/O operations, and should be located on a high performance file system available on the SMRT Link host and on each compute cluster node individually. Typically, it should be a local (not shared) disk partition. The recommended size size is 1TB (500GB minimum).  If the directory location does not exist, a directory will be automatically created. <br><br> Enter the full path to the `tmp_dir` directory |
|      | **Part 7 of 10: Remote Service Setup**: The 'SMRT Link Event Service' provides the ability to send PacBio the following SMRT Link information: <br> 1) installation troubleshooting logs <br> 2) analysis failure logs <br> 3) usage information (sample names and sequence data excluded) <br> Note: 'SMRT Link Event Service' will be configured in the SMRT Link UI, upon first access after install or upgrade. <br> The 'SMRT Link Update Service' will provide automatic notification and prompt for installation of SMRT Link update bundles.   Currently, updates of the SMRT Link UI Bundle and the SMRT Link Chemistry Bundle are supported.  The SMRT Link Chemistry Bundle will enable the use of new PacBio consumables. <br><br> Enable the 'SMRT Link Update Service'? [Y/n] |
|      | **Part 8 of 10: SMRT Link Analysis Job Email Notification**: SMRT Link can be configured to send email notifications of completed analysis jobs to the user who launched the analysis (for both successful and failed jobs). SMRT Link only supports connections to SMTP Relays without encryption. Servers using basic authentication, SSL/TLS, or STARTTLS are not supported. Email notification is disabled if the outgoing mail server host is empty.  Configure the SMTP mail host and port settings below. <br><br> Enter the SMRT Link notification outgoing mail server host. |
|      | **Part 9 of 10: SMRT Link Compute Configuration**: SMRT Link allows for one or more compute configurations to be defined for processing analysis jobs.  Each compute configuration can specify unique workflow and Job Management System settings, independent from other compute configurations. When configuring a SMRT Analysis job, a drop-down menu under the "Advanced Parameter Settings" allows selection of multiple compute configurations. The selected configuration will be used for all JMS cluster submissions for that analysis job. <br><br> **Configuring SMRT Analysis Compute Configuration (computecfg_00)** <br> `NAME` specifies a unique name for the compute configuration. <br><br> Enter the compute config `NAME` [SMRT Analysis Compute Configuration] <br><br> `NPROC` specifies the maximum number of slots each task may request upon job submissions to a JMS cluster.  One processor core per slot is assumed. <br><br>Enter the number of processors per task `NPROC` [8] <br><br>`MAXCHUNKS` specifies the maximum number of parallel chunks when breaking up large dataset files. <br><br>Enter the number of parallel chunks per task `MAXCHUNKS` [24] <br><br> Specify the global `concurrent_job_limit` for Cromwell.  This is the maximum number of simultaneous jobs that Cromwell can submit to the compute cluster. If configuring a single node system this should be adjusted to ensure the number of concurrently running jobs does not exceed avakiable memory <br><br>Select the Cromwell `concurrent_job_limit` [500] <br><br> A Job Management System (JMS) may be used to dispatch jobs to a distributed compute environment.  If no Job Management System is specified, the system will run in Non-Distributed Mode and all compute jobs will be run locally on the install host.  Available Job Management Systems will be detected from the `$PATH` environment variable, but may also be selected manually. **SLURM is the supported JMS**. <br><br> The installer will then confirm settings for `SLURM_BINDIR`, `SLURM_PARTITION`, `SLURM_STARTARGS`, `SLURM_USERACCTING`, `SLURM_MEMREQUEST`, `SLURM_SLURMCONF` and allow the option to modify or add additional compute configurations |
|      | **Part 10 of 10: SMRT Link Analysis Configuration**: `NWORKERS` specifies the maximum number of simultaneous SMRT Analysis workflows that can be run by the SMRT Link server.  This should be set to no more than the number of processors available on the SMRT Link install machine.  The default is the min of 32 and number of processors on the system. <br><br> Enter the max number of workers `NWORKERS` [32] |
| 4    | **Start Services**: Use the command:<br>`$SMRT_ROOT/admin/bin/services-start`      |
| 5    | **Run Site Acceptance Test (Optional)**:<br>`$SMRT_ROOT/admin/bin/run-sat-services` |

## Post-installation steps

| Step | Action                                                                              |
|------|-------------------------------------------------------------------------------------|
| 1    | **Enable Keycloak Admin interface (Optional)**. We recommend leaving the console disabled when you are not actively managing server access:<br>`$SMRT_ROOT/admin/bin/restart-gui --enable-keycloak-console`<br>`$SMRT_ROOT/admin/bin/restart-gui --disable-keycloak-console` <br> See [Advanced Topics](advanced-topics.md#enabling-the-keycloak-admin-interface). |
| 2    | **Configure LDAP and SSO (Optional)**:<br>Set up LDAP and SSO integration and add users. See [Advanced Topics](advanced-topics.md#user-management). |
| 3    | **Install SSL Certificate (Optional)**:<br>Upon the first startup of SMRT Link, NGINX automagically generates a key and self signed certificate. To create a new certificate see [Advanced Topics](advanced-topics.md#ssltls). |
| 4    | **Change Default Passwords (Optional)**:<br>Update admin and pbicsuser passwords. See [Advanced Topics](advanced-topics.md#changing-default-passwords).|

---

## SMRT Tools installation steps

SMRT Tools are the command-line tools included with SMRT Link. These are developer tools for use by bioinformaticians working with secondary analysis results. Aailable tools will be installed at `$SMRT_ROOT/smrtcmds/bin/`. For tool details please utilize the help
function, `{tool} –-help`,or reference [PacBio GitHub](https://github.com/PacificBiosciences) for select tools. 

| Step | Action                                                                 |
|------|------------------------------------------------------------------------|
| 1    | **Install SMRT Tools**:<br>`./smrtlink_<version_number>.run --rootdir $SMRT_ROOT --smrttools-only`   |
| 2    | **Access Tools**:<br>`$SMRT_ROOT/smrtlink/smrtcmds/bin`          |
