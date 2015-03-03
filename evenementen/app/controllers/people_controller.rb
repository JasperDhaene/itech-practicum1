class PeopleController < ApplicationController

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(params[:person].permit(:email, :name, :birthdate))
    if @person.save
      redirect_to @person
    else
      render 'new'
    end
  end

  def show
    @person = Person.find(params[:id])
  end

  def index
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])

    if @person.update(params[:person].permit(:email, :name, :birthdate))
      redirect_to @person
    else
      render 'edit'
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    redirect_to people_path
  end

end
