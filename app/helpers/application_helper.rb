module ApplicationHelper
  include Wobapphelpers::Helpers::All

  def group_link(dn)
    link_to dn, ad_users_path(query: "all:group:#{dn}"), class: 'primary-link'
  end
end
