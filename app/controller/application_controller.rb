class ApplicationController < ActionController::Base
    def hello
    render html: "hello jemmy"
    end
end
