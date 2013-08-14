module BaseType
	extend ActiveSupport::Concern

	module ClassMethods

		def model_name
			superclass.model_name
		end

		def permit(*args)
      @_args = args
    end

    def _args
      @_args
    end
		
	end
end