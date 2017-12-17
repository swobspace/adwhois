module Adwhois
  CONFIGURATION_CONTROLLER = []
  CONFIG = YAML.load_file(File.join(Rails.root, 'config', 'adwhois.yml'))

  def self.ldap_options
    if CONFIG['ldap_options'].present?
      opts = CONFIG['ldap_options'].symbolize_keys
      opts.each do |k,v|
        opts[k] = opts[k].symbolize_keys if opts[k].kind_of? Hash
      end
    else
      nil
    end
  end
end
