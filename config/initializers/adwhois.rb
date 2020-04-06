module Adwhois
  CONFIGURATION_CONTROLLER = []
  CONFIG = YAML.load_file(File.join(Rails.root, 'config', 'adwhois.yml'))

  def self.ldap_options
    if CONFIG['ldap_options'].present?
      ldapopts = CONFIG['ldap_options']
      if ldapopts.kind_of? Hash
        ldapopts = [ldapopts]
      end
      ldapopts.each do |opts|
        opts.symbolize_keys!
        opts.each do |k,v|
          opts[k] = opts[k].symbolize_keys if opts[k].kind_of? Hash
        end
      end
    else
      nil
    end
  end

end
