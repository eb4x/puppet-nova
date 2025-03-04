# == Class: nova
#
# This class is used to specify configuration parameters that are common
# across all nova services.
#
# === Parameters:
#
# [*ensure_package*]
#   (optional) The state of nova packages
#   Defaults to 'present'
#
# [*default_transport_url*]
#    (optional) A URL representing the messaging driver to use and its full
#    configuration. Transport URLs take the form:
#      transport://user:pass@host1:port[,hostN:portN]/virtual_host
#    Defaults to $::os_service_default
#
# [*rpc_response_timeout*]
#   (Optional) Seconds to wait for a response from a call. (integer value)
#   Defaults to $::os_service_default.
#
# [*long_rpc_timeout*]
#   (Optional) An alternative timeout value for RPC calls that have
#   the potential to take a long time.
#   Defaults to $::os_service_default.
#
# [*control_exchange*]
#   (Optional) The default exchange under which topics are scoped. May be
#   overridden by an exchange name specified in the transport_url
#   option.
#   Defaults to $::os_service_default
#
# [*rabbit_use_ssl*]
#   (optional) Boolean. Connect over SSL for RabbitMQ. (boolean value)
#   Defaults to $::os_service_default
#
# [*rabbit_ha_queues*]
#   (optional) Use HA queues in RabbitMQ. (boolean value)
#   Defaults to $::os_service_default
#
# [*rabbit_heartbeat_timeout_threshold*]
#   (optional) Number of seconds after which the RabbitMQ broker is considered
#   down if the heartbeat keepalive fails.  Any value >0 enables heartbeats.
#   Heartbeating helps to ensure the TCP connection to RabbitMQ isn't silently
#   closed, resulting in missed or lost messages from the queue.
#   Requires kombu >= 3.0.7 and amqp >= 1.4.0. (integer value)
#   Defaults to $::os_service_default
#
# [*rabbit_heartbeat_rate*]
#   (optional) How often during the rabbit_heartbeat_timeout_threshold period
#   to check the heartbeat on RabbitMQ connection.
#   i.e. rabbit_heartbeat_rate=2 when rabbit_heartbeat_timeout_threshold=60,
#   the heartbeat will be checked every 30 seconds. (integer value)
#   Defaults to $::os_service_default
#
# [*rabbit_heartbeat_in_pthread*]
#   (Optional) EXPERIMENTAL: Run the health check heartbeat thread
#   through a native python thread. By default if this
#   option isn't provided the  health check heartbeat will
#   inherit the execution model from the parent process. By
#   example if the parent process have monkey patched the
#   stdlib by using eventlet/greenlet then the heartbeat
#   will be run through a green thread.
#   Defaults to $::os_service_default
#
# [*kombu_ssl_ca_certs*]
#   (optional) SSL certification authority file (valid only if SSL enabled).
#   (string value)
#   Defaults to $::os_service_default
#
# [*kombu_ssl_certfile*]
#   (optional) SSL cert file (valid only if SSL enabled). (string value)
#   Defaults to $::os_service_default
#
# [*kombu_ssl_keyfile*]
#   (optional) SSL key file (valid only if SSL enabled). (string value)
#   Defaults to $::os_service_default
#
# [*kombu_ssl_version*]
#   (optional) SSL version to use (valid only if SSL enabled).
#   Valid values are TLSv1, SSLv23 and SSLv3. SSLv2 may be
#   available on some distributions. (string value)
#   Defaults to $::os_service_default
#
# [*kombu_reconnect_delay*]
#   (optional) How long to wait before reconnecting in response to an AMQP
#   consumer cancel notification. (floating point value)
#   Defaults to $::os_service_default
#
# [*kombu_failover_strategy*]
#   (Optional) Determines how the next RabbitMQ node is chosen in case the one
#   we are currently connected to becomes unavailable. Takes effect only if
#   more than one RabbitMQ node is provided in config. (string value)
#   Defaults to $::os_service_default
#
# [*kombu_compression*]
#   (optional) Possible values are: gzip, bz2. If not set compression will not
#   be used. This option may not be available in future versions. EXPERIMENTAL.
#   (string value)
#   Defaults to $::os_service_default
#
# [*amqp_durable_queues*]
#   (optional) Define queues as "durable" to rabbitmq. (boolean value)
#   Defaults to $::os_service_default
#
# [*amqp_server_request_prefix*]
#   (Optional) Address prefix used when sending to a specific server
#   Defaults to $::os_service_default.
#
# [*amqp_broadcast_prefix*]
#   (Optional) address prefix used when broadcasting to all servers
#   Defaults to $::os_service_default.
#
# [*amqp_group_request_prefix*]
#   (Optional) address prefix when sending to any server in group
#   Defaults to $::os_service_default.
#
# [*amqp_container_name*]
#   (Optional) Name for the AMQP container
#   Defaults to $::os_service_default.
#
# [*amqp_idle_timeout*]
#   (Optional) Timeout for inactive connections
#   Defaults to $::os_service_default.
#
# [*amqp_trace*]
#   (Optional) Debug: dump AMQP frames to stdout
#   Defaults to $::os_service_default.
#
# [*amqp_ssl_ca_file*]
#   (Optional) CA certificate PEM file to verify server certificate
#   Defaults to $::os_service_default.
#
# [*amqp_ssl_cert_file*]
#   (Optional) Identifying certificate PEM file to present to clients
#   Defaults to $::os_service_default.
#
# [*amqp_ssl_key_file*]
#   (Optional) Private key PEM file used to sign cert_file certificate
#   Defaults to $::os_service_default.
#
# [*amqp_ssl_key_password*]
#   (Optional) Password for decrypting ssl_key_file (if encrypted)
#   Defaults to $::os_service_default.
#
# [*amqp_sasl_mechanisms*]
#   (Optional) Space separated list of acceptable SASL mechanisms
#   Defaults to $::os_service_default.
#
# [*amqp_sasl_config_dir*]
#   (Optional) Path to directory that contains the SASL configuration
#   Defaults to $::os_service_default.
#
# [*amqp_sasl_config_name*]
#   (Optional) Name of configuration file (without .conf suffix)
#   Defaults to $::os_service_default.
#
# [*amqp_username*]
#   (Optional) User name for message broker authentication
#   Defaults to $::os_service_default.
#
# [*amqp_password*]
#   (Optional) Password for message broker authentication
#   Defaults to $::os_service_default.
#
# [*host*]
#   (Optional) Name of this node. This is typically a hostname, FQDN, or
#   IP address.
#   Defaults to $::os_service_default.
#
# [*service_down_time*]
#   (optional) Maximum time since last check-in for up service.
#   Defaults to 60
#
# [*state_path*]
#   (optional) Directory for storing state.
#   Defaults to '/var/lib/nova'
#
# [*lock_path*]
#   (optional) Directory for lock files.
#   On RHEL will be '/var/lib/nova/tmp' and on Debian '/var/lock/nova'
#   Defaults to $::nova::params::lock_path
#
# [*periodic_interval*]
#   (optional) Seconds between running periodic tasks.
#   Defaults to '60'
#
# [*report_interval*]
#   (optional) Interval at which nodes report to data store.
#    Defaults to '10'
#
# [*rootwrap_config*]
#   (optional) Path to the rootwrap configuration file to use for running commands as root
#   Defaults to '/etc/nova/rootwrap.conf'
#
# [*use_ssl*]
#   (optional) Enable SSL on the API server
#   Defaults to false, not set
#
# [*enabled_ssl_apis*]
#   (optional) List of APIs to SSL enable
#   Defaults to []
#   Possible values : 'osapi_compute', 'metadata'
#
# [*cert_file*]
#   (optional) Certificate file to use when starting API server securely
#   Defaults to false, not set
#
# [*key_file*]
#   (optional) Private key file to use when starting API server securely
#   Defaults to false, not set
#
# [*ca_file*]
#   (optional) CA certificate file to use to verify connecting clients
#   Defaults to false, not set
#
# [*nova_public_key*]
#   (optional) Install public key in .ssh/authorized_keys for the 'nova' user.
#   Expects a hash of the form { type => 'key-type', key => 'key-data' } where
#   'key-type' is one of (ssh-rsa, ssh-dsa, ssh-ecdsa) and 'key-data' is the
#   actual key data (e.g, 'AAAA...').
#
# [*nova_private_key*]
#   (optional) Install private key into .ssh/id_rsa (or appropriate equivalent
#   for key type).  Expects a hash of the form { type => 'key-type', key =>
#   'key-data' }, where 'key-type' is one of (ssh-rsa, ssh-dsa, ssh-ecdsa) and
#   'key-data' is the contents of the private key file.
#
# [*ssl_only*]
#   (optional) Disallow non-encrypted connections.
#   Defaults to false
#
# [*cert*]
#   (optional) Path to SSL certificate file.
#   Defaults to $::os_service_default
#
# [*key*]
#   (optional) SSL key file (if separate from cert).
#   Defaults to $::os_service_default
#
# [*console_ssl_ciphers*]
#   (optional) OpenSSL cipher preference string that specifies what ciphers to
#   allow for TLS connections from clients.  See the man page for the OpenSSL
#   'ciphers' command for details of the cipher preference string format and
#   allowed values.
#   Defaults to $::os_service_default
#
# [*console_ssl_minimum_version*]
#   (optional) Minimum allowed SSL/TLS protocol version.  Valid values are
#   'default', 'tlsv1_1', 'tlsv1_2', and 'tlsv1_3'.  A value of 'default' will
#   use the underlying system OpenSSL defaults.
#   Defaults to $::os_service_default
#
# [*notification_transport_url*]
#   (optional) A URL representing the messaging driver to use for notifications
#   and its full configuration. Transport URLs take the form:
#     transport://user:pass@host1:port[,hostN:portN]/virtual_host
#   Defaults to $::os_service_default
#
# [*notification_driver*]
#   (optional) Driver or drivers to handle sending notifications.
#   Value can be a string or a list.
#   Defaults to $::os_service_default.
#
# [*notification_topics*]
#   (optional) AMQP topic used for OpenStack notifications
#   Defaults to ::os_service_default
#
# [*notification_format*]
#   (optional) Format used for OpenStack notifications
#   Defaults to ::os_service_default
#
# [*notify_on_state_change*]
#   (optional) If set, send compute.instance.update notifications
#   on instance state changes. Valid values are None for no notifications,
#   "vm_state" for notifications on VM state changes, or "vm_and_task_state"
#   for notifications on VM and task state changes.
#   Defaults to undef
#
# [*ovsdb_connection*]
#   (optional) Sets the ovsdb connection string. This is used by os-vif
#   to interact with openvswitch on the host.
#   Defaults to $::os_service_default
#
# [*upgrade_level_cells*]
#  (optional) Sets a version cap for messages sent to local cells services
#  Defaults to $::os_service_default
#
# [*upgrade_level_cert*]
#  (optional) Sets a version cap for messages sent to cert services
#  Defaults to $::os_service_default
#
# [*upgrade_level_compute*]
#  (optional) Sets a version cap for messages sent to compute services
#  Defaults to $::os_service_default
#
# [*upgrade_level_conductor*]
#  (optional) Sets a version cap for messages sent to conductor services
#  Defaults to $::os_service_default
#
# [*upgrade_level_intercell*]
#  (optional) Sets a version cap for messages sent between cells services
#  Defaults to $::os_service_default
#
# [*upgrade_level_network*]
#  (optional) Sets a version cap for messages sent to network services
#  Defaults to $::os_service_default
#
# [*upgrade_level_scheduler*]
#  (optional) Sets a version cap for messages sent to scheduler services
#  Defaults to $::os_service_default
#
# [*purge_config*]
#   (optional) Whether to set only the specified config options
#   in the nova config.
#   Defaults to false.
#
# [*cpu_allocation_ratio*]
#   (optional) Virtual CPU to physical CPU allocation ratio which affects all
#   CPU filters.  This can be set on the scheduler, or can be overridden
#   per compute node.
#   Defaults to $::os_service_default
#
# [*ram_allocation_ratio*]
#   (optional) Virtual ram to physical ram allocation ratio which affects all
#   ram filters. This can be set on the scheduler, or can be overridden
#   per compute node.
#   Defaults to $::os_service_default
#
# [*disk_allocation_ratio*]
#   (optional) Virtual disk to physical disk allocation ratio which is used
#   by the disk filter. This can be set on the scheduler, or can be overridden
#   per compute node.
#   Defaults to $::os_service_default
#
# [*my_ip*]
#   (optional) IP address of this host on the management network.
#   If unset, will determine the IP programmatically based on the default route.
#   If unable to do so, will use "127.0.0.1".
#   Defaults to $::os_service_default.
#
# [*cross_az_attach*]
#   (optional) Allow attach between instance and volume in different availability zones.
#   Defaults to $::os_service_default
#
# [*dhcp_domain*]
#   (optional) domain to use for building the hostnames
#   Defaults to $::os_service_default
#
# DEPRECATED PARAMETERS
#
# [*auth_strategy*]
#   (optional) The strategy to use for auth: noauth or keystone.
#   Defaults to undef
#
# [*database_min_pool_size*]
#   (optional) Minimum number of SQL connections to keep open in a pool.
#   Defaults to undef.
#
# [*os_region_name*]
#   (optional) Sets the os_region_name flag. For environments with
#   more than one endpoint per service, this is required to make
#   things such as cinder volume attach work. If you don't set this
#   and you have multiple endpoints, you will get AmbiguousEndpoint
#   exceptions in the nova API service.
#   Defaults to undef
#
# [*cinder_catalog_info*]
#   (optional) Info to match when looking for cinder in the service
#   catalog. Format is: separated values of the form:
#   <service_type>:<service_name>:<endpoint_type>
#   Defaults to undef
#
# [*upgrade_level_console*]
#  (optional) Sets a version cap for messages sent to console services
#  Defaults to undef
#
# [*database_connection*]
#   (optional) Connection url for the nova database.
#   Defaults to undef.
#
# [*slave_connection*]
#   (optional) Connection url to connect to nova slave database (read-only).
#   Defaults to undef.
#
# [*api_database_connection*]
#   (optional) Connection url for the nova API database.
#   Defaults to undef.
#
# [*api_slave_connection*]
#   (optional) Connection url to connect to nova API slave database (read-only).
#   Defaults to undef.
#
# [*database_max_retries*]
#   (optional) Maximum database connection retries during startup.
#   Defaults to undef.
#
# [*database_idle_timeout*]
#   (optional) Timeout before idle database connections are reaped.
#   Defaults to undef.
#
# [*database_retry_interval*]
#   (optional) Interval between retries of opening a database connection.
#   Defaults to undef.
#
# [*database_max_pool_size*]
#   (optional) Maximum number of SQL connections to keep open in a pool.
#   Defaults to undef.
#
# [*database_max_overflow*]
#   (optional) If set, use this value for max_overflow with sqlalchemy.
#   Defaults to: undef.
#
# [*amqp_allow_insecure_clients*]
#   (Optional) Accept clients using either SSL or plain TCP
#   Defaults to undef.
#
# [*glance_endpoint_override*]
#   (optional) Override the endpoint to use to talk to Glance.
#   Defaults to undef.
#
# [*glance_num_retries*]
#   (optional) Number of retries in glance operation
#   Defaults to undef.
#
# [*block_device_allocate_retries*]
#   (optional) Number of times to retry block device allocation on failures
#   Defaults to undef.
#
# [*block_device_allocate_retries_interval*]
#   (optional) Waiting time interval (seconds) between block device allocation
#   retries on failures
#   Defaults to undef.
#
class nova(
  $ensure_package                         = 'present',
  $default_transport_url                  = $::os_service_default,
  $rpc_response_timeout                   = $::os_service_default,
  $long_rpc_timeout                       = $::os_service_default,
  $control_exchange                       = $::os_service_default,
  $rabbit_use_ssl                         = $::os_service_default,
  $rabbit_heartbeat_timeout_threshold     = $::os_service_default,
  $rabbit_heartbeat_rate                  = $::os_service_default,
  $rabbit_heartbeat_in_pthread            = $::os_service_default,
  $rabbit_ha_queues                       = $::os_service_default,
  $kombu_ssl_ca_certs                     = $::os_service_default,
  $kombu_ssl_certfile                     = $::os_service_default,
  $kombu_ssl_keyfile                      = $::os_service_default,
  $kombu_ssl_version                      = $::os_service_default,
  $kombu_reconnect_delay                  = $::os_service_default,
  $kombu_failover_strategy                = $::os_service_default,
  $kombu_compression                      = $::os_service_default,
  $amqp_durable_queues                    = $::os_service_default,
  $amqp_server_request_prefix             = $::os_service_default,
  $amqp_broadcast_prefix                  = $::os_service_default,
  $amqp_group_request_prefix              = $::os_service_default,
  $amqp_container_name                    = $::os_service_default,
  $amqp_idle_timeout                      = $::os_service_default,
  $amqp_trace                             = $::os_service_default,
  $amqp_ssl_ca_file                       = $::os_service_default,
  $amqp_ssl_cert_file                     = $::os_service_default,
  $amqp_ssl_key_file                      = $::os_service_default,
  $amqp_ssl_key_password                  = $::os_service_default,
  $amqp_sasl_mechanisms                   = $::os_service_default,
  $amqp_sasl_config_dir                   = $::os_service_default,
  $amqp_sasl_config_name                  = $::os_service_default,
  $amqp_username                          = $::os_service_default,
  $amqp_password                          = $::os_service_default,
  $host                                   = $::os_service_default,
  $service_down_time                      = 60,
  $state_path                             = '/var/lib/nova',
  $lock_path                              = $::nova::params::lock_path,
  $periodic_interval                      = '60',
  $report_interval                        = '10',
  $rootwrap_config                        = '/etc/nova/rootwrap.conf',
  $use_ssl                                = false,
  $enabled_ssl_apis                       = ['metadata', 'osapi_compute'],
  $ca_file                                = false,
  $cert_file                              = false,
  $key_file                               = false,
  $nova_public_key                        = undef,
  $nova_private_key                       = undef,
  $ssl_only                               = false,
  $cert                                   = $::os_service_default,
  $key                                    = $::os_service_default,
  $console_ssl_ciphers                    = $::os_service_default,
  $console_ssl_minimum_version            = $::os_service_default,
  $notification_transport_url             = $::os_service_default,
  $notification_driver                    = $::os_service_default,
  $notification_topics                    = $::os_service_default,
  $notification_format                    = $::os_service_default,
  $notify_on_state_change                 = undef,
  $ovsdb_connection                       = $::os_service_default,
  $upgrade_level_cells                    = $::os_service_default,
  $upgrade_level_cert                     = $::os_service_default,
  $upgrade_level_compute                  = $::os_service_default,
  $upgrade_level_conductor                = $::os_service_default,
  $upgrade_level_intercell                = $::os_service_default,
  $upgrade_level_network                  = $::os_service_default,
  $upgrade_level_scheduler                = $::os_service_default,
  $cpu_allocation_ratio                   = $::os_service_default,
  $ram_allocation_ratio                   = $::os_service_default,
  $disk_allocation_ratio                  = $::os_service_default,
  $purge_config                           = false,
  $my_ip                                  = $::os_service_default,
  $cross_az_attach                        = $::os_service_default,
  $dhcp_domain                            = $::os_service_default,
  # DEPRECATED PARAMETERS
  $auth_strategy                          = undef,
  $database_min_pool_size                 = undef,
  $os_region_name                         = undef,
  $cinder_catalog_info                    = undef,
  $upgrade_level_console                  = undef,
  $database_connection                    = undef,
  $slave_connection                       = undef,
  $api_database_connection                = undef,
  $api_slave_connection                   = undef,
  $database_idle_timeout                  = undef,
  $database_max_pool_size                 = undef,
  $database_max_retries                   = undef,
  $database_retry_interval                = undef,
  $database_max_overflow                  = undef,
  $amqp_allow_insecure_clients            = undef,
  $glance_endpoint_override               = undef,
  $glance_num_retries                     = undef,
  $block_device_allocate_retries          = undef,
  $block_device_allocate_retries_interval = undef,
) inherits nova::params {

  include nova::deps
  include nova::workarounds

  validate_legacy(Array, 'validate_array', $enabled_ssl_apis)
  if empty($enabled_ssl_apis) and $use_ssl {
      warning('enabled_ssl_apis is empty but use_ssl is set to true')
  }

  if $amqp_allow_insecure_clients != undef {
    warning('The amqp_allow_insecure_clients parameter is deprecated and \
will be removed in a future release.')
  }

  if $os_region_name != undef {
    warning('The os_region_name parameter is deprecated and will be removed \
in a future release. Use nova::cinder::os_region_name instead')
  }

  if $cinder_catalog_info != undef {
    warning('The catalog_info parameter is deprecated and will be removed \
in a future release. Use nova::cinder::catalog_info instead')
  }

  if $upgrade_level_console != undef {
    warning('The upgrade_level_console parameter is deprecated, and has \
no effect.')
  }

  if $database_connection != undef {
    warning('The database_connection parameter is deprecated and will be \
removed in a future realse. Use nova::db::database_connection instead')
  }

  if $slave_connection != undef {
    warning('The slave_connection parameter is deprecated and will be \
removed in a future realse. Use nova::db::slave_connection instead')
  }

  if $api_database_connection != undef {
    warning('The api_database_connection parameter is deprecated and will be \
removed in a future realse. Use nova::db::api_database_connection instead')
  }

  if $api_slave_connection != undef {
    warning('The api_slave_connection parameter is deprecated and will be \
removed in a future realse. Use nova::db::api_slave_connection instead')
  }

  if $database_idle_timeout != undef {
    warning('The database_idle_timeout parameter is deprecated and will be \
removed in a future realse. Use nova::db::database_connection_recycle_time \
instead')
  }

  if $database_max_pool_size != undef {
    warning('The database_max_pool_size parameter is deprecated and will be \
removed in a future realse. Use nova::db::database_max_pool_size instead')
  }

  if $database_max_retries!= undef {
    warning('The database_max_retries parameter is deprecated and will be \
removed in a future realse. Use nova::db::database_max_retries instead')
  }

  if $database_retry_interval != undef {
    warning('The database_retry_interval parameter is deprecated and will be \
removed in a future realse. Use nova::db::database_retry_interval instead')
  }

  if $database_max_overflow != undef {
    warning('The database_max_overflow parameter is deprecated and will be \
removed in a future realse. Use nova::db::database_max_overflow instead')
  }

  if $glance_endpoint_override != undef {
    warning('The glance_endpoint_override parameter is deprecated. \
Use nova::glance::endpoint_override instead.')
  }

  if $glance_num_retries != undef {
    warning('The glance_num_retries parameter is deprecated. \
Use nova::glance::num_retries instead.')
  }

  if $block_device_allocate_retries != undef {
    warning('The block_device_allocate_retries parameter is deprecated. \
Use nova::compute::block_device_allocate_retries instead')
  }

  if $block_device_allocate_retries_interval != undef {
    warning('The block_device_allocate_retries_interval parameter is deprecated. \
Use nova::compute::block_device_allocate_retries_interval instead')
  }

  if $use_ssl {
    if !$cert_file {
      fail('The cert_file parameter is required when use_ssl is set to true')
    }
    if !$key_file {
      fail('The key_file parameter is required when use_ssl is set to true')
    }
  }

  if $nova_public_key or $nova_private_key {
    file { '/var/lib/nova/.ssh':
      ensure  => directory,
      mode    => '0700',
      owner   => $::nova::params::nova_user,
      group   => $::nova::params::nova_group,
      require => Anchor['nova::config::begin'],
      before  => Anchor['nova::config::end'],
    }

    if $nova_public_key {
      if ! $nova_public_key['key'] or ! $nova_public_key['type'] {
        fail('You must provide both a key type and key data.')
      }

      ssh_authorized_key { 'nova-migration-public-key':
        ensure  => present,
        key     => $nova_public_key['key'],
        type    => $nova_public_key['type'],
        user    => 'nova',
        require => File['/var/lib/nova/.ssh'],
      }
    }

    if $nova_private_key {
      if ! $nova_private_key[key] or ! $nova_private_key['type'] {
        fail('You must provide both a key type and key data.')
      }

      $nova_private_key_file = $nova_private_key['type'] ? {
        'ssh-rsa'   => '/var/lib/nova/.ssh/id_rsa',
        'ssh-dsa'   => '/var/lib/nova/.ssh/id_dsa',
        'ssh-ecdsa' => '/var/lib/nova/.ssh/id_ecdsa',
        default     => undef
      }

      if ! $nova_private_key_file {
        fail("Unable to determine name of private key file.  Type specified was '${nova_private_key['type']}' \
but should be one of: ssh-rsa, ssh-dsa, ssh-ecdsa.")
      }

      file { $nova_private_key_file:
        content => $nova_private_key[key],
        mode    => '0600',
        owner   => $::nova::params::nova_user,
        group   => $::nova::params::nova_group,
        require => File['/var/lib/nova/.ssh'],
      }
    }
  }

  package { 'python-nova':
    ensure => $ensure_package,
    name   => $::nova::params::python_package_name,
    tag    => ['openstack', 'nova-package'],
  }

  package { 'nova-common':
    ensure  => $ensure_package,
    name    => $::nova::params::common_package_name,
    require => Package['python-nova'],
    tag     => ['openstack', 'nova-package'],
  }

  # used by debian/ubuntu in nova::network_bridge to refresh
  # interfaces based on /etc/network/interfaces
  exec { 'networking-refresh':
    command     => '/sbin/ifdown -a ; /sbin/ifup -a',
    refreshonly => true,
  }

  resources { 'nova_config':
    purge => $purge_config,
  }

  if $auth_strategy {
    warning('The auth_strategy parameter is deprecated, and will be removed in a future release.')
    nova_config { 'api/auth_strategy': value => $auth_strategy }
  }

  nova_config {
    'DEFAULT/ssl_only':              value => $ssl_only;
    'DEFAULT/cert':                  value => $cert;
    'DEFAULT/key':                   value => $key;
    'console/ssl_ciphers':           value => $console_ssl_ciphers;
    'console/ssl_minimum_version':   value => $console_ssl_minimum_version;
    'DEFAULT/my_ip':                 value => $my_ip;
    'DEFAULT/host':                  value => $host;
    'DEFAULT/cpu_allocation_ratio':  value => $cpu_allocation_ratio;
    'DEFAULT/ram_allocation_ratio':  value => $ram_allocation_ratio;
    'DEFAULT/disk_allocation_ratio': value => $disk_allocation_ratio;
    'DEFAULT/dhcp_domain':           value => $dhcp_domain;
  }

  oslo::messaging::rabbit {'nova_config':
    rabbit_use_ssl              => $rabbit_use_ssl,
    heartbeat_timeout_threshold => $rabbit_heartbeat_timeout_threshold,
    heartbeat_rate              => $rabbit_heartbeat_rate,
    heartbeat_in_pthread        => $rabbit_heartbeat_in_pthread,
    kombu_reconnect_delay       => $kombu_reconnect_delay,
    kombu_failover_strategy     => $kombu_failover_strategy,
    amqp_durable_queues         => $amqp_durable_queues,
    kombu_compression           => $kombu_compression,
    kombu_ssl_ca_certs          => $kombu_ssl_ca_certs,
    kombu_ssl_certfile          => $kombu_ssl_certfile,
    kombu_ssl_keyfile           => $kombu_ssl_keyfile,
    kombu_ssl_version           => $kombu_ssl_version,
    rabbit_ha_queues            => $rabbit_ha_queues,
  }

  oslo::messaging::amqp { 'nova_config':
    server_request_prefix => $amqp_server_request_prefix,
    broadcast_prefix      => $amqp_broadcast_prefix,
    group_request_prefix  => $amqp_group_request_prefix,
    container_name        => $amqp_container_name,
    idle_timeout          => $amqp_idle_timeout,
    trace                 => $amqp_trace,
    ssl_ca_file           => $amqp_ssl_ca_file,
    ssl_cert_file         => $amqp_ssl_cert_file,
    ssl_key_file          => $amqp_ssl_key_file,
    ssl_key_password      => $amqp_ssl_key_password,
    sasl_mechanisms       => $amqp_sasl_mechanisms,
    sasl_config_dir       => $amqp_sasl_config_dir,
    sasl_config_name      => $amqp_sasl_config_name,
    username              => $amqp_username,
    password              => $amqp_password,
  }

  # SSL Options
  if $use_ssl {
    nova_config {
      'DEFAULT/enabled_ssl_apis' : value => join($enabled_ssl_apis, ',');
      'ssl/cert_file' :            value => $cert_file;
      'ssl/key_file' :             value => $key_file;
      'wsgi/ssl_cert_file' :       value => $cert_file;
      'wsgi/ssl_key_file' :        value => $key_file;
    }
    if $ca_file {
      nova_config { 'ssl/ca_file' :
        value => $ca_file,
      }
      nova_config { 'wsgi/ssl_ca_file' :
        value => $ca_file,
      }
    } else {
      nova_config { 'ssl/ca_file' :
        ensure => absent,
      }
    }
  } else {
    nova_config {
      'DEFAULT/enabled_ssl_apis' : ensure => absent;
      'ssl/cert_file' :            ensure => absent;
      'ssl/key_file' :             ensure => absent;
      'ssl/ca_file' :              ensure => absent;
    }
  }

  oslo::messaging::default { 'nova_config':
    transport_url        => $default_transport_url,
    rpc_response_timeout => $rpc_response_timeout,
    control_exchange     => $control_exchange,
  }

  nova_config {
    'DEFAULT/long_rpc_timeout': value => $long_rpc_timeout;
  }

  oslo::messaging::notifications { 'nova_config':
    transport_url => $notification_transport_url,
    driver        => $notification_driver,
    topics        => $notification_topics,
  }

  nova_config {
    'DEFAULT/ovsdb_connection':                       ensure => 'absent';
    'vif_plug_ovs/ovsdb_connection':                  value => $ovsdb_connection;
    'notifications/notification_format':              value => $notification_format;
    # Following may need to be broken out to different nova services
    'DEFAULT/state_path':                             value => $state_path;
    'DEFAULT/service_down_time':                      value => $service_down_time;
    'DEFAULT/rootwrap_config':                        value => $rootwrap_config;
    'DEFAULT/report_interval':                        value => $report_interval;
  }

  oslo::concurrency { 'nova_config': lock_path => $lock_path }

  if $notify_on_state_change and $notify_on_state_change in ['vm_state', 'vm_and_task_state'] {
    nova_config {
      'notifications/notify_on_state_change': value => $notify_on_state_change;
    }
  } else {
    nova_config { 'notifications/notify_on_state_change': ensure => absent; }
  }

  nova_config {
    'cinder/cross_az_attach':     value => $cross_az_attach;
    'upgrade_levels/cells':       value => $upgrade_level_cells;
    'upgrade_levels/cert':        value => $upgrade_level_cert;
    'upgrade_levels/compute':     value => $upgrade_level_compute;
    'upgrade_levels/conductor':   value => $upgrade_level_conductor;
    'upgrade_levels/intercell':   value => $upgrade_level_intercell;
    'upgrade_levels/network':     value => $upgrade_level_network;
    'upgrade_levels/scheduler':   value => $upgrade_level_scheduler;
  }

  # TODO(tkajinam): Remove this when we remove the deprecated glance_* options
  include nova::glance
}
