module Test
  module WebHelpers
    module_function

    def app
      TheaterApp::Web.app
    end
  end
end
