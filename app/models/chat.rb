class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validate :message_or_image_present

  mount_uploader :image, ImageUploader
  private

  def message_or_image_present
    if message.blank? && image.blank?
      errors.add(:message, "メッセージか画像を送信してください")
    end
  end
end
