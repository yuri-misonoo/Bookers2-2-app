class SearchsController < ApplicationController
  before_action :authenticate_user!

  def search
    @model = params["model"]
    @content = params["content"]
    @method = params["method"]
    @records = search_for(@model, @content, @method)
  end

  private
  def search_for(model, content, method)
    if model == 'user'
      if method == 'perfect'
        User.where(name: content)
      elsif method == 'forward'
        User.where('name LIKE ?', content+'%')
      elsif method == 'backward'
        User.where('name LIKE ?', '%'+content)
      elsif method == 'partial'
        User.where('name LIKE ?', '%'+content+'%')
      end
    elsif model == 'book'
      if method == 'perfect'
        User.where(title: content)
      elsif method == 'forward'
        User.where('title LIKE ?', content+'%')
      elsif method == 'backward'
        User.where('title LIKE ?', '%'+content)
      elsif method == 'partial'
        User.where('title LIKE ?', '%'+content+'%')
      end
    end
  end
end
