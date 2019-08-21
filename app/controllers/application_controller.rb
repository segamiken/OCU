class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resourse)
		case resourse
		when Customer
			root_path
		when Admin
			admin_fuculties_path
		end
	end

	def after_sign_out_path_for(resourse)
		new_customer_session_path
	end


	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:customer_name, :customer_introduction, :admin_name, :admin_introduction])
	end
end
