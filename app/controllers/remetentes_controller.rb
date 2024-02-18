class RemetentesController < ApplicationController
  before_action :set_remetente, only: %i[ show edit update destroy ]

  # GET /remetentes or /remetentes.json
  def index
    @remetentes = Remetente.all
  end

  # GET /remetentes/1 or /remetentes/1.json
  def show
  end

  # GET /remetentes/new
  def new
    @remetente = Remetente.new
    @remetente.build_endereco
  end

  # GET /remetentes/1/edit
  def edit
  end

  # POST /remetentes or /remetentes.json
  def create
    @remetente = Remetente.new(remetente_params)

    respond_to do |format|
      if @remetente.save
        format.html { redirect_to remetente_url(@remetente), notice: "Remetente was successfully created." }
        format.json { render :show, status: :created, location: @remetente }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @remetente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /remetentes/1 or /remetentes/1.json
  def update
    respond_to do |format|
      if @remetente.update(remetente_params)
        format.html { redirect_to remetente_url(@remetente), notice: "Remetente was successfully updated." }
        format.json { render :show, status: :ok, location: @remetente }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @remetente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /remetentes/1 or /remetentes/1.json
  def destroy
    @remetente.destroy

    respond_to do |format|
      format.html { redirect_to remetentes_url, notice: "Remetente was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_remetente
      @remetente = Remetente.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def remetente_params
      params.require(:remetente).permit(:nome, :email, :telefone, endereco_attributes: [:cep, :logradouro, :numero, :complemento, :cidade, :bairro, :pais, :codigo_postal])
    end
end
