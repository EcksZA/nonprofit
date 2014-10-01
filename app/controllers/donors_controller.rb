class DonorsController < ApplicationController

  def index
    @donors = Donor.all
  end

  def new
    @donor = Donor.new
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def create
    @donor = Donor.new(donor_params)
    if @donor.save
      flash[:notice] = "Donor information saved"
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      render 'new'
    end
  end

  def show
    @donor = Donor.find(params[:id])
  end

  def edit
    @donor = Donor.find(params[:id])
  end

  def update
    @donor = Donor.find(params[:id])
    if @donor.update(donor_params)
      flash[:notice] = "Donor information updated"
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      render 'edit'
    end
  end

  def destroy
    @donor = Donor.find(params[:id])
    @donor.destroy
    flash[:notice] = "Account has been deleted"
    redirect_to root_path
  end

private
  def donor_params
    params.require(:donor).permit(:first_name, :last_name)
  end
end
