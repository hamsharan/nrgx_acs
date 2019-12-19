class Api::V1::PersonsController < Api::V1::BaseController
  def index
    respond_with Person.all
  end

  def create
    respond_with :api, :v1, Person.create(person_params)
  end

  def destroy
    respond_with Person.destroy(params[:id])
  end

  def update
    person = Person.find(params["id"])
    person.update_attributes(person_params)
    respond_with person, json: person
  end

  private

  def person_params
    params.require(:person).permit(:id, :full_name, :sin,:birthdate)
  end
end
