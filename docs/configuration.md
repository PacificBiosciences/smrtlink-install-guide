---
layout: page
title: Configuration
nav_order: 5
---


# Configuring SMRT Link

SMRT Link configuration is done interactively during the installation process (see [Installing SMRT Link](installing-smrt-link.md)). For example, during installation you will setup:

- The SMRT Link server domain name (DNS)
- The location of `db_datadir`, `jobs_root`, and `tmp_dir` (see [System Requirements](system-requirements.md#associated-install-directories))
- SMRT Analysis job email notifications
- Compute configurations
	- You can setup multiple compute configurations, for example:
		1. SLURM distributed analysis (general partition)
		2. SLURM distributed analysis (high-mem or CPU partition)
		3. Local analysis (non-distributed analysis)

Expand the Configuration Details section below to see an example configuration file generated during a SMRT Link installation. This file can be found at `$SMRT_ROOT/userdata/config/smrtlink.config` following installation. 

??? abstract "Configuration Details"

	```
	# smrtlink config

	# 'install' settings
	install__user='smrtanalysis';
	install__group='smrtanalysis';
	install__sluuid='859d2df1-cc8a-4e56-bc5b-0c83df4a5c79';
	install__umask='__USE_DEFAULT__';                # Current val: '0022'

	# 'system' settings
	system__memtotal='__USE_DEFAULT__';              # Current val: '12884901888'

	# 'smrtlink' settings
	smrtlink__dnsname='smrtlinkhost.mydomain.com';
	smrtlink__gui_port='__USE_DEFAULT__';            # Current val: '9090'
	smrtlink__services_port='__USE_DEFAULT__';       # Current val: '9091'
	smrtlink__services_minmem='__USE_DEFAULT__';     # Current val: '3072'
	smrtlink__services_maxmem='__USE_DEFAULT__';     # Current val: '3072'
	smrtlink__ics_services_minmem='__USE_DEFAULT__';  # Current val: '1216'
	smrtlink__ics_services_maxmem='__USE_DEFAULT__';  # Current val: '1216'
	smrtlink__mail_host='__USE_DEFAULT__';           # Current val: ''
	smrtlink__mail_port='__USE_DEFAULT__';           # Current val: '25'
	smrtlink__mail_user='__USE_DEFAULT__';           # Current val: ''
	smrtlink__mail_password='__USE_DEFAULT__';       # Current val: ''
	smrtlink__nworkers='__USE_DEFAULT__';                 # Current val: '8'
	smrtlink__extended_cell_use_enable='__USE_DEFAULT__';  # Current val: 'false'
	smrtlink__pacbio_internal='__USE_DEFAULT__';     # Current val: 'false'

	# 'remote' settings
	remote__eve_server_select='__USE_DEFAULT__';     # Current val: 'production'
	remote__eve_url='__USE_DEFAULT__';               # Current val: ''
	remote__update_server_select='__USE_DEFAULT__';  # Current val: 'production'
	remote__update_url='__USE_DEFAULT__';            # Current val: ''
	remote__update_enable='__USE_DEFAULT__';         # Current val: 'true'

	# 'cromwell' settings
	cromwell__port='__USE_DEFAULT__';                # Current val: '9096'

	# 'database' settings
	database__dbport='__USE_DEFAULT__';              # Current val: '9095'
	database__dbdatadir='/opt/pacbio/smrtlink/userdata/db_datadir.default';

	# 'datadirs' settings
	datadirs__jobsroot_dir='/opt/pacbio/smrtlink/userdata/jobs_root.default';
	datadirs__jobsroot_umask='__USE_DEFAULT__';   # Current val: '0022'
	datadirs__tmpdir_dir='/tmp';

	# 'computecfg_00' settings
	computecfg_00__name='__USE_DEFAULT__';                # Current val: 'SMRT Analysis Compute Configuration'
	computecfg_00__enable='__USE_DEFAULT__';              # Current val: 'true'
	computecfg_00__menuorder='__USE_DEFAULT__';           # Current val: '1'
	computecfg_00__nproc='8';
	computecfg_00__maxchunks='__USE_DEFAULT__';           # Current val: '24'
	computecfg_00__jmstype='Slurm';
	computecfg_00__cromwell_loglevel='__USE_DEFAULT__';   # Current val: 'INFO'
	computecfg_00__cromwell_concurrent_job_limit='__USE_DEFAULT__';  # Current val: '500'
	computecfg_00__slurm_bindir='/usr/bin';
	computecfg_00__slurm_partition='__USE_DEFAULT__';     # Current val: ''
	computecfg_00__slurm_startargs='__USE_DEFAULT__';     # Current val: ''
	computecfg_00__slurm_useraccting='__USE_DEFAULT__';   # Current val: 'false'
	computecfg_00__slurm_memrequest='__USE_DEFAULT__';    # Current val: 'false'
	computecfg_00__slurm_slurmconf='__USE_DEFAULT__';     # Current val: ''

	# 'computecfg_01' settings
	computecfg_01__name='Local Analysis';
	computecfg_01__enable='__USE_DEFAULT__';              # Current val: 'true'
	computecfg_01__menuorder='__USE_DEFAULT__';           # Current val: '2'
	computecfg_01__nproc='8';
	computecfg_01__maxchunks='__USE_DEFAULT__';           # Current val: '24'
	computecfg_01__jmstype='NONE';
	computecfg_01__cromwell_loglevel='__USE_DEFAULT__';   # Current val: 'INFO'
	computecfg_01__cromwell_concurrent_job_limit='__USE_DEFAULT__';  # Current val: '500'

	# 'internal' settings
	internal__version='smrtlink-release_25.3.0.273777';
	```
	!!! note
		This configuration file has two compute configurations (`computecfg_00` and `computecfg_01`) setup for SLURM distributed analysis and local (non-distributed) analysis.



<br>

## Reconfiguring SMRT Link

Following installation – if you need to change a given setting – you can do so by stopping SMRT Link services and using the `smrt_reconfig` command. The `smrt_reconfig` command – similar to the installation script – provides interactive prompts for each configuartion settings. 

**Stop Services**: `$SMRT_ROOT/admin/bin/services-stop`

**Reconfigure**: `$SMRT_ROOT/admin/bin/smrt_reconfig`

**Start Services**: `$SMRT_ROOT/admin/bin/services-start`

### Changing a specific setting

If you know exactly what setting you want to change, you can also perform `smrt_reconfig` non-interactively. 

See all the options available: `$SMRT_ROOT/admin/bin/smrt_reconfig --help`

**Example**: To change the temporary directory (`tmp_dir`) from the default `/tmp/smrtlink` to `/tmp`, you could run:

```
$SMRT_ROOT/admin/bin/smrt_reconfig --datadirs-tmpdir-dir /tmp --batch
```

!!! note
	The `--batch` option allows you to run the command without interactive prompts, applying the specified changes directly. 

<br>

## Advanced Topics
**See [Advanced Topics](advanced-topics.md) for additional configuartion options including the following:**

- [Enabling Keycloak](advanced-topics.md#enabling-the-keycloak-admin-interface) for user and role management
- [Changing Default Passwords](advanced-topics.md#changing-default-passwords)
- [LDAP and SSO Integration](advanced-topics.md#user-management)
- [Adding Local Users](advanced-topics.md#adding-local-users)
- [Configuring SSL](advanced-topics.md#ssltls)
- [Using the API](advanced-topics.md#api-documentation)
- [LIMS integration](advanced-topics.md#integrating-smrt-link-with-laboratory-information-management-systems-lims)

	
