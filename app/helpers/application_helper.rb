module ApplicationHelper
  include Wobapphelpers::Helpers::All

  def group_link(dn)
    shortdn = dn.split(/,*..=/)[1]
    link_to shortdn, ad_users_path(query: "all:group:#{dn}"), 
                class: 'primary-link',
                data: { "turbo-prefetch" => "false" }
  end
end
