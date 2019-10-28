module Test
  module DatabaseHelpers
    module_function

    def rom
      TheaterApp::Container["persistence.rom"]
    end

    def db
      TheaterApp::Container["persistence.db"]
    end
  end
end
