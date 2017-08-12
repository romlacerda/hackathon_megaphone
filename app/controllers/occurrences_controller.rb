class OccurrencesController < ApplicationController
  before_action :set_occurrence, only: [:show, :edit, :update, :destroy]

  # GET /occurrences
  # GET /occurrences.json
  def index
    @occurrences = Occurrence.all
  end

  # GET /occurrences/1
  # GET /occurrences/1.json
  def show
  end

  # GET /occurrences/new
  def new
    @occurrence = Occurrence.new
  end

  # GET /occurrences/1/edit
  def edit
  end

  # POST /occurrences
  # POST /occurrences.json
  def create
    #raise occurrence_params.inspect
    @occurrence = Occurrence.new(occurrence_params)
    @occurrence.save
    flash[:notice] ="Ocorrencia criada com sucesso"
    redirect_to root_path
  end
  # PATCH/PUT /occurrences/1
  # PATCH/PUT /occurrences/1.json
  def update
    if @occurrence.update(occurrence_params)
      #format.html { redirect_to @occurrence, notice: 'Occurrence was successfully updated.' }
      #format.json { render :show, status: :ok, location: @occurrence }
    else
      #format.html { render :edit }
      #format.json { render json: @occurrence.errors, status: :unprocessable_entity }
    end
  end


  # DELETE /occurrences/1
  # DELETE /occurrences/1.json
  def destroy
    @occurrence.destroy
    respond_to do |format|
      format.html { redirect_to occurrences_url, notice: 'Occurrence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_occurrence
      @occurrence = Occurrence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def occurrence_params
      params.require(:occurrence).permit(
        :data_begin, :status, :description, :user_id, :latitude, :longitude, :date_end,
        :type_id,
        :votes_attributes => [:id, :vote, :_destroy],
        :photo_occurrences_attributes => [:id, :photo, :_destroy]
      )
    end

end