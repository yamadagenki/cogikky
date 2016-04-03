class Wish < ActiveRecord::Base
  # belongs_to :category_id
  # belongs_to :user_id
  paginates_per 15

  validates :price_max, numericality: { only_integer: true }
  validates :price_min, numericality: { only_integer: true }
  validate  :price_validation

  def price_validation
    if price_max.present? && price_min.present?
      errors.add(:price_max, "#{price_min}より大きい値を入力してください") if price_max < price_min
    end
  end

  def images
    [image1.url, image2.url, image3.url]
  end

  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader

  def price_range
    "#{price_min.jpy_comma}円〜#{price_max.jpy_comma}円"
  end
end
