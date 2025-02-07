class ApplicationController < ActionController::Base
  # -- breadcrumbs
  include Wobapphelpers::Breadcrumbs
  # before_action :add_breadcrumb_index, only: [:index]
  before_action :add_breadcrumb_index,
                :if => proc {|c| !devise_controller? && c.action_name == 'index' }

  # -- flash responder
  self.responder = Wobapphelpers::Responders
  respond_to :html, :json

  protect_from_forgery with: :exception
end
