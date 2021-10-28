module Dashboard
  class ApplicationController < ApplicationController
    before_action :require_user_logged_in!
  end
end