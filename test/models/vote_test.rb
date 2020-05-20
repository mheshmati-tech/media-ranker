require "test_helper"

describe Vote do
  before do
    @vote = votes(:vote_superdream)
  end
  describe "validations" do
    it "is valid with unique work id and user id" do
      expect(@vote.valid?).must_equal true
    end

    it "is invalid with on the same work by the same user" do
      first_vote = Vote.create(user_id: users(:mair), work_id: works(:superdream))
      second_vote = Vote.create(user_id: users(:mair), work_id: works(:superdream))

      vote_result = second_vote.valid?

      expect(vote_result).must_equal false
      expect(second_vote.errors.messages).must_include :work
      expect(second_vote.errors.messages).must_include :user
    end
  end
  describe "relations" do
    it "has a work" do
      expect(@vote.work.valid?).must_equal true
      expect(@vote.work).must_equal works(:superdream)
      expect(@vote.work_id).must_equal works(:superdream).id
    end

    it "has a user" do
      expect(@vote.user.valid?).must_equal true
      expect(@vote.user).must_equal users(:mair)
      expect(@vote.user_id).must_equal users(:mair).id
    end
  end
end
