class CollaboratorsController < ApplicationController
  def create
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.where('username LIKE :query OR email LIKE :query', query: "%#{params[:search]}%")
              .all_except(current_user)
              .first
    if @user
      @collaboration = Collaborator.new(wiki: @wiki, user: @user)
      if @collaboration.save
        flash[:notice] = "User successfully added to wiki."
      else
        flash[:error] = "There was a problem adding user. Please try again."
      end
    else
      flash[:error] = "Sorry that wasn't a valid username or email. Please try again."
    end
    redirect_to edit_wiki_path(@wiki)
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.find(params[:id])

    if @collaborator.destroy
      flash[:notice] = "\"#{User.find_by_id(@collaborator.user_id).username}\" was removed successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error removing the user."
      redirect_to edit_wiki_path(@wiki)
    end
  end
end
