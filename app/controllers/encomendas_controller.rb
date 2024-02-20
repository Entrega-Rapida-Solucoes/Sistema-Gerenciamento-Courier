class EncomendasController < ApplicationController
  before_action :set_encomenda, only: %i[ show edit update destroy ]

  def search
    data_entrega = params[:data_entrega]
    peso = params[:peso]
    transportadora_id = params[:transportadora_id]

    @encomendas = Encomenda.search(data_entrega, peso, transportadora_id)

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @encomendas }
    end
  end

  # GET /encomendas or /encomendas.json
  def index
    @encomendas = Encomenda.all

    if params[:data_entrega].present? || params[:peso].present? || params[:transportadora_id].present?
      @encomendas = Encomenda.search(params[:data_entrega], params[:peso], params[:transportadora_id])
    end
  end

  # GET /encomendas/1 or /encomendas/1.json
  def show
  end

  # GET /encomendas/new
  def new
    @encomenda = Encomenda.new
  end

  # GET /encomendas/1/edit
  def edit
  end

  # POST /encomendas or /encomendas.json
  def create
    @encomenda = Encomenda.new(encomenda_params)

    respond_to do |format|
      if @encomenda.save
        format.html { redirect_to encomenda_url(@encomenda), notice: "Encomenda was successfully created." }
        format.json { render :show, status: :created, location: @encomenda }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @encomenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /encomendas/1 or /encomendas/1.json
  def update
    respond_to do |format|
      if @encomenda.update(encomenda_params)
        format.html { redirect_to encomenda_url(@encomenda), notice: "Encomenda was successfully updated." }
        format.json { render :show, status: :ok, location: @encomenda }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @encomenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /encomendas/1 or /encomendas/1.json
  def destroy
    @encomenda.destroy

    respond_to do |format|
      format.html { redirect_to encomendas_url, notice: "Encomenda was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_encomenda
      @encomenda = Encomenda.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def encomenda_params
      params.require(:encomenda).permit(:peso, :status, :data_entrega, :destinatario_id, :remetente_id, :transportadora_id)
    end
end
