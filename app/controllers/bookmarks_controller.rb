class BookmarksController < ApplicationController
  before_filter :load_bookmarks

  def show
    @index = params[:id].to_i
    @bookmark = @bookmarks[@index-1]
  end

  def destroy
    @index = params[:id].to_i
    @bookmark = @bookmarks[@index-1]
    @bookmark.delete
    redirect_to bookmark_path(@index)
  end

  protected

  def load_bookmarks
    i = Instascraper.new(ENV['INSTAPAPER_USERNAME'], ENV['INSTAPAPER_PASSWORD'])
    @bookmarks = i.bookmarks
  end
end