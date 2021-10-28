module Authentication
  class LoginController < ApplicationController

    def index
      render inertia: 'Authentication/Login', props: {}
    end

  end
end
