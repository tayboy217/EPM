class Public::ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user_id = current_user.id
  if@contact.save
      redirect_to root_path
  else
    @contacts = Contact.all
    @users = User.all
      render :new
  end
  flash[:success] = 'お問い合わせを送信しました'
  end

  private
  def contact_params
      params.require(:contact).permit(:title, :body, :reply)
  end
end