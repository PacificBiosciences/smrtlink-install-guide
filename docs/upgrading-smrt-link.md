---
layout: page
title: Upgrading SMRT Link
nav_order: 4
---

# Upgrading SMRT Link to v{{smrt_link.version}}

This section provides detailed instructions for upgrading SMRT Link to version {{smrt_link.version}}. Following these steps ensures a smooth transition and maintains the integrity of your data and configurations.

---

## Supported upgrade paths

Upgrades to v{{smrt_link.version}} from versions since 13.x are supported. 

---

## Pre-upgrade considerations

Before initiating the upgrade, ensure the following:

1. **Backup**: Create a complete backup of your current SMRT Link installation, including configuration files and databases.

    A utility script to generate an appropriate cron server command was added at `$SMRT_ROOT/admin/bin/generate-cron-backup`. This helper script makes it easy to take a pg_dump of the smrtlinkdb and keycloak databases. Ideally, these should both be backed up.

2. **Active Jobs**: Verify that no active SMRT Link analysis jobs are running. It's crucial to complete or terminate all jobs before proceeding.

3. **Disk Space**: Ensure sufficient disk space is available for the upgrade process.

---

## Upgrade steps

Follow these steps to upgrade SMRT Link to v{{smrt_link.version}}:

| Step | Action                                                                              |
|------|-------------------------------------------------------------------------------------|
| 1    | **Download and Unzip the Installer**: `curl -O https://downloads.pacbcloud.com/public/software/installers/smrtlink-release_25.3.0.273777.zip` <br><br> `unzip smrtlink-release_25.3.0.273777.zip` |
| 2    | **Log onto Install Host**: Access the server as `$SMRT_USER`. | 
| 3    | **Stop SMRT Link Services**: Use the command: `$SMRT_ROOT/admin/bin/services-stop` <br><br> Ensure that no active SMRT Link analysis jobs are running before stopping services. | 
| 4    | **Run the Installer with Upgrade Option**: Navigate to the directory containing the downloaded installer. Execute the installer with the upgrade option: `./smrtlink_<version_number>.run --rootdir $SMRT_ROOT --upgrade` <br><br> The `$SMRT_ROOT` directory must be an existing SMRT Link installation. Several validation steps will occur to ensure that a valid `$SMRT_ROOT` is being updated. |
| 5    | **Start SMRT Link Services**: Use the command:  `$SMRT_ROOT/admin/bin/services-start` |
| 6    | **Run Site Acceptance Test (Optional)**:  `$SMRT_ROOT/admin/bin/run-sat-services`. <br><br> Successful completion indicates that the HPC configuration is functioning correctly. |

---

## Post-upgrade steps

| Step | Action                                                                              |
|------|-------------------------------------------------------------------------------------| 
| 1    | **Clear Browser Cache (Recommended)**: Open Google Chrome and navigate to `More Tools` > `Clear browsing data`. Select `All Time` for the time range and check `Cached images and files`. Click `Clear data` and restart the browser. | 
| 2    | **Configure LDAP and SSO (Optional)**: Set up LDAP and SSO integration and add users. See [Advanced Topics](advanced-topics.md#user-management). | 
| 3    | **Install SSL Certificate (Optional)**:<br>Upon the first startup of SMRT Link, NGINX automagically generates a key and self signed certificate. To create a new certificate see [Advanced Topics](advanced-topics.md#ssltls).| 
| 4    | **Change Default Passwords (Optional)**:<br>Update admin and pbicsuser passwords. See [Advanced Topics](advanced-topics.md#changing-default-passwords). |


## SMRT Tools upgrade steps

SMRT Tools are the command-line tools included with SMRT Link. These are developer tools for use by bioinformaticians working with secondary analysis results. 

| Step | Action                                                                 |
|------|------------------------------------------------------------------------|
| 1    | **Upgrade SMRT Tools**:<br>`./smrtlink_<version_number>.run --rootdir $SMRT_ROOT --smrttools-only --upgrade` |
| 2    | **Access Tools**:<br>`$SMRT_ROOT/smrtlink/smrtcmds/bin`          |

---


## Troubleshooting

If you encounter issues during the upgrade:

- **Logs**: Review the installation logs located in `$SMRT_ROOT/install/logs` for error messages.

- **Support**: Contact PacBio support at [support@pacb.com](mailto:support@pacb.com) or call 1-877-920-PACB (7222) for assistance.


