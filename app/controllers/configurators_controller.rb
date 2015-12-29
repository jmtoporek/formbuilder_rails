class ConfiguratorsController < ApplicationController
  before_action :set_configurator, only: [:show, :edit, :update, :destroy]

  # GET /configurators
  # GET /configurators.json
  def index
    @configurators = Configurator.all
  end

  # GET /configurators/1
  # GET /configurators/1.json
  def show
  end

  # GET /configurators/new
  def new
    @configurator = Configurator.new
  end

  # GET /configurators/1/edit
  def edit
  end

  # POST /configurators
  # POST /configurators.json
  def create
    @configurator = Configurator.new(configurator_params)

    respond_to do |format|
      if @configurator.save
        format.html { redirect_to @configurator, notice: 'Configurator was successfully created.' }
        format.json { render :show, status: :created, location: @configurator }
      else
        format.html { render :new }
        format.json { render json: @configurator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /configurators/1
  # PATCH/PUT /configurators/1.json
  def update
    respond_to do |format|
      if @configurator.update(configurator_params)
        format.html { redirect_to @configurator, notice: 'Configurator was successfully updated.' }
        format.json { render :show, status: :ok, location: @configurator }
      else
        format.html { render :edit }
        format.json { render json: @configurator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /configurators/1
  # DELETE /configurators/1.json
  def destroy
    @configurator.destroy
    respond_to do |format|
      format.html { redirect_to configurators_url, notice: 'Configurator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_configurator
      @configurator = Configurator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def configurator_params
      params.require(:configurator).permit(:name)
    end
end
