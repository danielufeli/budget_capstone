class TransController < ApplicationController
  load_and_authorize_resource
  def index
    @category = Category.find(params[:category_id])
    @category_trans = CategoryTran.includes(:tran)
      .where(category_id: params[:category_id]).order(created_at: :desc)
  end

  def new
    @tran = Tran.new
    @categories = current_user.categories
  end

  def create
    @tran = Tran.new(name: params[:name], amount: params[:amount])
    @tran.author_id = current_user.id
    respond_to do |format|
      if @tran.save
        category_tran = CategoryTran.new(category_id: params[:categories], tran_id: @tran.id)
        category_tran.save
        format.html do
          redirect_to category_trans_path(category_id: params[:categories]),
                      notice: 'Transaction created successfully'
        end
      else
        format.html { render :new, alert: 'Failed to create transaction' }
      end
    end
  end
end
