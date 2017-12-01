class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new contact_params
    @contact.save ? contact_saved : contact_error
  end

  private

  def contact_params
    params.fetch(:contact, {}).permit(
      :name, :email, :message
    )
  end

  def contact_saved
    @contact = Contact.new
    flash.now[:success] = t('.success')
    respond_to do |format|
      format.html { render 'new' }
      format.js { render layout: false }
    end
  end

  def contact_error
    flash.now[:error] = @contact.errors.full_messages&.to_sentence
    respond_to do |format|
      format.html { render 'new' }
      format.js { render 'create_error', layout: false }
    end
  end

end
