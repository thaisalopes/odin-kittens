class KittensController < ApplicationController
  before_action :set_kitten, only: %i[ show edit update destroy ]

  # GET /kittens or /kittens.json
  def index
    @kittens = Kitten.all
  end

  # GET /kittens/1 or /kittens/1.json
  def show
    @kitten = Kitten.find(params[:id])
  end

  # GET /kittens/new
  def new
    @kitten = Kitten.new
  end

  # GET /kittens/1/edit
  def edit
    @kitten = Kitten.find(params[:id])
    render :edit
end

  # POST /kittens or /kittens.json
  def create
    @kitten = Kitten.new(kitten_params)

    respond_to do |format|
      if @kitten.save
        format.html { redirect_to @kitten, notice: "Kitten was successfully created." }
        format.json { render :show, status: :created, location: @kitten }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kitten.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kittens/1 or /kittens/1.json
  def update
    @kitten = Kitten.find(params[:id])
    @kitten.update(kitten_params)
    redirect_to kittens_path(@kitten)
  end

  # DELETE /kittens/1 or /kittens/1.json
  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    redirect_to kittens_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kitten
      @kitten = Kitten.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end
