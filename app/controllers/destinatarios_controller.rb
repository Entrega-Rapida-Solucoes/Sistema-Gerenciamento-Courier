class DestinatariosController < ApplicationController
  before_action :set_destinatario, only: %i[ show edit update destroy ]

  # GET /destinatarios or /destinatarios.json
  def index
    @destinatarios = Destinatario.all
  end

  # GET /destinatarios/1 or /destinatarios/1.json
  def show
  end

  # GET /destinatarios/new
  def new
    @destinatario = Destinatario.new
    @destinatario.build_endereco
  end

  # GET /destinatarios/1/edit
  def edit
  end

  # POST /destinatarios or /destinatarios.json
  def create
    @destinatario = Destinatario.new(destinatario_params)

    respond_to do |format|
      if @destinatario.save
        format.html { redirect_to destinatario_url(@destinatario), notice: "Destinatario was successfully created." }
        format.json { render :show, status: :created, location: @destinatario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @destinatario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /destinatarios/1 or /destinatarios/1.json
  def update
    respond_to do |format|
      if @destinatario.update(destinatario_params)
        format.html { redirect_to destinatario_url(@destinatario), notice: "Destinatario was successfully updated." }
        format.json { render :show, status: :ok, location: @destinatario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @destinatario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /destinatarios/1 or /destinatarios/1.json
  def destroy
    @destinatario.destroy

    respond_to do |format|
      format.html { redirect_to destinatarios_url, notice: "Destinatario was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_destinatario
      @destinatario = Destinatario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def destinatario_params
      params.require(:destinatario).permit(:nome, :data_nascimento, :cpf, :email, :telefone, endereco_attributes: [:cep, :logradouro, :numero, :complemento, :cidade, :bairro, :pais, :codigo_postal])
    end
end
