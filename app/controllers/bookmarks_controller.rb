class BookmarksController < ApplicationController
  before_filter :load_bookmarks

  def show
    @index = params[:id].to_i
    if @index >= @bookmarks.length
      redirect_to bookmarks_path
    else 
      @bookmark = @bookmarks[@index-1]
    end
  end

  def destroy
    @index = params[:id].to_i
    @bookmark = @bookmarks[@index-1]
    @bookmark.delete
    if @bookmarks.length == 1
      redirect_to bookmarks_path
    else
      redirect_to bookmark_path((@index == 1 ? 1 : @index-1))
    end
  end

  protected

  def load_bookmarks
    i = Instascraper.new(ENV['INSTAPAPER_USERNAME'], ENV['INSTAPAPER_PASSWORD'])
    @bookmarks = i.bookmarks
  end
end