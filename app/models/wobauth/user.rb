require_dependency 'wobauth/concerns/models/user_concerns'
class Wobauth::User < ActiveRecord::Base
  # dependencies within wobauth models
  include UserConcerns

  devise :database_authenticatable
end

