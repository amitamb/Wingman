class SharagesController < ApplicationController
  # GET /sharages
  # GET /sharages.json
  def index
    @sharages = Sharage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sharages }
    end
  end

  # GET /sharages/1
  # GET /sharages/1.json
  def show
    @sharage = Sharage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sharage }
    end
  end

  # GET /sharages/new
  # GET /sharages/new.json
  def new
    @sharage = Sharage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sharage }
    end
  end

  # GET /sharages/1/edit
  def edit
    @sharage = Sharage.find(params[:id])
  end

  # POST /sharages
  # POST /sharages.json
  def create
    @sharage = Sharage.new(params[:sharage])

    respond_to do |format|
      if @sharage.save
        format.html { redirect_to @sharage, notice: 'Sharage was successfully created.' }
        format.json { render json: @sharage, status: :created, location: @sharage }
      else
        format.html { render action: "new" }
        format.json { render json: @sharage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sharages/1
  # PUT /sharages/1.json
  def update
    @sharage = Sharage.find(params[:id])

    respond_to do |format|
      if @sharage.update_attributes(params[:sharage])
        format.html { redirect_to @sharage, notice: 'Sharage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sharage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sharages/1
  # DELETE /sharages/1.json
  def destroy
    @sharage = Sharage.find(params[:id])
    @sharage.destroy

    respond_to do |format|
      format.html { redirect_to sharages_url }
      format.json { head :no_content }
    end
  end
end
