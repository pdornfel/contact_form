class InquiriesController < ApplicationController
  before_action :set_inquiry, only: [:show, :destroy]

  def index
    @inquiries = Inquiry.all
  end

  def new
    @inquiry = Inquiry.new
  end

  def show
  end

  def destroy
    @inquiry.destroy
    flash["alert-box"] = "Inquiry Deleted"
    redirect_to inquiries_path
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      flash["alert-box info radius"] = "Inquiry created successfully"
      redirect_to @inquiry
    else
      flash["alert-box warning radius"] = "Inquiry not created"
      render 'new'
    end
  end

  private
  def inquiry_params
    params.require(:inquiry).permit(:first_name, :last_name, :email, :subject, :description)
  end

  def set_inquiry
    @inquiry = Inquiry.find(params[:id])
  end


end