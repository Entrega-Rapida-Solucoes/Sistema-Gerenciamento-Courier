class RecebimentosController < ApplicationController
  before_action :set_recebimento, only: %i[ show edit update destroy ]

  # GET /recebimentos or /recebimentos.json
  def index
    @recebimentos = Recebimento.all
  end

  # GET /recebimentos/1 or /recebimentos/1.json
  def show
  end

  # GET /recebimentos/new
  def new
    @recebimento = Recebimento.new
  end

  # GET /recebimentos/1/edit
  def edit
  end

  # POST /recebimentos or /recebimentos.json
  def create
    @recebimento = Recebimento.new(recebimento_params)

    respond_to do |format|
      if @recebimento.save
        format.html { redirect_to recebimento_url(@recebimento), notice: "Recebimento was successfully created." }
        format.json { render :show, status: :created, location: @recebimento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recebimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recebimentos/1 or /recebimentos/1.json
  def update
    respond_to do |format|
      if @recebimento.update(recebimento_params)
        format.html { redirect_to recebimento_url(@recebimento), notice: "Recebimento was successfully updated." }
        format.json { render :show, status: :ok, location: @recebimento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recebimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recebimentos/1 or /recebimentos/1.json
  def destroy
    @recebimento.destroy

    respond_to do |format|
      format.html { redirect_to recebimentos_url, notice: "Recebimento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recebimento
      @recebimento = Recebimento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recebimento_params
      params.require(:recebimento).permit(:data_recebimento, :funcionario_id, :encomenda_id)
    end
end
