module Authentication
  class RegisterController < ApplicationController

    def index
      render inertia: 'Authentication/Register', props: {}
    end

  end
end
