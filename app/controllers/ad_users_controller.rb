class AdUsersController < ApplicationController
  def index
    if search_params.present?
      result = SearchAdUserService.new(search_params.to_h).call
      unless result.success?
        flash[:error] = result.error_messages.join(", ")
      end
      @ad_users = result.ad_users
    else
      @ad_users = []
    end

    respond_to do |format|
      format.html {}
      format.turbo_stream {
        render turbo_stream: turbo_stream.replace("results", partial: "ad_users/results")
      }
    end
  end

private

  def search_params
    params.permit(:query, :utf8, :authenticity_token, :bci).slice(:query)
  end
end
