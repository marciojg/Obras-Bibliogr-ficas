# -*- encoding : utf-8 -*-
class AuthorsController < ApplicationController
  # GET /authors
  def index
    @number_of_names = JSON.parse(params[:number_of_names]) if params[:number_of_names].present?
    @list_of_names = JSON.parse(params[:list_of_names]) if params[:list_of_names].present?

    @authors = []

    if @number_of_names.present? && @list_of_names.present? && @number_of_names.to_i == @list_of_names.count
      @list_of_names.each do |name|
        @authors << AuthorNameService.convert(name)
      end
    end

    render json: @authors
  end

  def author_params
    params.permit :number_of_names, list_of_names: []
  end
end
