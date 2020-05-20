require "test_helper"

describe User do
  before do
    @user = users(:mair)
  end
  describe "validations" do
    it "is valid when name is present" do
      expect(@user.valid?).must_equal true
    end

    it "is invalid when name is not present" do
      @user.name = nil

      user_result = @user.valid?
      expect(user_result).must_equal false
      expect(@user.errors.messages).must_include :name
    end
  end
  describe "relations" do
    it "can have many votes " do
      first_vote = votes(:vote_superdream)
      second_vote = votes(:vote_becoming)

      expect(@user.votes.count).must_equal 2
      @user.votes.each do |vote|
        expect(vote).must_be_instance_of Vote
      end
    end
  end
end
