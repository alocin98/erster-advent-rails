# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  layout "auth"
   # GET /resource/confirmation/new
   def new
     super
   end

   # POST /resource/confirmation
   def create
     super
   end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    super do |resource|
      sign_in(resource_name, resource) if resource.errors.empty?
    end
  end

  def pending
  end

   # protected

   # The path used after resending confirmation instructions.
   def after_resending_confirmation_instructions_path_for(resource_name)
     confirmation_pending_path
   end

  # The path used after confirmation.
  def after_confirmation_path_for(resource_name, resource)
    stored_location_for(resource) || edit_app_mystore_path
  end
end
