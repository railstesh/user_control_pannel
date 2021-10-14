class XlsxImportService
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def import
    headers = data.row(1) # get header row

    data.each_with_index do |row, idx|
      next if idx == 0 # skip header

      # create hash from headers and cells
      order_data = Hash[[headers, row].transpose]

      next if Order.exists?(order_id: order_data['Order ID'])

      save_data(order_data)
    end
  end

  private

  def save_data(data)
    product  = save_product_details(data)
    customer = save_customer_details(data)
    order    = save_order_details(data, product, customer)
    save_billing_details(data, order)
    save_shipping_details(data, order)
    save_revenue_details(data, product)
    save_address_details(data, customer)
    save_category_details(data, product)
  end

  def save_product_details(data)
    product = Product.new
    product.product_id = data['Product ID']
    product.name       = data['Product Name']
    product.sku        = data['Product SKU']
    product.weight     = data['Product Size']
    product.size       = data['Total Weight']
    product.save!
    product
  end

  def save_customer_details(data)
    customer = Customer.find_or_initialize_by(email: data['Customer Email'])
    customer.customer_id = data['Customer Id']
    customer.name        = data['Customer Name']
    customer.email       = data['Customer Email']
    customer.group       = data['Customer Group']
    customer.save!
    customer
  end

  def save_order_details(data, product, customer)
    order = Order.new
    order.order_id      = data['Order ID']
    order.ref_order_no  = data['Ref Order No']
    order.purchase_date = data['Purchase Date']
    order.status        = data['Status']
    order.coupon_code   = data['Coupon Code']
    order.product_id    = product.id
    order.customer_id   = customer.id
    order.save!
    order
  end

  def save_billing_details(data, order)
    billing = Billing.new
    billing.qty             = data['Qty']
    billing.currency        = data['Currency']
    billing.item_base_price = data['Item Base Price']
    billing.item_price      = data['Item Price']
    billing.sub_total       = data['Subtotal']
    billing.discount_amount = data['Discount Amount']
    billing.tax_amount      = data['Tax Amount']
    billing.grand_total     = data['Grand Total']
    billing.payment_method  = data['Payment Method']
    billing.order_id        = order.id
    billing.save!
  end

  def save_shipping_details(data, order)
    shipping = Shipping.new
    shipping.shipping_amount  = data['Shipping Amount']
    shipping.shipping_method  = data['Shipping Method']
    shipping.region_date      = data['Region Date']
    shipping.order_id         = order.id
    shipping.save!
  end

  def save_revenue_details(data, product)
    revenue = Revenue.new
    revenue.total_order   = data['Total Order']
    revenue.total_revenue = data['Total Revenue']
    revenue.product_id    = product.id
    revenue.save!
  end

  def save_category_details(data, product)
    category = Category.new
    category.primary_category_id   = data['Primary Category Id']
    category.primary_category_name = data['Primary Category Name']
    category.product_id            = product.id
    category.save!
  end

  def save_address_details(data, customer)
    address = Address.new
    address.city        = data['City']
    address.state       = data['State']
    address.country     = data['Country']
    address.postcode    = data['Postcode']
    address.customer_id = customer.id
    address.save!
  end
end
