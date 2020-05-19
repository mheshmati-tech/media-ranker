require "test_helper"

describe Vote do
  describe "relations" do
    it "has a work" do
      vote = votes(:vote_superdream)

      expect(vote.work).must_equal works(:superdream)
    end

    it "has a user" do
    end

    it "can set the vote" do
      vote = Vote.new(work: works(:superdream))
      expect(vote.work_id).must_equal works(:superdream).id
    end
  end
end
