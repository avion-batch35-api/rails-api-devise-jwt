require "test_helper"

class SecuredAssetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @secured_asset = secured_assets(:one)
  end

  test "should get index" do
    get secured_assets_url, as: :json
    assert_response :success
  end

  test "should create secured_asset" do
    assert_difference("SecuredAsset.count") do
      post secured_assets_url, params: { secured_asset: { account_balance: @secured_asset.account_balance, account_number: @secured_asset.account_number } }, as: :json
    end

    assert_response :created
  end

  test "should show secured_asset" do
    get secured_asset_url(@secured_asset), as: :json
    assert_response :success
  end

  test "should update secured_asset" do
    patch secured_asset_url(@secured_asset), params: { secured_asset: { account_balance: @secured_asset.account_balance, account_number: @secured_asset.account_number } }, as: :json
    assert_response :success
  end

  test "should destroy secured_asset" do
    assert_difference("SecuredAsset.count", -1) do
      delete secured_asset_url(@secured_asset), as: :json
    end

    assert_response :no_content
  end
end
