class PeopleController < ApplicationController

  # GET /people/1
  # GET /people/1.json
  def show
    @person = Person.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @person }
    end
  end

  # GET /people/1/edit
  def edit
    @person = current_user.person || current_user.build_person
    @person.location = current_user.location if @person.new_record?
  end

  # POST /people
  # POST /people.json
  def create
    @person = current_user.build_person(params[:person])
    @person.user = current_user

    respond_to do |format|
      if @person.save
        format.html { redirect_to :root, notice: 'Person was successfully created.' }
        format.json { render json: @person, status: :created, location: @person }
      else
        format.html { render action: "new" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.json
  def update
    @person = current_user.person #.find(params[:id])

    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html { redirect_to edit_person_path(@person), notice: 'Person was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def suggested
  end

end
