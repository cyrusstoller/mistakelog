class MistakesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_mistake, except: [:index, :new, :create]

  # GET /mistakes
  # GET /mistakes.json
  def index
    @mistakes = policy_scope(Mistake.order(id: :desc)).page(params[:page])
    authorize Mistake

    if params[:filter] == "incomplete"
      @title = "Without reflection"
      @mistakes = @mistakes.incomplete
      @active_sidenav = :without_reflection

      if @mistakes.length == 0
        flash[:notice] = "You don't have any mistakes waiting for your reflections."
        redirect_to action: :index
      end
    elsif params[:filter] == "complete"
      @title = "With reflection"
      @mistakes = @mistakes.complete
      @active_sidenav = :with_reflection

      if @mistakes.length == 0
        flash[:notice] = "You haven't reflected on any of your mistakes yet."
        redirect_to action: :index, filter: :incomplete
      end
    else
      @title = "Full list"
      @active_sidenav = :all_mistakes
    end
  end

  # GET /mistakes/1
  # GET /mistakes/1.json
  def show
  end

  # GET /mistakes/new
  def new
    @mistake = Mistake.new(reminder_date: Date.current + 2.weeks)
    authorize @mistake
    @title = "New mistake"
  end

  # GET /mistakes/1/edit
  def edit
    @title = "Edit mistake"
  end

  # POST /mistakes
  # POST /mistakes.json
  def create
    @mistake = Mistake.new(mistake_params)
    @mistake.user = current_user
    authorize @mistake

    respond_to do |format|
      if @mistake.save
        format.html { redirect_to @mistake, notice: 'Mistake was successfully created.' }
        format.json { render :show, status: :created, location: @mistake }
      else
        @title = "New mistake"
        format.html { render :new }
        format.json { render json: @mistake.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mistakes/1
  # PATCH/PUT /mistakes/1.json
  def update
    respond_to do |format|
      if @mistake.update(mistake_params)
        format.html { redirect_to @mistake, notice: 'Mistake was successfully updated.' }
        format.json { render :show, status: :ok, location: @mistake }
      else
        @title = "Edit mistake"
        format.html { render :edit }
        format.json { render json: @mistake.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mistakes/1
  # DELETE /mistakes/1.json
  def destroy
    @mistake.destroy
    respond_to do |format|
      format.html { redirect_to mistakes_url, notice: 'Mistake was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /mistakes/1/add_reflection
  def add_reflection
    @title = "Add reflection"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mistake
      @mistake = Mistake.find_by!(slug: params[:id])
      authorize @mistake
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mistake_params
      params.require(:mistake).permit(:description, :reflection, :description_rating, :reflection_rating, :reminder_date)
    end
end
