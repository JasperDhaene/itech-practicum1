class PeopleController < ApplicationController

  # GET /people
  def index
  end

  # POST /people
  # Parameters: email, name, birthdate
  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to @person
    else
      render 'new'
    end
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/:id/edit
  def edit
    @person = Person.find(params[:id])
  end

  # GET /people/:id
  def show
    @person = Person.find(params[:id])
  end

  # PUT/PATCH /people/:id
  # Parameters: email, name, birthdate
  def update
    @person = Person.find(params[:id])

    if @person.update(person_params)
      redirect_to @person
    else
      render 'edit'
    end
  end

  # DELETE /people/:id
  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    redirect_to people_path
  end

  # People allowed parameters
  private
  def person_params
     params.require(:person).permit(:email, :name, :birthdate)
  end

end
