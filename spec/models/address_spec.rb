require "rails_helper"
describe Address do
  describe "#create" do

    it "is valid with a zip,prefecture,city,number,building" do
      user=create(:user)
      address = build(:address,user_id: user.id)
      expect(address).to be_valid
    end

    it "is invalid without a zip" do
      address = build(:address, zip: "")
      address.valid?
      expect(address.errors[:zip]).to include("を入力してください")
    end

    it "is invalid without a prefecture" do
      address = build(:address, prefecture: "")
      address.valid?
      expect(address.errors[:prefecture]).to include("を入力してください")
    end

    it "is invalid without a city" do
      address = build(:address, city: "")
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end

    it "is invalid without a number" do
      address = build(:address, number: "")
      address.valid?
      expect(address.errors[:number]).to include("を入力してください")
    end

  end
end
