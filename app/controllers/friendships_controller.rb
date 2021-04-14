class FriendshipsController < ApplicationController
  def new
    member1 = Member.find(params[:id])
    member2 = Member.find(params[:member_id])

    Member.transaction(requires_new: true) do
      member1.befriend(member2)
      member2.befriend(member1)
    end

    respond_to do |format|
      format.html { redirect_to member_path(member1), notice: 'Friendship added.' }
    end
  end

  def destroy
    member1 = Member.find(params[:id])
    member2 = Member.find(params[:member_id])

    Member.transaction(requires_new: true) do
      member1.unfriend(member2)
      member2.unfriend(member1)
    end

    respond_to do |format|
      format.html { redirect_to member_path(member1), notice: 'Friendship removed.' }
    end
  end
end
