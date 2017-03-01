class SnippetsController < ApplicationController
  prepend_before_filter :require_login!

  def index
    # TODO: add pagination
    @snippets = Snippet.all
  end

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new(snippet_params)
    @snippet.user = current_user

    if @snippet.save
      flash[:notice] = 'Snippet has been created successfully.'
      redirect_to(@snippet)
    else
      render('new')
    end
  end

  def show
    @snippet = Snippet.find(params[:id])
  end

  def destroy
  end

  private

  def snippet_params
    params.require(:snippet).permit(:name, :text, :settings)
  end
end
