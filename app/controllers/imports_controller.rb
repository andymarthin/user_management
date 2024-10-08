class ImportsController < ApplicationController
  def index
    @import = Import.new
    @imports = Import.order(created_at: :desc)
  end

  def create
    @import = Import.new import_params
    if @import.save
      flash[:notice] = 'Successfully create import'
      StartImportUserJob.perform_async(@import.id)
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def import_params
    params.require(:import).permit(:file)
  end
end
