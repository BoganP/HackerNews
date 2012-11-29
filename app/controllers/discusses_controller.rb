class DiscussesController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:show, :index]
  
  # GET /discusses
  # GET /discusses.json
  def index
    if params[:news_id]
      @news = News.find(params[:news_id])
      @discusses = @news.discusses
    else
      @discusses = Discuss.all
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @discusses }
    end
  end

  # GET /discusses/1
  # GET /discusses/1.json
  def show
    @discuss = Discuss.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @discuss }
    end
  end

  # GET /discusses/new
  # GET /discusses/new.json
  def new
    @discuss = Discuss.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @discuss }
    end
  end

  # GET /discusses/1/edit
  def edit
    @discuss = Discuss.find(params[:id])
    respond_to do |format|
      if @discuss.user_id != current_user.id
        format.html {redirect_to @discuss, notice: 'You cannot edit someone else\'s post'}
      end
    end
  end

  # POST /discusses
  # POST /discusses.json
  def create

    @discuss = Discuss.new(params[:discuss])
    @discuss.user_id = current_user.id
    @discuss.news_id = params[:news_id]

    
    respond_to do |format|
      if @discuss.save
        format.html { redirect_to @discuss, notice: 'Discuss was successfully created.' }
        format.json { render json: @discuss, status: :created, location: @discuss }
      else
        format.html { render action: "new" }
        format.json { render json: @discuss.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /discusses/1
  # PUT /discusses/1.json
  def update
    @discuss = Discuss.find(params[:id])

    respond_to do |format|
      if @discuss.update_attributes(params[:discuss])
        format.html { redirect_to @discuss, notice: 'Discuss was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @discuss.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discusses/1
  # DELETE /discusses/1.json
  def destroy
    @discuss = Discuss.find(params[:id])
    
    respond_to do |format|
      if (@discuss.user_id != current_user.id) 
        format.html {redirect_to @discuss, notice: 'You cannot delete someone else\'s post'}
      else
        @discuss.destroy
      end

    
      format.html { redirect_to discusses_url }
      format.json { head :no_content }
    end
  end
end
