require File.join(File.dirname(__FILE__), '..','..','..', 'puppet/provider/nova')

Puppet::Type.type(:nova_flavor).provide(
  :openstack,
  :parent => Puppet::Provider::Nova
) do
  desc <<-EOT
     Manage Nova flavor
  EOT

  @credentials = Puppet::Provider::Openstack::CredentialsV3.new

  def initialize(value={})
    super(value)
    @property_flush = {}
    @project_flush = {}
  end

  def create
    opts = [@resource[:name]]
    opts << (@resource[:is_public] == :true ? '--public' : '--private')
    (opts << '--id' << @resource[:id]) if @resource[:id]
    (opts << '--ram' << @resource[:ram]) if @resource[:ram]
    (opts << '--disk' << @resource[:disk]) if @resource[:disk]
    (opts << '--ephemeral' << @resource[:ephemeral]) if @resource[:ephemeral]
    (opts << '--vcpus' << @resource[:vcpus]) if @resource[:vcpus]
    (opts << '--swap' << @resource[:swap]) if @resource[:swap]
    (opts << '--rxtx-factor' << @resource[:rxtx_factor]) if @resource[:rxtx_factor]
    @property_hash = self.class.request('flavor', 'create', opts)
    if @resource[:properties]
      prop_opts = [@resource[:name]]
      prop_opts << props_to_s(@resource[:properties])
      self.class.request('flavor', 'set', prop_opts)
    end
    if @resource[:project]
      proj_opts = [@resource[:name]]
      proj_opts << '--project' << @resource[:project]
      self.class.request('flavor', 'set', proj_opts)
    end
    @property_hash[:ensure] = :present
  end

  def exists?
    @property_hash[:ensure] == :present
  end

  def destroy
    self.class.request('flavor', 'delete', @property_hash[:id])
  end

  mk_resource_methods

  def is_public=(value)
    fail('is_public is read only')
  end

  def id=(value)
    fail('id is read only')
  end

  def ram=(value)
    fail('ram is read only')
  end

  def disk=(value)
    fail('disk is read only')
  end

  def vcpus=(value)
    fail('vcpus is read only')
  end

  def swap=(value)
    fail('swap is read only')
  end

  def rxtx_factor=(value)
    fail('rxtx_factor is read only')
  end

  def properties=(value)
    @property_flush[:properties] = value
  end

  def project=(value)
    @project_flush[:project] = value
  end

  def self.instances
    request('flavor', 'list', ['--long', '--all']).collect do |attrs|
      project = request('flavor', 'show', [attrs[:id], '-c', 'access_project_ids'])

      access_project_ids = project[:access_project_ids]
      # Client can return None and this should be considered as ''
      if access_project_ids.downcase.chomp == 'none'
        project_value = ''
      # If the ids are formatted as Array, surrounding [] should be removed
      elsif access_project_ids.start_with?('[') and access_project_ids.end_with?(']')
        # TODO(tkajinam): We'd need to consider multiple projects can be returned
        project_value = access_project_ids[1..-2]
      else
        project_value = access_project_ids
      end
      properties = Hash[attrs[:properties].scan(/(\S+)='([^']*)'/)] rescue nil
      new(
          :ensure      => :present,
          :name        => attrs[:name],
          :id          => attrs[:id],
          :ram         => attrs[:ram],
          :disk        => attrs[:disk],
          :ephemeral   => attrs[:ephemeral],
          :vcpus       => attrs[:vcpus],
          :is_public   => attrs[:is_public].downcase.chomp == 'true'? true : false,
          :swap        => attrs[:swap],
          :rxtx_factor => attrs[:rxtx_factor],
          :properties  => properties,
          :project     => project_value
      )
    end
  end

  def self.prefetch(resources)
    flavors = instances
    resources.keys.each do |name|
      if provider = flavors.find{ |flavor| flavor.name == name }
        resources[name].provider = provider
      end
    end
  end

  def flush
    unless @property_flush.empty?
      opts = [@resource[:name]]
      opts << props_to_s(@property_flush[:properties])

      self.class.request('flavor', 'set', opts)
      @property_flush.clear
    end
    unless @project_flush.empty?
      opts = [@resource[:name]]
      unless @project_flush[:project]
        opts << '--project' << @project_flush[:project]
        self.class.request('flavor', 'set', opts)
      else
        opts << '--project' << @property_hash[:project]
        self.class.request('flavor', 'unset', opts)
      end
      @project_flush.clear
    end
  end
  private

  def props_to_s(props)
    props.flat_map{ |k, v| ['--property', "#{k}=#{v}"] }
  end
end

