class CommentsController < ApplicationController
  def create
    @comment = current_person.comments.build(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html {
          redirect_to items_path, notice: 'Comment was successfully created.'
        }
        format.json { render json: @item, status: :created, location: @item }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy
    @comment = current_person.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
      format.js
    end
  end
end
