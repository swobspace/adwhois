namespace :sqlite do
  desc "Upgrade sqlite booleans to integer"
  task upgrade_boolean: :environment do
    if ActiveRecord::Base.connection.adapter_name =~ /sqlite/i
      Wobauth::Membership.where("auto = 't'").update_all(auto: 1)
      Wobauth::Membership.where("auto = 'f'").update_all(auto: 0)
    end
  end

end
