class FormelementsController < ApplicationController
  before_action :set_formelement, only: [:show, :edit, :update, :destroy]
  before_action :set_configurator

  # GET /formelements
  # GET /formelements.json
  # TODO do we even need this? List of formelements only shown in context of configurator
  def index
    @formelements = Formelement.all
  end

  # GET /formelements/1
  # GET /formelements/1.json
  def show
  end

  # GET /formelements/new
  def new
    @formelement = Formelement.new
  end

  # GET /formelements/1/edit
  def edit
  end

  # POST /formelements
  # POST /formelements.json
  def create
    @formelement = get_new_form_element_by_type(formelement_params)
    @formelement.configurator_id = params[:configurator_id]

    respond_to do |format|
      if @formelement.save
        format.html { redirect_to configurator_path(@formelement.configurator_id), notice: 'formelement was successfully created.' }
        format.json { render :show, status: :created, location: @formelement }
      else
        format.html { render :new }
        format.json { render json: @formelement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formelements/1
  # PATCH/PUT /formelements/1.json
  def update
    respond_to do |format|
      if @formelement.update(formelement_params)
        format.html { redirect_to configurator_formelement_path(@formelement.configurator_id, @formelement), notice: 'Formelement was successfully updated.' }
        format.json { render :show, status: :ok, location: @formelement }
      else
        format.html { render :edit }
        format.json { render json: @formelement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formelements/1
  # DELETE /formelements/1.json
  def destroy
    @formelement.destroy
    respond_to do |format|
      format.html { redirect_to formelements_url, notice: 'Formelement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def get_new_form_element_by_type(params)
    type = params[:type]
    formelement = case type
    when 'Selectfield'
      Selectfield.new(params)
    when 'Textfield'
      Textfield.new(params)
    else
      Formelement.new(params)
    end
    formelement
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formelement
      @formelement = Formelement.find(params[:id])      
    end

    def set_configurator
      @configurator = Configurator.find(params[:configurator_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formelement_params
      params.require(:formelement).permit(:name, :label, :type)
    end
end
