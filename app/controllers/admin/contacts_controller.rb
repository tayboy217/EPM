class Admin::ContactsController < ApplicationController
  
  def index
    @contacts = Contact.page(params[:page]).order(created_at: :desc).per(10)
    @users = User.all
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    contact = Contact.find(params[:id])
    contact.update(contact_params)
    ContactMailer.send_when_admin_reply(user, contact).deliver_now #確認メールを送信
    redirect_to admin_contacts_path
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    @contacts = Contact.page(params[:page]).order(created_at: :desc).per(10)
    @users = User.all
    render :index
  end
  
  private
  def contact_params
      params.require(:contact).permit(:title, :body, :reply)
  end
end
