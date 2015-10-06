class OrderItemsWorker
  include Sidekiq::Worker

  def perform(id)
    OrderItem.find(id).destroy
  end
end