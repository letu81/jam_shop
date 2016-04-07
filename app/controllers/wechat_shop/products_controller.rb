class WechatShop::ProductsController < WechatShop::ApplicationController

  def show
    @product = Product.find(params[:id])
    @page_title = @product.title
    
    fresh_when(etag: [@product])
  end
    
end
