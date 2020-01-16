# -*- encoding : utf-8 -*-
class Api::V1::AuthorsController < ApplicationController
  # GET /authors
  def index
    @number_names = JSON.parse(params[:number_names]) if params[:number_names].present?
    @list_names = JSON.parse(params[:list_names]) if params[:list_names].present?

    render json: authors_result
  end

  private

  def authors_result
    authors = []

    if @number_names.present? && @list_names.present? && @number_names.to_i == @list_names.count
      @list_names.each do |name|
        authors << AuthorNameService.change_for_author_name(name)
      end
    end

    authors
  end

  def author_params
    params.permit :number_names, list_names: []
  end
end
