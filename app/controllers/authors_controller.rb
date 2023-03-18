class AuthorsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def show
    author = find_author

    render json: author
  end

  def create
    author = Author.create!(author_params)

    render json: author, status: :created
  end

  def update
    author = find_author
    author.update!(author_params)
    render json: author

  end

  private

  def author_params
    params.permit(:email, :name)
  end

  def find_author
    author = Author.find(params[:id])
  end

  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end
end
