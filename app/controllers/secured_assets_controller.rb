class SecuredAssetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_secured_asset, only: %i[ show update destroy ]

  # GET /secured_assets
  def index
    @secured_assets = SecuredAsset.all

    render json: @secured_assets
  end

  # GET /secured_assets/1
  def show
    render json: @secured_asset
  end

  # POST /secured_assets
  def create
    @secured_asset = SecuredAsset.new(secured_asset_params)

    if @secured_asset.save
      render json: @secured_asset, status: :created, location: @secured_asset
    else
      render json: @secured_asset.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /secured_assets/1
  def update
    if @secured_asset.update(secured_asset_params)
      render json: @secured_asset
    else
      render json: @secured_asset.errors, status: :unprocessable_entity
    end
  end

  # DELETE /secured_assets/1
  def destroy
    @secured_asset.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_secured_asset
      @secured_asset = SecuredAsset.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def secured_asset_params
      params.require(:secured_asset).permit(:account_number, :account_balance)
    end
end
