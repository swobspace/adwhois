class ApplicationController < ActionController::Base
  # -- breadcrumbs
  include Wobapphelpers::Breadcrumbs
  before_action :add_breadcrumb_index, only: [:index]

  # -- flash responder
  self.responder = Wobapphelpers::Responders
  respond_to :html, :json

  protect_from_forgery with: :exception
end
