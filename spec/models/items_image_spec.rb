require "rails_helper"
describe ItemsImage do
  describe "#new" do
    it "is valid without a image_url" do
      items_image = build(:items_image, image_url: "")
      items_image.valid?
      expect(items_image.errors[:image_url]).to include("を入力してください")
    end
  end
end