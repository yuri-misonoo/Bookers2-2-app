class SearchsController < ApplicationController
  def search
    @model = params["model"]
    @content = params["content"]
    @method = params["method"]
    @record = search_for(@model, @content, @method)
  end
  
  private
  def search_for(model, content, method)
    if model == 'user'
      if model == 'perfect'
        User.where(name: content)
      elsif model == 'forward'
        User.where('name LIKE ?', content+'%')
      elsif model == 'backward'
        User.where('name LIKE ?', '%'+content)
      elsif model == 'partial'
        User.where('name LIKE ?', '%'+content+'%')
      end
    elsif model == 'book'
      if model == 'perfect'
        User.where(name: content)
      elsif model == 'forward'
        User.where('title LIKE ?', content+'%')
      elsif model == 'backward'
        User.where('title LIKE ?', '%'+content)
      elsif model == 'partial'
        User.where('title LIKE ?', '%'+content+'%') 
      end
    end      
  end
end
