class PhonesController < ApplicationController
    before_action :set_contact

  # DELETE /contacts/1/phones
  def destroy
    @contact.phones.destroy
  end

  # POST /contacts/1/phones
  def create
    @contact.phones = Phones.new(phones_params)

    if @contact.save
      render json: @contact.phones, status: :created, location: contact_phones_url(@contact)
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1/phones
  def update
    if @contact.phones.update(phones_params)
      render json: @contact.phones
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # GET /contacts/1/phones
  def show
    render json: @contact.phones
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
        @contact = Contact.find(params[:contact_id])
    end

    def phones_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end

end